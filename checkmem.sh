
GLOBALNUM=0

while [ 1 ]; do

  NUM=0
  for pid in $(ps aux | grep bertha.parallelshm | grep -v mpiexec | grep -v grep | awk '{print $2}')
  do 
    VMSIZE=$(cat /proc/$pid/status | grep VmSize)
    VMDATA=$(cat /proc/$pid/status | grep VmData)
    VMPEAK=$(cat /proc/$pid/status | grep VmPeak)
    VMRSS=$(cat /proc/$pid/status | grep VmRSS)

    echo $NUM $VMSIZE $VMDATA $VMPEAK $VMRSS $GLOBALNUM

    NUM=`expr $NUM + 1`
  done

  sleep 1s

  GLOBALNUM=`expr $GLOBALNUM + 1`
done

#for num in {0..15}; do grep "^$num VmSize:" out > out.$num; done
