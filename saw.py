#!/usr/bin/env python3
import sys

NMAX=20
n=0
z=0
rsq=0.0
grid=[[False for i in range(2*NMAX+1)] for j in range(2*NMAX+1)]

def printf(format, *args):
    sys.stdout.write(format % args)

def mov(x,y,ln):
    global NMAX,z,rsq,grid
    if ln==n:
        z+=1
        rsq+=(x-NMAX)**2+(y-NMAX)**2
    else:
        grid[x][y]=True
        if not grid[x+1][y]:
            mov(x+1,y,ln+1)
        if not grid[x-1][y]:
            mov(x-1,y,ln+1)
        if not grid[x][y+1]:
            mov(x,y+1,ln+1)
        if not grid[x][y-1]:
            mov(x,y-1,ln+1)
        grid[x][y]=False

printf("#n[1];z[2];<rsq>[3]\n");
for n in range(NMAX):
    z=0
    rsq=0.0
    mov(NMAX,NMAX,0)
    printf("%d;%.17g;%.17g\n",n,z,rsq/z)
exit(0)
