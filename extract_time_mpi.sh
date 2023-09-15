calc () {
    bc -l <<< "$@"
}

export NUM=$(grep "Total time for the fitting walltime" $1 | tail -n +2 | awk '{print $7}' | wc -l)
export SUM=$(grep "Total time for the fitting walltime" $1 | tail -n +2 | awk '{print $7}' | awk '{s+=$1} END {print s}')

#echo $NUM, $SUM
export MEAN=$(calc $SUM/$NUM)
echo "Fitting: " $MEAN

export NUM=$(grep "Time for hden walltime" $1 | tail -n +2 | awk '{print $5}' | wc -l)
export SUM=$(grep "Time for hden walltime" $1 | tail -n +2 | awk '{print $5}' | awk '{s+=$1} END {print s}')

#echo $NUM, $SUM
export MEAN=$(calc $SUM/$NUM)
echo "Hden: " $MEAN

export NUM=$(grep "Time vtvec walltime" $1 | tail -n +2 | awk '{print $4}' | wc -l)
export SUM=$(grep "Time vtvec walltime" $1 | tail -n +2 | awk '{print $4}' | awk '{s+=$1} END {print s}')

#echo $NUM, $SUM
export MEAN=$(calc $SUM/$NUM)
echo "Vtvec: " $MEAN

export NUM=$(grep "Time for the zz walltime" $1 | tail -n +2 | awk '{print $6}' | wc -l)
export SUM=$(grep "Time for the zz walltime" $1 | tail -n +2 | awk '{print $6}' | awk '{s+=$1} END {print s}')

#echo $NUM, $SUM
export MEAN=$(calc $SUM/$NUM)
echo "ZZ: " $MEAN

export NUM=$(grep "Time for oneel walltime" $1 | awk '{print $5}' | wc -l)
export SUM=$(grep "Time for oneel walltime" $1 | awk '{print $5}' | awk '{s+=$1} END {print s}')

#echo $NUM, $SUM
export MEAN=$(calc $SUM/$NUM)
echo "Oneel: " $MEAN


export NUM=$(grep "Time for pzhemm walltime (was shftlv)" $1 | tail -n +2 | awk '{print $7}' | wc -l)
export SUM=$(grep "Time for pzhemm walltime (was shftlv)" $1 | tail -n +2 | awk '{print $7}' | awk '{s+=$1} END {print s}')

#echo $NUM, $SUM
export MEAN=$(calc $SUM/$NUM)
echo "Shftlv: " $MEAN

export NUM=$(grep "Time for scalapack_diagonalizer walltime" $1 | tail -n +2 | awk '{print $5}' | wc -l)
export SUM=$(grep "Time for scalapack_diagonalizer walltime" $1 | tail -n +2 | awk '{print $5}' | awk '{s+=$1} END {print s}')

#echo $NUM, $SUM
export MEAN=$(calc $SUM/$NUM)
echo "Diangonalization: " $MEAN


export NUM=$(grep "Total time for iteration" $1 | tail -n +2 | awk '{print $7}' | wc -l)
export SUM=$(grep "Total time for iteration" $1 | tail -n +2 | awk '{print $7}' | awk '{s+=$1} END {print s}')

#echo $NUM, $SUM
export MEAN=$(calc $SUM/$NUM)
echo "Total: " $MEAN


