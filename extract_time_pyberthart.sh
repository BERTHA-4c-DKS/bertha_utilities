calc () {
    bc -l <<< "$@" | awk '{printf "%f", $0}'
}

export NUM=$(grep "Time for Fock:" $1 | awk '{print $4}' | wc -l)
export SUM=$(grep "Time for Fock:" $1 | awk '{print $4}' | awk '{s+=$1} END {print s}')
export MEAN=$(calc $SUM/$NUM)
Fock=$MEAN

export NUM=$(grep "Time for Exp:" $1 | awk '{print $4}' | wc -l)
export SUM=$(grep "Time for Exp:" $1 | awk '{print $4}' | awk '{s+=$1} END {print s}')
export MEAN=$(calc $SUM/$NUM)
Exp=$MEAN

export NUM=$(grep "Time_for_MO_Fock:" $1 | awk '{print $2}' | wc -l)
export SUM=$(grep "Time_for_MO_Fock:" $1 | awk '{print $2}' | awk '{s+=$1} END {print s}')
export MEAN=$(calc $SUM/$NUM)
MOFOCK=$MEAN

export NUM=$(grep "Time_for_mainloop:" $1 | awk '{print $2}' | wc -l)
export SUM=$(grep "Time_for_mainloop:" $1 | awk '{print $2}' | awk '{s+=$1} END {print s}')
export MEAN=$(calc $SUM/$NUM)
Mainloop=$MEAN

export NUM=$(grep "Iteration" $1 | grep "\ of\ " | awk '{print $6}' | wc -l)
export SUM=$(grep "Iteration" $1 | grep "\ of\ " | awk '{print $6}' | awk '{s+=$1} END {print s}')
export MEAN=$(calc $SUM/$NUM)
Iteration=$MEAN

echo "Fock , Exp , MO_Fock , Mainloop , Iteration "
echo $Fock " , " $Exp " , " $MOFOCK " , " $Mainloop " , " $Iteration
