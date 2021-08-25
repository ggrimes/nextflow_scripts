nextflow.enable.dsl=2

MSG = ['WORLD','SCOTLAND']

process HW {

input:
val msg

script:
"""
echo HELLO $msg
"""

}

ch = Channel.fromList(MSG)

workflow {

HW(ch)

}
