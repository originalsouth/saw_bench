#!/usr/bin/env php
<?php
    $NMAX=20;
    $grid=array_fill(0,2*$NMAX+1,array_fill(0,2*$NMAX+1,False));
    $n=0;
    $z=0;
    $rsq=0;
    function mov($x,$y,$ln)
    {
        global $NMAX,$grid,$n,$z,$rsq;
        if($ln==$n)
        {
            $z++;
            $rsq+=pow($x-$NMAX,2)+pow($y-$NMAX,2);
        }
        else
        {
            $grid[$x][$y]=True;
            if(!$grid[$x+1][$y]) mov($x+1,$y,$ln+1);
            if(!$grid[$x-1][$y]) mov($x-1,$y,$ln+1);
            if(!$grid[$x][$y+1]) mov($x,$y+1,$ln+1);
            if(!$grid[$x][$y-1]) mov($x,$y-1,$ln+1);
            $grid[$x][$y]=False;
        }
    }
    printf("#n[1];z[2];<rsq>[3]\n");
    for($n=0;$n<$NMAX;$n++)
    {
        $z=0;
        $rsq=0;
        mov($NMAX,$NMAX,0);
        printf("%d;%.17g;%.17g\n",$n,$z,$rsq/$z);
    }
?>
