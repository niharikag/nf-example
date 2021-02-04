#!/usr/bin/env nextflow

input = Channel.fromPath("$projectDir/input.txt").splitText()

process decode {

    input:
    val STR from input

    output:
    stdout ch_decoded

    script:
    """
    echo '$STR' | base64 --decode
    """
}

ch_decoded.toSortedList().flatten().subscribe { print it }
