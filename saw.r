#!/usr/bin/Rscript

NMAX=20
n=0
z=0
rsq=0.0
grd=array(FALSE,dim=c(2*NMAX+1,2*NMAX+1))

printf=function(...) cat(sprintf(...))

mov=function(x,y,ln)
{
    if(ln==n)
    {
        z<<-z+1
        rsq<<-rsq+(x-NMAX-1)^2+(y-NMAX-1)^2
    }
    else
    {
        grd[x,y]<<-TRUE
        if(!grd[x+1,y])
        {
            mov(x+1,y,ln+1)
        }
        if(!grd[x-1,y])
        {
            mov(x-1,y,ln+1)
        }
        if(!grd[x,y+1])
        {
            mov(x,y+1,ln+1)
        }
        if(!grd[x,y-1])
        {
            mov(x,y-1,ln+1)
        }
        grd[x,y]<<-FALSE
    }
}

printf("#n[1];z[2];<rsq>[3]\n");
for(n in 0:(NMAX-1))
{
    z=0
    rsq=0.0
    mov(NMAX+1,NMAX+1,0)
    printf("%d;%.17g;%.17g\n",n,z,rsq/z)
}
