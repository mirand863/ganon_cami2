workdir: config["workdir"]

rule all:
    input:
        fq = ["results/postprocessing/" + str(sample) + ".tsv" for sample in config["samples"]]

rule preprocessing:
    input: fq = lambda wildcards: os.path.abspath(config["samples"][wildcards.sample])
    output: fq = "results/preprocessing/{sample}.fq.gz"
    shell: """zcat {input.fq} | sed '2~4s/[^ACGTN]/N/g' | paste - - - - - - - - | cut -f 1-4 | tr "\\t" "\\n" | pigz > {output.fq}"""

rule ganon_build:
    input: taxdump = config["taxdump"],
           refseq = config["refseq"]
    params: prefix = "results/ganon_build/refseq"
    output: "results/ganon_build/refseq.filter"
    log: "results/ganon_build/refseq.log"
    threads: config["threads"]
    shell: "ganon build --db-prefix {params.prefix} --input-files {input.refseq}" \
            " --rank taxid --max-bloom-size 512000 --seq-info nucl_gb nucl_wgs dead_nucl dead_wgs" \
            " --taxdump-file {input.taxdump} --threads {threads} 2>&1 | tee {log}"
            
rule ganon_classify:
    input: fq = "results/preprocessing/{sample}.fq.gz",
           db = "results/ganon_build/refseq.filter"
    params: prefix = "results/ganon_classify/{sample}_classified",
            db_prefix = "results/ganon_build/refseq"
    output: lca = "results/ganon_classify/{sample}_classified.lca"
    resources: mem_mb = int(round(config["mem_mb"] / 3))
    threads: int(round(config["threads"] / 3) - 1)
    log: "results/ganon_classify/{sample}_classified.log"
    shell: "ganon classify --output-file-prefix {params.prefix} --threads {threads} --db-prefix {params.db_prefix} --reads {input.fq} 2>&1 | tee {log}"

rule postprocessing:
    input: lca = "results/ganon_classify/{sample}_classified.lca"
    params: sample_name = config["sample_name"],
            sample_number = "{sample}"
    output: tsv = "results/postprocessing/{sample}.tsv"
    shell: """sed p {input.lca} | awk '/[/]1/&&v++%2{{sub(/[/]1/, "/2")}}{{print}}' | sort | """ \
           """awk 'BEGIN {{printf "@Version:0.9.1\\n@SampleID:{params.sample_name}_{params.sample_number}\\n\\n@@SEQUENCEID\\""" \
           """tTAXID\\tBINID\\n"}} {{print $1 "\\t" $2 "\\t" $2}}' > {output.tsv}"""
