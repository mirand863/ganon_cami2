#!/bin/bash

echo "workdir: '/mnt/files/ganon/strain-madness'"
echo ""
echo "threads: 56"
echo ""
echo "mem_mb: 1677721"
echo ""
echo "taxdump: '/mnt/files/ganon/ncbi_taxonomy/taxdump.tar.gz'"
echo ""
echo "refseq: '/mnt/files/ganon/refseq/refseq.fna.gz'"
echo ""
echo "sample_name: 'strain-madness'"
echo ""
echo "samples:"
for i in `seq 0 99`; do
    echo "    '$i': '/mnt/files/ganon/strain-madness/reads/strmgCAMI2_short_read_sample_${i}_reads.fq.gz'"
done
