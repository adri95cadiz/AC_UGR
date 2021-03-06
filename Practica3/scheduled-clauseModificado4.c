#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
#include <omp.h>
#else
#define omp_get_thread_num() 0
#endif

main(int argc, char **argv) {
int i, n=20,chunk,a[n],suma=0;
omp_sched_t kind;
int modifier;

if(argc < 3) {
fprintf(stderr,"\nFalta iteraciones o chunk \n");
exit(-1);
}
n = atoi(argv[1]); if (n>200) n=200; chunk = atoi(argv[2]);

for (i=0; i<n; i++) a[i] = i;

#pragma omp parallel 
{
#pragma opm for firstprivate(suma) \
lastprivate(suma) schedule(dynamic,chunk)
for (i=0; i<n; i++)
{
suma = suma + a[i];
printf(" thread %d suma a[%d]=%d suma=%d \n", omp_get_thread_num(),i,a[i],suma);
}

#pragma omp master 
{
printf("num_threads=%d\n",omp_get_num_threads());
printf("num_procs=%d\n",omp_get_num_procs());
printf("in_parallel=%d\n",omp_in_parallel());
}

}

printf("Fuera de 'parallel for' suma=%d\n",suma);

printf("num_threads=%d\n",omp_get_num_threads());
printf("num_procs=%d\n",omp_get_num_procs());
printf("in_parallel=%d\n",omp_in_parallel());
}
	
