/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 --no-sub-pkg %f -o %output
// RUN-EXEC: %export cjHeapSize=512mb && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ms

import std.time.*
import std.collection.*
import std.random.*

class Timer {
    private var start_time: DateTime = DateTime.now()
    private var end_time: DateTime = DateTime.now()

    public init() {}

    public func start() {
        start_time = DateTime.now()
    }

    public func stop(): Duration {
        end_time = DateTime.now()
        end_time - start_time
    }
}

let timer = Timer()

let width = 60
let aluString = "GGCCGGGCGCGGTGGCTCACGCCTGTAATCCCAGCACTTTGG" +
    "GAGGCCGAGGCGGGCGGATCACCTGAGGTCAGGAGTTCGAGA" +
    "CCAGCCTGGCCAACATGGTGAAACCCCGTCTCTACTAAAAAT" +
    "ACAAAAATTAGCCGGGCGTGGTGGCGCGCGCCTGTAATCCCA" +
    "GCTACTCGGGAGGCTGAGGCAGGAGAATCGCTTGAACCCGGG" +
    "AGGCGGAGGTTGCAGTGAGCCGAGATCGCGCCACTGCACTCC" +
"AGCCTGGGCGACAGAGCGAGACTCCGTCTCAAAAA"
var alu:ArrayList<UInt8> = ArrayList<UInt8>(aluString.toArray())
var aluSize = alu.size
var _ = alu.remove(at: aluSize-1)

@OverflowWrapping
func repeatFasta(geneLength!: Int64, buffer!:  Array<Int64>, gene2!:  Array<Int64>) : Int64 {
    var pos = 0
    var rpos = 0
    var cnt = 500000
    var lwidth = width
    while (cnt > 0) {
        if (pos + lwidth > buffer.size) {
            pos = 0
        }
        if (rpos + lwidth > geneLength) {
            rpos = rpos % geneLength
        }
        if (cnt < lwidth) {
            lwidth = cnt
        }
        
        for (i in 0..lwidth) {
            buffer[pos + i] = gene2[rpos + i];
        }

        buffer[pos+lwidth] = 10
        pos += lwidth + 1
        rpos += lwidth
        cnt -= lwidth
    }
    if (pos > 0 && pos < buffer.size) {
        buffer[pos] = 10
    } else if (pos == buffer.size) {
        buffer[0] = 10
    }
    var result = 0
    for (i in 0..buffer.size) {
        result += buffer[i]
    }
    return result
}

func runFasta1() :Int64{
    let bufferSize = 256 * 1024
    let geneLength = alu.size
    var buffer = Array<Int64>(bufferSize,repeat:10)
    var gene2 = Array<Int64>((2 * geneLength), repeat: 10)
    for (i in 0..gene2.size) {
		gene2[i] = Int64(alu[i % geneLength]);
    }
    var res = 0
    timer.start()
    for (_ in 0..500 ){
        res += repeatFasta(geneLength: geneLength, buffer: buffer, gene2: gene2)
    }
    let time = timer.stop()
    println(res)
    println("Array Access - RunFastaRepeat:\t${Float64(time.toNanoseconds())/1000000.0}\tms");
    return  Int64(time.toMilliseconds())
}

main(){
 runFasta1()
 return 0
}
