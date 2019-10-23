#!/usr/bin/env bash

# python libs
pip3 install snakemake --user

# R packages
Rscript -e 'install.packages(c("BiocManager", "knitr", "devtools", "rstan"), lib="~/R/x86_64-pc-linux-gnu-library/3.6", repos="https://cran.uni-muenster.de", INSTALL_opts = c("--no-lock"))'

# DRIMSeq
Rscript -e 'BiocManager::install("DRIMSeq", INSTALL_opts = c("--no-lock"))'

# LeafCutter

# First, R stan
mkdir ~/.R/
echo 'CXX14 = g++ -std=c++1y
CXX14FLAGS = -O3 -Wno-unused-variable -Wno-unused-function -fPIC' >>  ~/.R/Makevars
Rscript -e 'install.packages("rstan", type = "source",  lib="~/R/x86_64-pc-linux-gnu-library/3.6", repos="https://cran.uni-muenster.de", INSTALL_opts = c("--no-lock"))'


git clone https://github.com/davidaknowles/leafcutter




cd leafcutter
R CMD INSTALL --build .




# export ~/leafcutter/scripts/*

cd part_2/


wget ftp://ftp.ensembl.org/pub/current_fasta/homo_sapiens/cdna/Homo_sapiens.GRCh38.cdna.all.fa.gz 


