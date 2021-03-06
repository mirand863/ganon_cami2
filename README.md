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
The following commands will be run on folder "/mnt/files/ganon", but it can be changed accordingly
</Warning>

```
mkdir /mnt/files/ganon
cd /mnt/files/ganon
wget -O camiClient.jar https://data.cami-challenge.org/camiClient.jar
```

# Downloading Datasets
<Warning>
You need to download the marine and strain madness private linkfiles and save them with the names "marine.linkfile" and "strain-madness.linkfile", respectively. Afterwards, run the following commands to download all the required datasets:
</Warning>

```
wget https://raw.githubusercontent.com/mirand863/ganon_cami2/master/download-datasets.sh
chmod +x download-datasets.sh
./download-datasets.sh
```

# Marine Dataset
#### Creating config file
```
cd marine
wget -O create-config.sh https://raw.githubusercontent.com/mirand863/ganon_cami2/master/create-config-marine.sh
chmod +x create-config.sh
./create-config.sh > config.yaml
```

#### Downloading and running workflow with snakemake
```
wget -O Snakefile https://raw.githubusercontent.com/mirand863/ganon_cami2/master/Snakefile
snakemake -s Snakefile --configfile config.yaml -kpr --cores 56 > marine.log
```

# Strain Madness Dataset
#### Creating config file
```
cd strain-madness
wget -O create-config.sh https://raw.githubusercontent.com/mirand863/ganon_cami2/master/create-config-strain-madness.sh
chmod +x create-config.sh
./create-config.sh > config.yaml
```

#### Downloading and running workflow with snakemake
```
wget -O Snakefile https://raw.githubusercontent.com/mirand863/ganon_cami2/master/Snakefile-Strain-Madness
snakemake -s Snakefile --configfile config.yaml -kpr --cores 56 > strain-madness.log
```
