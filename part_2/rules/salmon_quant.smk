rule all:
  input:
    'salmon/SRR7451179__Rep_2__MP60-2__mRNA_Seq__PBS/quant.sf',
    'salmon/SRR7451182__Rep_1__ME60-1__mRNA_Seq__EGF/quant.sf',
    'salmon/SRR7451187__Rep_1__MP60-1__mRNA_Seq__PBS/quant.sf',
    'salmon/SRR7451201__Rep_2__ME60-2__mRNA_Seq__EGF/quant.sf',

rule salmon_quant:
  input:
    r1 = "/pub/hbigs_course_2019/part_1/downsampled/raw_data/{sample}_R1.fastq.gz",
    r2 = "/pub/hbigs_course_2019/part_1/downsampled/raw_data/{sample}_R2.fastq.gz",
    index = "salmon/salmon_index/"
  output:
    "salmon/{sample}/quant.sf"
  threads:
    10
  log:
    "log/{sample}_salmons_quant.log"
  shell:
    "salmon quant -p {threads} -i {input.index} "
    "--libType A "
    "-1 <(gunzip -c {input.r1}) "
    "-2 <(gunzip -c {input.r2}) "
    "-o salmon/{wildcards.sample}/ &> {log}"