#include <stdio.h>
#include <stdlib.h>


main(int argc, char **argv) {
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
for(j=0;j<columnas;j++)
M[i][j]=i+j;

for(i=0;i<filas;i++)
for(j=0;j<columnas;j++)
s[i]+=v[i]*M[i][j];

for(i=0;i<filas;i++)
printf("s[%d]= %d ", i, s[i]);

printf("\n");

}
