#!/usr/bin/env bash

pip3 install snakemake --user

Rscript -e 'install.packages("BiocManager", lib="~/R/x86_64-pc-linux-gnu-library/3.6", repos="https://cran.uni-muenster.de", INSTALL_opts = c("--no-lock"))'

Rscript -e 'BiocManager::install("DRIMSeq")'