
#!/bin/bash

echo "workdir: '/mnt/files/cami2/marine/'"
echo ""
echo "threads: 6"
echo ""
echo "samples:"
for i in `seq 0 9`; do
    echo "    fq$i: '/mnt/files/cami2/marine/reads/marmgCAMI2_short_read_sample_$i_reads.fq.gz'"
done
echo ""
echo "taxdump: '/mnt/files/cami2/ncbi_taxonomy/taxdump.tar.gz'"
