#include <stdio.h>
#include <stdlib.h>
#include <time.h> 
#ifdef _OPENMP
#include <omp.h>
#else
#define omp_get_thread_num() 0
#endif

main(int argc, char **argv) {
struct timespec cgt1,cgt2; 
double ncgt;
int i, j, filas, columnas, v[100], M[100][100],s[100];

if(argc < 3) {
fprintf(stderr,"Falta filas o columnas\n");
exit(-1);
}

filas = atoi(argv[1]);
columnas = atoi(argv[2]);

for(i=0;i<filas;i++){
v[i]=i;
s[i]=0;
}

for(i=0;i<filas;i++)
#pragma omp parallel for
for(j=0;j<columnas;j++)
M[i][j]=i+j;

clock_get_time(CLOCK_REALTIME,&cgt1); 

for(i=0;i<filas;i++)
#pragma omp parallel for reduction(+:s[i])
for(j=0;j<columnas;j++)
s[i]+=v[i]*M[i][j];

clock_get_time(CLOCK_REALTIME,&cgt2); 

#pragma omp parallel for 
for(i=0;i<filas;i++)
printf("s[%d]= %d ", i, s[i]);

printf("\n");

ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+(double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9)); 
printf("Tiempo(seg.):%11.9f \n",ncgt); 
return 0; 

}
