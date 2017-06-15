#!/usr/bin/env node
const NMAX=20;
var grid=[];
for(var i=0;i<2*NMAX+1;i++)
{
    grid[i]=[];    
    for(var j=0;j<2*NMAX+1;j++) grid[i][j]=true;
}
console.log("#n[1];z[2];<rsq>[3]");
for(var n=0;n<NMAX;n++)
{
    z=0;
    rsq=0;
    mov(NMAX,NMAX,0);
    console.log(n+';'+z+';'+rsq/z);
}
function mov(x,y,ln)
{
    if(ln===n)
    {
        z++;
        rsq+=Math.pow(x-NMAX,2)+Math.pow(y-NMAX,2);
    }
    else
    {
        grid[x][y]=false;
        if(grid[x+1][y]) mov(x+1,y,ln+1);
        if(grid[x-1][y]) mov(x-1,y,ln+1);
        if(grid[x][y+1]) mov(x,y+1,ln+1);
        if(grid[x][y-1]) mov(x,y-1,ln+1);
        grid[x][y]=true;
    }
}
