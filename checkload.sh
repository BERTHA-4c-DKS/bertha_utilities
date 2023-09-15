
GLOBALNUM=0

while [ 1 ]; do

  NUM=0
  for perc in $(ps aux | grep bertha.parallelshm | grep -v mpirun | grep -v grep | sort -n -k 2 | awk '{print $3}')
  do 
    echo $NUM $perc $GLOBALNUM
    NUM=`expr $NUM + 1`
  done

  sleep 1s

  GLOBALNUM=`expr $GLOBALNUM + 1`
done

#for num in {0..15}; do grep "^$num VmSize:" out > out.$num; done
