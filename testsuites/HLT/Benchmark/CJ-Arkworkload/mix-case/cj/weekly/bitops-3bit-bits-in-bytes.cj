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
import std.math.*

let inDebug = false
func log(str: String) {
    if (inDebug) {
        print(str)
    }
}

func currentTimestamp13() {
    return Timer().getTime()
}

var result = 0

// 1 op = 6 ANDs, 3 SHRs, 3 SHLs, 4 assigns, 2 ADDs
// O(1)
func fast3bitlookup(b: Int64): Int64 {
    var c1 = 0  // 0b1110 1001 1001 0100;
    var bi3b = 0xe994  // 3 2 2 1  2 1 1 0
    c1 = 3 & (bi3b >> ((b << 1) & 14))
    c1 += 3 & (bi3b >> ((b >> 2) & 14))
    c1 += 3 & (bi3b >> ((b >> 5) & 6))
    return c1

    /*
       lir4,0xE994; 9 instructions, no memory access, minimal register dependence, 6 shifts, 2 adds, 1 inline assign
       rlwinmr5,r3,1,28,30
       rlwinmr6,r3,30,28,30
       rlwinmr7,r3,27,29,30
       rlwnmr8,r4,r5,30,31
       rlwnmr9,r4,r6,30,31
       rlwnmr10,r4,r7,30,31
       addr3,r8,r9
       addr3,r3,r10
     */
}

func TimeFunc(func1: ((b: Int64) -> Int64)): Int64 {
    var x = 0
    var y = 0
    var t = 0
    var sum = 0
    for (x in 0..500) {
        for (y in 0..256) {
            sum += func1(y)
        }
    }
    return sum
}

/*
 * @State
 * @Tags Jetstream2
 */
class Benchmark {
    /*
    * @Benchmark
    */
    func run() {
        let sum = TimeFunc(fast3bitlookup)
        let expected = 512000
        if (sum != expected) {
            println("ERROR: bad result: expected ${expected} but got ${sum}")
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
    let startTime = currentTimestamp13()
    for (i in 0..80) {
        let startTimeInLoop = currentTimestamp13()
        Benchmark().run()
        let endTimeInLoop = currentTimestamp13()
        
    }
    let endTime = currentTimestamp13()
    println("bitops-3bit-bits-in-byte: ms = ${Float64((endTime-startTime).toNanoseconds())/1000000.0}")
}
