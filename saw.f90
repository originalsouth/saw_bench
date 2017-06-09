program saw
    integer,parameter::NMAX=20
    integer n,grid(0:2*NMAX,0:2*NMAX)
    double precision z,rsq
    common /integers/ n,grid
    common /floats/ z,rsq
    do i=0,2*NMAX,1
        do j=0,2*NMAX,1
            grid(i,j)=0
        enddo
    enddo
    print*,'#n[1];z[2];<rsq>[3]'
    do n=0,NMAX-1,1
        z=0.0
        rsq=0.0
        call mov(NMAX,NMAX,0)
        print*,n,';',z,';',rsq/z
    enddo
end

recursive subroutine mov(x,y,ln)
    integer,intent(in)::x
    integer,intent(in)::y
    integer,intent(in)::ln
    integer,parameter::NMAX=20
    integer n,grid(0:2*NMAX,0:2*NMAX)
    double precision z,rsq
    common /integers/ n,grid
    common /floats/ z,rsq
    if(ln .eq. n) then
        z=z+1
        rsq=rsq+(x-NMAX)**2+(y-nmax)**2
    else
        grid(x,y)=1
        if(grid(x+1,y) .eq. 0) then
            call mov(x+1,y,ln+1)
        endif
        if(grid(x-1,y) .eq. 0) then
            call mov(x-1,y,ln+1)
        endif
        if(grid(x,y+1) .eq. 0) then
            call mov(x,y+1,ln+1)
        endif
        if(grid(x,y-1) .eq. 0) then
            call mov(x,y-1,ln+1)
        endif
        grid(x,y)=0
    endif
end
