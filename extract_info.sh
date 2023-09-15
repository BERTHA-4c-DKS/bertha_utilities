calc () {
    bc -l <<< "$@"
}

export NUM=$(grep "Total time for iteration" $1 | awk '{print $7}' | wc -l)
export SUM=$(grep "Total time for iteration" $1 | awk '{print $7}' | awk '{s+=$1} END {print s}')

echo $NUM, $SUM
export MEAN=$(calc $SUM/$NUM)
echo "Time for iteration: " $MEAN

export NUM=$(grep "Total time for the fitting walltime" $1 | awk '{print $7}' | wc -l)
export SUM=$(grep "Total time for the fitting walltime" $1 | awk '{print $7}' | awk '{s+=$1} END {print s}')

echo $NUM, $SUM
export MEAN=$(calc $SUM/$NUM)
echo "Time for fitting: " $MEAN
