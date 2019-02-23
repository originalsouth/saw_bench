#!/usr/bin/env julia
using Printf

const NMAX=20

mutable struct Vars
    grid::Array{Bool,2}
    z::Float64
    rsq::Float64
    n::Int64
end

function update_z_rsq(vars::Vars, x::Int64, y::Int64)
    vars.z += 1.0
    vars.rsq += (x-NMAX-1)^2+(y-NMAX-1)^2

    return vars
end

function update_grid(vars::Vars, x::Int64, y::Int64, ln::Int64)
    vars.grid[x,y]=true
    if !vars.grid[x+1,y]
        vars = mov(vars, x+1, y, ln+1)
    end
    if !vars.grid[x-1,y]
        vars = mov(vars, x-1, y, ln+1)
    end
    if !vars.grid[x,y+1]
        vars = mov(vars, x, y+1, ln+1)
    end
    if !vars.grid[x,y-1]
        vars = mov(vars, x, y-1, ln+1)
    end
    vars.grid[x,y]=false

    return vars
end

function mov(vars::Vars, x::Int64, y::Int64, ln::Int64)
    if ln == vars.n
        return update_z_rsq(vars, x, y)
    else
        return update_grid(vars, x, y, ln)
    end
end

@printf("#n[1];z[2];<rsq>[3]\n");
for n in 0:1:NMAX-1
    vars = Vars(zeros(Bool,2*NMAX+1,2*NMAX+1), 0.0, 0.0, n)
    vars = mov(vars, NMAX+1, NMAX+1, 0)
    @printf("%d;%.17g;%.17g\n",vars.n,vars.z,vars.rsq/vars.z)
end
exit(0)
