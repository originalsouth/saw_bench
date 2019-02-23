#!/usr/bin/gawk -f

func mov(x,y,ln){
    if(ln==n)
    {
        z++
        rsq+=(x-NMAX)^2+(y-NMAX)^2
    }
    else
    {
        grid[x][y]=1
        if(!grid[x+1][y]) mov(x+1,y,ln+1)
        if(!grid[x-1][y]) mov(x-1,y,ln+1)
        if(!grid[x][y+1]) mov(x,y+1,ln+1)
        if(!grid[x][y-1]) mov(x,y-1,ln+1)
        grid[x][y]=0
    }
}

BEGIN{
    NMAX=20
    for(i=0;i<2*NMAX+1;i++) for(j=0;j<2*NMAX+1;j++) grid[i][j]=0
    printf("#n[1];z[2];<rsq>[3]\n");
    for(n=0;n<NMAX;n++)
    {
        z=0
        rsq=0
        mov(NMAX,NMAX,0)
        printf("%d;%.17g;%.17g\n",n,z,rsq/z)
    }
}
