#!/usr/bin/lua

function printf(s,...)
    return io.write(s:format(...))
end

NMAX=20
grid={}
for i=0,2*NMAX-1 do
   grid[i]={}
   for j=0,2*NMAX-1 do
      grid[i][j]=false
   end
end

function mov(x,y,ln)
    if ln==n then
        z=z+1
        rsq=rsq+math.pow((x-NMAX),2)+math.pow((y-NMAX),2)
    else
        grid[x][y]=true
        if not grid[x+1][y] then
            mov(x+1,y,ln+1)
        end
        if not grid[x-1][y] then
            mov(x-1,y,ln+1)
        end
        if not grid[x][y+1] then
            mov(x,y+1,ln+1)
        end
        if not grid[x][y-1] then
            mov(x,y-1,ln+1)
        end
        grid[x][y]=false
    end
end

printf("#n[1];z[2];<rsq>[3]\n");
for kn=0,NMAX-1 do
    n=kn
    z=0
    rsq=0.0
    mov(NMAX,NMAX,0)
    printf("%d;%.17g;%.17g\n",n,z,rsq/z)
end
