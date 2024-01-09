# Compile

## Description

You can run the compile.sh to get all the softwares needed to reproduce our results in the report.

Spack is use as the software manager. For the python environment, venv is used.

The tested versions are CPython 3.8.5, Intel-oneapi-compilers 2022.1.0, Intel-oneapi-mkl 2022.1.0, mpich 4.0.2 and cmake 3.23.1 by spack. The microsoft-dsvm:ubuntu-hpc:2004:latest image offers us gcc 9.3.0, g++ 9.3.0, gfortran 9.3.0 and cuda 11.1.

Also, for the python library, we have tested with NumPy 1.19.2 with Intel-MKL support, cupy 8.3.0, and mpi4py 3.1.4 for mpich.

For more information about the library installed, you can read the shell script or contact us @ SYSU-SCC.

## Usage

You can simply run the compilation.sh for the first time. However, if you meet some problem, then you may need to clear the download or installed folders and restart it. Run the seperate shell script could help sometime if you know how we construct the folder.
