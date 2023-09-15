ulimit -s  unlimited 
export OMP_STACKSIZE=200M 
export OMP_SCHEDULE=dynamic
export OMP_NUM_THREADS=4

rm -rf /tmp/nvidia
ln -s $TMPDIR /tmp/nvidia
nsys profile --trace=cublas,cuda,openacc ./bertha.serial
rm -rf /tmp/nvidia
