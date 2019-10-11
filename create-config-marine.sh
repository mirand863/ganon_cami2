#!/bin/bash

echo "workdir: '/mnt/files/ganon/marine/'"
echo ""
echo "threads: 6"
echo ""
echo "samples:"
for i in `seq 0 9`; do
    echo "    '$i': '/mnt/files/ganon/marine/reads/marmgCAMI2_short_read_sample_${i}_reads.fq.gz'"
done
echo ""
echo "taxdump: '/mnt/files/ganon/ncbi_taxonomy/taxdump.tar.gz'"
echo ""
echo "refseq_folder: '/mnt/files/ganon/refseq'"
