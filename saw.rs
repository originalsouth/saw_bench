struct Vars
{
    nmax:usize,
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
        let xf:f64=x as f64;
        let yf:f64=y as f64;
        let sf:f64=vars.nmax as f64;
        vars.rsq+=(xf-sf)*(xf-sf)+(yf-sf)*(yf-sf);
        return;
    }
    vars.grid[x][y]=true; 
    if !vars.grid[x+1][y] {mov(x+1,y,n+1,&mut vars)};
    if !vars.grid[x-1][y] {mov(x-1,y,n+1,&mut vars)};
    if !vars.grid[x][y+1] {mov(x,y+1,n+1,&mut vars)};
    if !vars.grid[x][y-1] {mov(x,y-1,n+1,&mut vars)};
    vars.grid[x][y]=false; 
}

fn main()
{
    println!("#n[1];z[2];<rsq>[3]");
    let nmax=20;
    let mut vars=Vars{nmax:nmax,n:0,z:0.0,rsq:0.0,grid:vec![vec![false;2*nmax+1];2*nmax+1]};
    for n in 0..vars.nmax
    {
        vars.n=n as i32;
        vars.z=0.0;
        vars.rsq=0.0;
        mov(nmax,nmax,0,&mut vars);
        println!("{};{};{}",vars.n,vars.z,vars.rsq/vars.z);
    }
}
