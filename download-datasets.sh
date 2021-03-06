
#!/bin/bash

java \
-jar \
camiClient.jar \
-d \
"marine.linkfile" \
marine \
-p short

java \
-jar \
camiClient.jar \
-d \
"strain-madness.linkfile" \
strain-madness \
-p short

wget \
-O ncbi_taxonomy.tar \
https://openstack.cebitec.uni-bielefeld.de:8080/swift/v1/CAMI_2_DATABASES/ncbi_taxonomy.tar
tar -xvf ncbi_taxonomy.tar
cd ncbi_taxonomy
wget -O ncbi_taxonomy_accession2taxid.tar \
https://openstack.cebitec.uni-bielefeld.de:8080/swift/v1/CAMI_2_DATABASES/ncbi_taxonomy_accession2taxid.tar
tar -xvf ncbi_taxonomy_accession2taxid.tar
mv ncbi_taxonomy_accession2taxid/* accession2taxid/
rmdir ncbi_taxonomy_accession2taxid/
cd ..

wget \
-O RefSeq_genomic_20190108.tar \
https://openstack.cebitec.uni-bielefeld.de:8080/swift/v1/CAMI_2_DATABASES/RefSeq_genomic_20190108.tar
mkdir refseq
cd refseq/
tar -xvf ../RefSeq_genomic_20190108.tar
for f in *.gz; do cat "$f" >> refseq.fna.gz; done
cd ..
