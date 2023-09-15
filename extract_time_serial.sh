calc () {
    bc -l <<< "$@" | awk '{printf "%f", $0}'
}

export NUM=$(grep "Time for hden walltime" $1 | tail -n +2 | awk '{print $5}' | wc -l)
export SUM=$(grep "Time for hden walltime" $1 | tail -n +2 | awk '{print $5}' | awk '{s+=$1} END {print s}')
export MEAN=$(calc $SUM/$NUM)
Hden=$MEAN

export NUM=$(grep "Time vtvec walltime" $1 | tail -n +2 | awk '{print $4}' | wc -l)
export SUM=$(grep "Time vtvec walltime" $1 | tail -n +2 | awk '{print $4}' | awk '{s+=$1} END {print s}')
export MEAN=$(calc $SUM/$NUM)
Vtvec=$MEAN

export NUM=$(grep "Time for DFTININT OMP(QUAD) walltime" $1 | tail -n +2 | awk '{print $6}' | wc -l)
export SUM=$(grep "Time for DFTININT OMP(QUAD) walltime" $1 | tail -n +2 | awk '{print $6}' | awk '{s+=$1} END {print s}')
export MEAN=$(calc $SUM/$NUM)
Dffitinit=$MEAN

export NUM=$(grep "Time for the zz walltime" $1 | tail -n +2 | awk '{print $6}' | wc -l)
export SUM=$(grep "Time for the zz walltime" $1 | tail -n +2 | awk '{print $6}' | awk '{s+=$1} END {print s}')
export MEAN=$(calc $SUM/$NUM)
ZZ=$MEAN

export NUM=$(grep "Time for jmatfitt walltime" $1 | tail -n +2 | awk '{print $5}' | wc -l)
export SUM=$(grep "Time for jmatfitt walltime" $1 | tail -n +2 | awk '{print $5}' | awk '{s+=$1} END {print s}')
export MEAN=$(calc $SUM/$NUM)
Fitting=$MEAN

export NUM=$(grep "Total time for the fitting walltime" $1 | tail -n +2 | awk '{print $7}' | wc -l)
export SUM=$(grep "Total time for the fitting walltime" $1 | tail -n +2 | awk '{print $7}' | awk '{s+=$1} END {print s}')
export MEAN=$(calc $SUM/$NUM)
Totfitting=$MEAN

export NUM=$(grep "Time for oneel walltime" $1 | tail -n +2 | awk '{print $5}' | wc -l)
export SUM=$(grep "Time for oneel walltime" $1 | tail -n +2 | awk '{print $5}' | awk '{s+=$1} END {print s}')
export MEAN=$(calc $SUM/$NUM)
Oneel=$MEAN


export NUM=$(grep "Time for shftlv" $1 | tail -n +2 | awk '{print $4}' | wc -l)
export SUM=$(grep "Time for shftlv" $1 | tail -n +2 | awk '{print $4}' | awk '{s+=$1} END {print s}')
export MEANO=$(calc $SUM/$NUM)
#echo "Shftlv: " $MEANO

export NUM=$(grep "Time for zhegv walltime" $1 | tail -n +2 | awk '{print $5}' | wc -l)
export SUM=$(grep "Time for zhegv walltime" $1 | tail -n +2 | awk '{print $5}' | awk '{s+=$1} END {print s}')
export MEANT=$(calc $SUM/$NUM)
#echo "  Diagonalization: " $MEANT

export NUM=$(grep "Time for dens walltime" $1 | tail -n +2 | awk '{print $5}' | wc -l)
export SUM=$(grep "Time for dens walltime" $1 | tail -n +2 | awk '{print $5}' | awk '{s+=$1} END {print s}')
export MEANTH=$(calc $SUM/$NUM)
#echo "  Dens: " $MEANTH

SUMMA=$(python -c "print( $MEANO+$MEANT+$MEANTH )")
LinearAlgebra=$SUMMA

export NUM=$(grep "Total time for iteration" $1 | tail -n +2 | awk '{print $7}' | wc -l)
export SUM=$(grep "Total time for iteration" $1 | tail -n +2 | awk '{print $7}' | awk '{s+=$1} END {print s}')
export MEAN=$(calc $SUM/$NUM)
Total=$MEAN

echo "Hden , Vtvec , Dffitinit , ZZ , Fitting , Totfitting , Oneel , LinearAlgebra , Total"
echo $Hden " , " $Vtvec " , " $Dffitinit " , " $ZZ " , " $Fitting " , " $Totfitting " , " \
     $Oneel " , " $LinearAlgebra " , " $Total
