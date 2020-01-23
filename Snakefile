rule all:
    input: "output/Sample1.sam"

rule alignement:
    input:
        R1_fastq="data/{sample}_R1.fastq.gz",
        R2_fastq="data/{sample}_R2.fastq.gz"
    output:
        bam="output/{sample}.sam"
    params:
        name="alignement_{sample}",
        nthread=5,
        reference="/data2/fdb/igenomes/Homo_sapiens/UCSC/hg19/Sequence/BWAIndex/genome.fa"
    conda:
        "./env/bwa_mem.yaml"
    shell:
        "bwa mem \
             {params.reference} \
             {input.R1_fastq} \
             {input.R2_fastq} \
             > {output.bam}"
