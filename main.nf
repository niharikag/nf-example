nextflow.enable.dsl = 2

input = Channel.fromPath("$baseDir/input.txt").splitText()

process decode {

    input:
    val STR 

    output:
    stdout

    script:
    """
    echo '$STR' | base64 --decode
    """
}

workflow{
    decode(input)|toSortedList()|flatten()|view()
}
