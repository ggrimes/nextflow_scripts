nextflow.enable.dsl=2



params.MSG = ['WORLD','SCOTLAND']


log.info """

      MSG:  ${params.MSG}
 """.stripIndent()


process HW {

label("HW")
publishDir("results")
tag("HW $msg")
cpus 2

  input:
    val msg

  output:
    path "message.txt"

  script:
  """
  echo HELLO $msg > message.txt
  """
}

process WC {
echo(true)

input:
path myfile

script:
"""
wc -l $myfile
"""

}

ch = Channel.fromList(params.MSG)

workflow {

WC(HW(ch))

}
