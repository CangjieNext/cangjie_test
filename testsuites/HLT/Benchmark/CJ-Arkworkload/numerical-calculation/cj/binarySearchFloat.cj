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

@OverflowWrapping
func complexFloatNumeric() : Float64 {
    let count = 5000000
    let testArray = [2.3, 4.6, 5.2, 5.5, 6.1, 6.7, 7.4, 7.6, 7.886, 8.2, 9.11, 10.02, 33.2];
    var res = 5
    timer.start()
    let testArrayLength = testArray.size
    for (i in 1..count) {
        let value = testArray[i % res & (testArrayLength - 1)]
        var tmp = 0
        var low = 0
        var high = testArrayLength - 1
        var middle = high >> 1
        while (low <= high) {
            let test = testArray[middle]
            if (test > value) {
                high = middle - 1
            } else if( test < value ){
                low = middle + 1
            } else {
                tmp = middle
                break
            }
            middle = (low + high) >> 1
        }
        res += tmp
    }
    let time = timer.stop()
//    print(res)
    print("Numerical Calculation - ComplexFloatNumeric:\t${Float64(time.toNanoseconds())/1000000.0}\tms\n");
    return Float64( time.toMilliseconds())
}

func runComplexFloatNumeric():Float64{
    return complexFloatNumeric()
}

main() {
    runComplexFloatNumeric()
    return 0
}
