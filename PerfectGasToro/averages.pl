#!/usr/bin/perl

open(my $EXACT, "<", "exact.out");

#
# Central quad rule  integration
#

$px = -0.000625;
$cx        = 0;

$k         = 0;
$n         = 1;
$j         = 0;

while(<$EXACT>)
{
    #take new values
    @str_split = split(' ', $_);
    $nx        = @str_split[0];
    $nrho      = @str_split[1];
    $nvel      = @str_split[2];
    $npres     = @str_split[3];
    $nenerg    = @str_split[4];
    
    #integrate
    $dx      = $nx - $px;
    $ix     += $dx;
    $irho   += $nrho*$dx;
    $ivel   += $nvel*$dx;
    $ipres  += $npres*$dx;
    $ienerg += $nenerg*$dx;
    $k      += 1;
    
    #calculate average
    if ($k == $n)
    {
        $j      += 1;
        $cx    += $ix;
        $ccx    = $cx - 0.5*$ix;
        $crho   = $irho   / $ix;
        $cvel   = $ivel   / $ix;
        $cpres  = $ipres  / $ix;
        $cenerg = $ienerg / $ix;
        
        $ix     = 0;
        $irho   = 0;
        $ivel   = 0;
        $ipres  = 0;
        $ienerg = 0;
        $k      = 0;
        
        #print
        print "$j $ccx $crho $cvel $cpres $cenerg\n";
    }
    
    #store old
    $px     = $nx;
}

#
# Trapezoidal rule integration
#
#@str_split = split(' ', <$EXACT>);
#
#$px        = @str_split[0];
#$prho      = @str_split[1];
#$pvel      = @str_split[2];
#$ppres     = @str_split[3];
#$penerg    = @str_split[4];
#
#$ix        = 0;
#
#$cx        = 0;
#
#$k         = 0;
#$n         = 2;
#$j         = 0;
#
#while(<$EXACT>)
#{
#    #take new values
#    @str_split = split(' ', $_);
#    $nx        = @str_split[0];
#    $nrho      = @str_split[1];
#    $nvel      = @str_split[2];
#    $npres     = @str_split[3];
#    $nenerg    = @str_split[4];
#    
#    #integrate
#    $dx      = $nx - $px;
#    $ix     += $dx;
#    $irho   += ($prho + $nrho)*0.5*$dx;
#    $ivel   += ($pvel + $nvel)*0.5*$dx;
#    $ipres  += ($ppres + $npres)*0.5*$dx;
#    $ienerg += ($penerg + $nenerg)*0.5*$dx;
#    $k      += 1;
#    
#    #calculate average
#    if ($k == $n)
#    {
#        $j      += 1;
#        $cx    += $ix;
#        $ccx    = $cx - 0.5*$ix;
#        $crho   = $irho   / $ix;
#        $cvel   = $ivel   / $ix;
#        $cpres  = $ipres  / $ix;
#        $cenerg = $ienerg / $ix;
#        
#        $ix     = 0;
#        $irho   = 0;
#        $ivel   = 0;
#        $ipres  = 0;
#        $ienerg = 0;
#        $k      = 0;
#        
#        #print
#        print "$j $ccx $crho $cvel $cpres $cenerg\n";
#    }
#    
#    #store old
#    $px     = $nx;
#    $prho   = $nrho;
#    $pvel   = $nvel;
#    $ppres  = $npres;
#    $penerg = $nenerg;
#    
#}

#
#END-OF-FILE
#

