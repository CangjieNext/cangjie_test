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

// 1 op = 2 assigns, 16 compare/branches, 8 ANDs, (0-8) ADDs, 8 SHLs
// O(n)
func bitsinbyte(b: Int64): Int64 {
    var m = 1
    var c = 0
    while (m < 0x100) {
        if ((b & m) != 0) {
            c += 1
        }
        m <<= 1
    }
    return c
}

func TimeFunc(): Int64 {
    var sum = 0
    for (x in 0..350) {
        for (y in 0..256) {
            sum += bitsinbyte(y)
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
        result = TimeFunc()
        let expected = 358400
        if (result != expected) {
            println("ERROR: bad result: expected ${expected} but got ${result}")
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
    println("bitops-bits-in-byte: ms = ${Float64((endTime-startTime).toNanoseconds())/1000000.0}")
}
