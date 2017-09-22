//http://www.infoarena.ro/problema/elmaj
#include <iostream>
#include <fstream>

using namespace std;

ifstream fin("elmaj.in");
ofstream fout("elmaj.out");

int main()
{
    int n, mx=-2e15;
    fin>>n;
    int v[n];
    for (int i=0; i<n; i++) {
        fin>>v[i];
        if (mx<v[i]) mx=v[i];
    }
    int f[mx];
    for (int i=1; i<=mx; i++) {
        f[i]=0;
    }
    for (int i=0; i<n; i++) {
        f[v[i]]++;
    }
    for (int i=1; i<=mx; i++) {
        if (f[i]>=(n/2+1)) {
            fout<<i;
            fout<<" "<<f[i];
        }
    }

}
