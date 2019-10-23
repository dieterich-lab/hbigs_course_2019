rule salmon_index:
  input:
    'Homo_sapiens.GRCh38.cdna.all.fa.gz'
  output:
    directory("salmon/salmon_index/")
  threads:
    10
  log:
    "log/salmon_index.log"
  shell :
    "salmon index -t {input} -i {output} -p {threads} 2> {log}"
