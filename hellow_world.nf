nextflow.enable.dsl=2

MSG = ['WORLD','SCOTLAND']

process HW {

label("HW")
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

ch = Channel.fromList(MSG)

workflow {

HW(ch)

}
