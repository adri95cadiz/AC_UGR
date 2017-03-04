#include <stdlib.h>
#include <stdio.h>
#include <time.h>

#define MAX 33554432 //=2^25
double v1[MAX], v2[MAX], v3[MAX];

void sum(int N){
int i;
for(i=0; i<N; i++){
v1[i] =N*0.1+i*0.1;
v2[i] = N*0.1-i*0.1; 
}
}

void sum2(int N){
int i;
for(i=0; i<N; i++)
v3[i] = v1[i] + v2[i];
}

int main(int argc, char** argv){
int i;
struct timespec cgt1,cgt2;
double ncgt;

unsigned int N = atoi(argv[1]);

if (N>MAX) N=MAX;

if (argc<2){
printf("Faltan nº componentes del vector\n");
exit(-1);
}


#pragma omp sections
{
#pragma omp section
{
sum(N);
}
#pragma omp section
{
omp_get_wtime(CLOCK_REALTIME,&cgt1);
sum2(N);
omp_get_wtime(CLOCK_REALTIME,&cgt2);
}
}
ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+(double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));
printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u\t/ V1[0]+V2[0]=V3[0](%8.6f+%8.6f=%8.6f) / /V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) /\n",ncgt,N,v1[0],v2[0],v3[0],N-1,N-1,N-1,v1[N-1],v2[N-1],v3[N-1]);
return 0;
}
