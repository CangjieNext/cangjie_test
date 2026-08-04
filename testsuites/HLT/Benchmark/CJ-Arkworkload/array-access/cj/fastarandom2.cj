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

struct AminoAcid {
    var prob:Float64
    var sym: UInt8
    public init(prob:Float64,  sym: UInt8){
        this.prob =prob
        this.sym = sym    
    }
}

let IM = 139968
let IA = 3877
let IC = 29573
var seed = 42

let width = 60

var homosapiens:Array<AminoAcid> = [
    AminoAcid(0.3029549426680, 97), // "a"),
    AminoAcid(0.1979883004921, 99), // "c"),
    AminoAcid(0.1975473066391, 103), // "g"),
    AminoAcid(0.3015094502008, 116) // "t"),
]

@OverflowWrapping
func search(rnd!: Float64, arr!: Array<AminoAcid>) : UInt8 {
    var low = 0
    var high = arr.size - 1
    while (low <= high) {
        let mid = (high + low) >> 1
        if (arr[mid].prob >= rnd) {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    return arr[high+1].sym
}

func accumulateProbabilities( acid!: Array<AminoAcid>) {
    for (i in 1..acid.size) {
        var tmp = acid[i]
        tmp.prob += acid[i-1].prob
        acid[i] = tmp
    }
}

@OverflowWrapping
func randomFasta(buffer!: Array<Int64>, acid!: Array<AminoAcid>, n!: Int64) {
    var cnt = n
    accumulateProbabilities(acid: acid)
    var pos = 0
    while (cnt > 0) {
        var m = cnt
        if (m > width) {
            m = width
        }
        let f = 1.0 / Float64(IM)
        var myrand = seed
        for (_ in 0..m) {
            myrand = (myrand * IA + IC) % IM
            let r = Float64(myrand) * f
            buffer[pos] = Int64(search(rnd: r, arr: acid))
            pos += 1
            if (pos == buffer.size) {
                pos = 0
            }
        }
        seed = myrand
        buffer[pos] = 10
        pos += 1
        if (pos == buffer.size) {
            pos = 0
        }
        cnt -= m
    }
}

func runFasta3():Int64{
    let bufferSize = 256 * 1024
    var buffer = Array<Int64>(bufferSize, repeat:10)
    let n: Int64 = 250000
    timer.start()
    randomFasta(buffer: buffer, acid: homosapiens,n:5*n)
    let time = timer.stop()
    print("Array Access - RunFastaRandom2:\t${Float64(time.toNanoseconds())/1000000.0}\tms\n");
    return  0
}

main() {
    runFasta3()
    return 0
}

