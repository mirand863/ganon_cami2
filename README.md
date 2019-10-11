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
`conda install ganon=0.1.4`

#### Installing Snakemake
`conda install -c bioconda snakemake=5.7.0`

#### Installing Oracle Java
`conda install -c gtcg oraclejdk`

#### Downloading CAMI Client

<Warning>
The following commands will be run on folder "/mnt/files/cami2", but it can be changed accordingly
</Warning>

```
mkdir /mnt/files/cami2
cd /mnt/files/cami2
wget -O camiClient.jar https://data.cami-challenge.org/camiClient.jar
```

# Downloading Datasets
```
wget https://raw.githubusercontent.com/mirand863/ganon_cami2/master/download-datasets.sh
chmod +x download-datasets.sh
./download-datasets.sh
```

