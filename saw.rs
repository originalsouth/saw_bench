/* By BC van Zuiden -- Leiden, November 2016 */
/* Probably very buggy USE AT OWN RISK this will brick everything you own */
/* NOBODY but YOU is liable for anything that happened in result of using this */
/* WARNING: DON'T RUN THIS PROGRAM THIS WILL DESTROY YOUR COMPUTER AND/OR HOUSE */
/* Any copyrighted piece of code within this code is NOT mine */
/* Inclusion of that code is forced upon me by a scary anonymous guy with a gun*/
/* https://github.com/originalsouth/saw_bench */

const NMAX:usize=20;

struct Vars
{
    n:i32,
    z:f64,
    rsq:f64,
    grid:Vec<Vec<bool>>,
}

fn mov(x:usize,y:usize,n:i32,mut vars:&mut Vars)->()
{
    if n==vars.n
    {
        vars.z+=1.0;
        let sf:f64=NMAX as f64;
        vars.rsq+=(x as f64-sf).powi(2)+(y as f64-sf).powi(2);
    }
    else
    {
        vars.grid[x][y]=true; 
        if !vars.grid[x+1][y] {mov(x+1,y,n+1,&mut vars)};
        if !vars.grid[x-1][y] {mov(x-1,y,n+1,&mut vars)};
        if !vars.grid[x][y+1] {mov(x,y+1,n+1,&mut vars)};
        if !vars.grid[x][y-1] {mov(x,y-1,n+1,&mut vars)};
        vars.grid[x][y]=false; 
    }
}

fn main()
{
    println!("#n[1];z[2];<rsq>[3]");
    let mut vars=Vars{n:0,z:0.0,rsq:0.0,grid:vec![vec![false;2*NMAX+1];2*NMAX+1]};
    for n in 0..NMAX
    {
        vars.n=n as i32;
        vars.z=0.0;
        vars.rsq=0.0;
        mov(NMAX,NMAX,0,&mut vars);
        println!("{};{};{}",vars.n,vars.z,vars.rsq/vars.z);
    }
}
