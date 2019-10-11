
#!/bin/bash

java \
-jar \
/mnt/files/cami2/camiClient.jar \
-d \
"/mnt/files/cami2/marine.linkfile" \
/mnt/files/cami2/marine \
-p short

java \
-jar \
/mnt/files/cami2/camiClient.jar \
-d \
"/mnt/files/cami2/strain-madness.linkfile" \
/mnt/files/cami2/strain-madness \
-p short

wget \
-O ncbi_taxonomy.tar \
https://openstack.cebitec.uni-bielefeld.de:8080/swift/v1/CAMI_2_DATABASES/ncbi_taxonomy.tar
tar -xvf ncbi_taxonomy.tar

wget \
-O RefSeq_genomic_20190108.tar \
https://openstack.cebitec.uni-bielefeld.de:8080/swift/v1/CAMI_2_DATABASES/RefSeq_genomic_20190108.tar
mkdir refseq
cd refseq/
tar -xvf ../RefSeq_genomic_20190108.tar
cd ..
