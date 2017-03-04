#include<functional>
#include<numeric>
#include<random>
#include<time.h>
#include<iostream>

const int N = 5000, REP = 4000;
std::default_random_engine generator(N * REP);
std::uniform_int_distribution<int> distribution(0, 9);
auto rng = std::bind(distribution, generator);
struct S
{
int a[N], b[N];
S(){
for(int i=0; i<N; ++i){
a[i] = rng();
b[i] = rng();
}
}
} s;

int main()
{
time_t t_inicio, t_final;
double tiempo;
int R[REP];
t_inicio=clock();
for (int ii = 0; ii < REP; ++ii)
{
int X1, X2;
for (int i = 0; i < N; ++i){
X1 = 2 * s.a[i] + ii;
X2 = 3 * s.b[i] - ii;
}

if (X1 < X2)
R[ii] = X1;
else
R[ii] = X2;
}

t_final=clock();
tiempo = ((double)(t_final - t_inicio))/CLOCKS_PER_SEC;
std::cout << tiempo << "\n";
return std::accumulate(R, R + REP, 0);
}

