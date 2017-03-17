#!/usr/bin/env julia

const NMAX=20

function mov(grid::Array{Bool,2}, z::Float64, rsq::Float64, n::Int64, x::Int64,y::Int64,ln::Int64)
    if ln==n
        z+=1.0
        rsq+=(x-NMAX-1)^2+(y-NMAX-1)^2
    else
        grid[x,y]=true
        if !grid[x+1,y]
            grid, z, rsq = mov(grid, z, rsq, n, x+1, y, ln+1)
        end
        if !grid[x-1,y]
            grid, z, rsq = mov(grid, z, rsq, n, x-1, y, ln+1)
        end
        if !grid[x,y+1]
            grid, z, rsq = mov(grid, z, rsq, n, x, y+1, ln+1)
        end
        if !grid[x,y-1]
            grid, z, rsq = mov(grid, z, rsq, n, x, y-1, ln+1)
        end
        grid[x,y]=false
    end
    return grid, z, rsq, n
end

grid=zeros(Bool,2*NMAX+1,2*NMAX+1)

@printf("#n[1];z[2];<rsq>[3]\n");
for n in 0:1:NMAX-1
    z=0.0
    rsq=0.0
    grid, z, rsq = mov(grid, z, rsq, n, NMAX+1,NMAX+1,0)
    @printf("%d;%.17g;%.17g\n",n,z,rsq/z)
end
exit(0)