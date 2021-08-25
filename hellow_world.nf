nextflow.enable.dsl=2
process HW {


script:
"""
echo HELLO WORLD
"""

}

workflow {

HW()

}
