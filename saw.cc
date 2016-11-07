/* By BC van Zuiden -- Leiden, November 2016 */
/* Probably very buggy USE AT OWN RISK this will brick everything you own */
/* NOBODY but YOU is liable for anything that happened in result of using this */
/* WARNING: DON'T RUN THIS PROGRAM THIS WILL DESTROY YOUR COMPUTER AND/OR HOUSE */
/* Any copyrighted piece of code within this code is NOT mine */
/* Inclusion of that code is forced upon me by a scary anonymous guy with a gun*/
/* https://github.com/originalsouth/saw_bench */

#include <cstdio>
#include <cstdlib>
#include <cmath>
#include <vector>

using namespace std;

const int NMAX=20;

int n;
double z;
double rsq;
vector<vector<bool>> grid(2*NMAX+1,vector<bool>(2*NMAX+1,false));

void mov(int x,int y,int ln)
{
    if(ln==n)
    {
        z++;
        rsq+=pow(x-NMAX,2)+pow(y-NMAX,2);
    }
    else
    {
        grid[x][y]=true;
        if(!grid[x+1][y]) mov(x+1,y,ln+1);
        if(!grid[x-1][y]) mov(x-1,y,ln+1);
        if(!grid[x][y+1]) mov(x,y+1,ln+1);
        if(!grid[x][y-1]) mov(x,y-1,ln+1);
        grid[x][y]=false;
    }
}

int main()
{
    printf("#n[1];z[2];<rsq>[3]\n");
    for(n=0;n<NMAX;n++)
    {
        z=0.0;
        rsq=0.0;
        mov(NMAX,NMAX,0);
        printf("%d;%f;%f\n",n,z,rsq/z);
    }
    return EXIT_SUCCESS;
}
