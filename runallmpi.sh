cp -f input.inp.base input.inp
echo "2 2 32 2.0" >> input.inp
echo "'maxit'" >> input.inp
echo "3" >> input.inp
nohup mpirun -np 4 ./bertha.parallelshm.noomp 1> out.parallel.4 2> err.parallel.4 


cp -f input.inp.base input.inp
echo "3 3 32 2.0" >> input.inp
echo "'maxit'" >> input.inp
echo "3" >> input.inp
nohup mpirun -np 9 ./bertha.parallelshm.noomp 1> out.parallel.9 2> err.parallel.9


cp -f input.inp.base input.inp
echo "4 4 32 2.0" >> input.inp
echo "'maxit'" >> input.inp
echo "3" >> input.inp
nohup mpirun -np 16 ./bertha.parallelshm.noomp 1> out.parallel.16 2> err.parallel.16


cp -f input.inp.base input.inp
echo "6 4 32 2.0" >> input.inp
echo "'maxit'" >> input.inp
echo "3" >> input.inp
nohup mpirun -np 24 ./bertha.parallelshm.noomp 1> out.parallel.24 2> err.parallel.24



