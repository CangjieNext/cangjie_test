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

var last : Float64 = 42.0
var ret : Int64 = 0
let A : Float64 = 3877.0
let C : Float64 = 29573.0
let M : Float64 = 139968.0

func rand(max:Float64): Float64 {
    last = Float64(Int64(last * A + C) % Int64(M))
    return max * last / M
}

func makeCumulative(table: HashMap<String,Float64>) {
    var last: ?String = Option<String>.None
    for ((key, value) in table) {
        if (last.isSome()) {
            table[key] = value + table[last.getOrThrow()]
        }
        last = key
    }
}

func fastaRepeat(m: Int, seq: String) {
    var n = m
    var seqi = 0
    var lenOut = 60
    while (n > 0) {
        if (n < lenOut) {
          lenOut = n
        }
        if (seqi + lenOut < seq.size) {
            ret += lenOut
            seqi += lenOut
        } else {
            let s = seq[seqi..seq.size]
            seqi = lenOut - s.size
            ret += (s + seq[0..seqi]).size
        }
        n -= lenOut
    }
}

func fastaRandom(m: Int, table: HashMap<String,Float64>) {
    var n = m
    var line = Array<Any>(60, repeat: Option<String>.None)
    makeCumulative(table)
    while (n > 0) {
        if (n < line.size) {
            line = Array<Any>(n, repeat: Option<String>.None)
        }
        for (i in 0..line.size) {
            let r = rand(1.0)
            for ((key, value) in table) {
                if (r < value) {
                    line[i] = key
                    break
                }
            }
        }
        ret += line.size
        n -= line.size
    }
}

/*
 * @State
 * @Tags Jetstream2
 */
class Benchmark {
    /*
     *@Benchmark
     */
    func runIteration() {
        let count: Int = 7
        
        let ALU: String =
          "GGCCGGGCGCGGTGGCTCACGCCTGTAATCCCAGCACTTTGG" +
          "GAGGCCGAGGCGGGCGGATCACCTGAGGTCAGGAGTTCGAGA" +
          "CCAGCCTGGCCAACATGGTGAAACCCCGTCTCTACTAAAAAT" +
          "ACAAAAATTAGCCGGGCGTGGTGGCGCGCGCCTGTAATCCCA" +
          "GCTACTCGGGAGGCTGAGGCAGGAGAATCGCTTGAACCCGGG" +
          "AGGCGGAGGTTGCAGTGAGCCGAGATCGCGCCACTGCACTCC" +
          "AGCCTGGGCGACAGAGCGAGACTCCGTCTCAAAAA"
        
        var IUB : HashMap<String, Float64> = HashMap()
        IUB["a"] = 0.27
        IUB["c"] = 0.12
        IUB["g"] = 0.12
        IUB["t"] = 0.27
        IUB["B"] = 0.02
        IUB["D"] = 0.02
        IUB["H"] = 0.02
        IUB["K"] = 0.02
        IUB["M"] = 0.02
        IUB["N"] = 0.02
        IUB["R"] = 0.02
        IUB["S"] = 0.02
        IUB["V"] = 0.02
        IUB["W"] = 0.02
        IUB["Y"] = 0.02
        
        var HomoSap : HashMap<String, Float64> = HashMap()
        HomoSap["a"] = 0.3029549426680
        HomoSap["c"] = 0.1979883004921
        HomoSap["g"] = 0.1975473066391
        HomoSap["t"] = 0.3015094502008

        fastaRepeat(2*count*100000,  ALU)
        fastaRandom(3*count*1000, IUB)
        fastaRandom(5*count*1000, HomoSap)

        let expected = 1456000
        if (ret != expected) {
            throw Exception()
        }
    }
}

class Timer {
    // ms
    public func getTime() {
        let time = DateTime.now()
        return time
    }
}

main() {
    let start = Timer().getTime()
    Benchmark().runIteration()
    let end = Timer().getTime()
    println("string-fasta: ms = ${Float64((end-start).toNanoseconds())/1000000.0}")
}

