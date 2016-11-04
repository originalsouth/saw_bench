#include <cstdio>
#include <cstdlib>
#include <cmath>
#include <vector>

using namespace std;

const int nmax=20;
int n;
double z;
double rsq;
vector<vector<bool>> grid(2*nmax+1,vector<bool>(2*nmax+1,false));

void mov(int x,int y,int ln)
{
    if(ln==n)
    {
        z++;
        rsq+=pow(x-nmax,2)+pow(y-nmax,2);
        return;
    }
    grid[x][y]=true;
    if(!grid[x+1][y]) mov(x+1,y,ln+1);
    if(!grid[x-1][y]) mov(x-1,y,ln+1);
    if(!grid[x][y+1]) mov(x,y+1,ln+1);
    if(!grid[x][y-1]) mov(x,y-1,ln+1);
    grid[x][y]=false;
}

int main()
{
    printf("#n[1];z[2];<rsq>[3]\n");
    for(n=0;n<nmax;n++)
    {
        z=0.0;
        rsq=0.0;
        mov(nmax,nmax,0);
        printf("%d;%f;%f\n",n,z,rsq/z);
    }
    return EXIT_SUCCESS;
}
