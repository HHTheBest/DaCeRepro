#!/bin/bash

python3 cpu_plot.py -p paper
python3 gpu_plot.py -p paper
python3 distr_plot.py -p paper -f ../../run/output/core
rm -f tmp