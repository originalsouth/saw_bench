#!/usr/bin/env julia
using Printf

NMAX=20
n=0
z=0.0
rsq=0.0
grid=zeros(Bool,2*NMAX+1,2*NMAX+1)

function mov(x,y,ln)
    global n,grid
    if ln==n
        global z+=1.0
        global rsq+=(x-NMAX-1)^2+(y-NMAX-1)^2
    else
        grid[x,y]=true
        if !grid[x+1,y]
            mov(x+1,y,ln+1)
        end
        if !grid[x-1,y]
            mov(x-1,y,ln+1)
        end
        if !grid[x,y+1]
            mov(x,y+1,ln+1)
        end
        if !grid[x,y-1]
            mov(x,y-1,ln+1)
        end
        grid[x,y]=false
    end
end

@printf("#n[1];z[2];<rsq>[3]\n");
for kn in 0:1:NMAX-1
    global n,z,rsq
    n=kn
    z=0.0
    rsq=0.0
    mov(NMAX+1,NMAX+1,0)
    @printf("%d;%.17g;%.17g\n",n,z,rsq/z)
end
exit(0)
