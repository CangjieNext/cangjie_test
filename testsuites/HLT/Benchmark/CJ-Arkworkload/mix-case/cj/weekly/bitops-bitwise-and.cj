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

let inDebug = false

/*
 * @State
 * @Tags Jetstream2
 */
class Benchmark {
    /*
    * @Benchmark
    */
    func run() {
        var bitwiseAndValue = 4294967296
        for (i in 0..600000) {
            bitwiseAndValue = bitwiseAndValue & i;
           
        }

        let result = bitwiseAndValue
        let expected = 0
        if (result != expected) {
            throw Exception("ERROR: bad result: expected ${expected} but got ${result}")
        }
    }
}

class Timer {
    public func getTime() {
        let time = DateTime.now()
        return time 
    }
}

main() {
    let startTime = Timer().getTime()
    for (i in 0..80) {
        
        Benchmark().run()
  
    }
    let endTime = Timer().getTime()
    println("bitops-bitwise-and: ms = ${Float64((endTime-startTime).toNanoseconds())/1000000.0}")
}
