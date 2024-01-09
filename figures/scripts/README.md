# figures/scripts
## Description

The three *_plot.py represent the plotting scripts for CPU, GPU and Distributed Results of DaCe.

## Usage

The cpu_plot.py and gpu_plot.py have the arg for data size, using '-p paper' to select data with the same size in paper. The distr_plot.py has the arg '-f .' to set the folder including '*.csv' and it can produce the figure_distr. An example is in `figure.sh`.

## Dependencies
Dependencies are listed below:

- glob
- pandas
- seaborn
- matplotlib
- numpy
- argparse

You can use pip or conda to install and manage them.