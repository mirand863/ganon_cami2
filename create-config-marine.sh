#!/bin/bash

echo "workdir: '/mnt/files/ganon/marine/'"
echo ""
echo "cores: 56"
echo ""
echo "mem_mb: 512000"
echo ""
echo "taxdump: '/mnt/files/ganon/ncbi_taxonomy/taxdump.tar.gz'"
echo ""
echo "refseq_folder: '/mnt/files/ganon/refseq'"
echo ""
echo "sample_name: 'marine'"
echo ""
echo "samples:"
for i in `seq 0 9`; do
    echo "    '$i': '/mnt/files/ganon/marine/reads/marmgCAMI2_short_read_sample_${i}_reads.fq.gz'"
