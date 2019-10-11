# ganon_cami2
Repository containing detailed installation instructions for ganon and how to run it with the CAMI2 datasets

# Dependency
* Anaconda or Miniconda with python 3.7

# Installation with conda
#### Creating a new conda environment
`conda create -n ganon`
#### Activating the environment
`conda activate ganon`
#### Adding required channels
```
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
```
#### Installing ganon
`conda install ganon`
