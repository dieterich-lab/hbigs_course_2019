rule salmon_index:
  input:
    rules.extract_sequences.output
  output:
    directory("salmon/salmon_index/")
  threads:
    10
  log:
    "log/salmon_index.log"
  shell :
    "salmon index -t {input} -i {output} -p {threads} 2> {log}"
