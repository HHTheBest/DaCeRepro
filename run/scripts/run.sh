#!/bin/bash
# this is the shell script to run all the cases

nowpwd1=$(pwd)
nowpwd2=${nowpwd1%/*}
nowpwd3=${nowpwd2%/*}
echo $nowpwd3
export repro_root=$nowpwd3/compile
# source $repro_root/spack-0.18.1/share/spack/setup-env.sh
spack unload -a

spack load mpich 
spack load intel-oneapi-compilers
spack load intel-oneapi-mkl
spack load python@3.8.5
spack load cmake
spack load cuda@11.1
export LD_PRELOAD=$MKLROOT/lib/intel64/libmkl_rt.so
source $repro_root/env-dace/bin/activate

# single node of numpy
pushd ../output/
python3 $repro_root/npbench/run_framework.py -f numpy -p paper
# single node of dace_cpu
python3 $repro_root/npbench/run_framework.py -f dace_cpu -p paper
# single node of dace_gpu
python3 $repro_root/npbench/run_framework.py -f dace_gpu -p paper

# multiple nodes of cpu
pushd ./numa
OMP_NUM_THREADS=30 `which mpirun` -n 1 -ppn 1 -hosts amdtest-hpc-pg0-1 python3 $repro_root/dace/samples/distributed/polybench.py
OMP_NUM_THREADS=30 `which mpirun` -n 4 -bind-to numa -ppn 4 -hosts amdtest-hpc-pg0-1 python3 $repro_root/dace/samples/distributed/polybench.py
OMP_NUM_THREADS=30 `which mpirun` -n 8 -bind-to numa -ppn 4 -hosts amdtest-hpc-pg0-1,amdtest-hpc-pg0-2 python3 $repro_root/dace/samples/distributed/polybench.py
OMP_NUM_THREADS=30 `which mpirun` -n 16 -bind-to numa -ppn 4 -hosts amdtest-hpc-pg0-1,amdtest-hpc-pg0-2,amdtest-hpc-pg0-3,amdtest-hpc-pg0-4 python3 $repro_root/dace/samples/distributed/polybench.py
popd
popd
