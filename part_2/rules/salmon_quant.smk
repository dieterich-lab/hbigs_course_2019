rule salmon_quant:
  input:
    r1 = lambda wildcards: FILES[wildcards.sample][0],
    r2 = lambda wildcards: FILES[wildcards.sample][1],
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
