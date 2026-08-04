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
import std.overflow.*

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
var global = 0

@OverflowWrapping
func runBitOp1() : Int64 {
    var res = 0
    let count = 6000000
    let resources: Array<Int64> = [12, 43, 56, 76, 89, 54, 45, 32, 35, 47, 46, 44, 21, 37, 84]
    timer.start()
    let resourcesLength = resources.size - 1
    for (i in 0..count) {
        let bi3b = 0xE994;
        let b = resources[(i & res) & resourcesLength];
               res += 3 & (bi3b >> ((b << 1) & 14));
               res += 3 & (bi3b >> ((b >> 2) & 14));
               res += 3 & (bi3b >> ((b >> 5) & 6));
    }
    let time = timer.stop()
    println(res)
    // assert(res == 8, "res should be equal to 8")
    print("Numerical Calculation - RunBitOp1:\t${Float64(time.toNanoseconds())/1000000.0}\tms\n");
    return Int64(time.toMilliseconds())
}

func runBitOp2() : Int64 {
    var res = 0;
    timer.start()
    for (x in 0..6000000) {
        let b = x
        var m = 1
        var c = 0
        while (m < 0x100) {
            if ((b & m) != 0) {
                c += 1
            }
            m <<= 1
        }
        res += c
    }
    let time = timer.stop()
    println(res)
    // assert(res == 8, "res should be equal to 8")
    print("Numerical Calculation - RunBitOp2:\t${Float64(time.toNanoseconds())/1000000.0}\tms\n");
    return Int64(time.toMilliseconds())
}

@OverflowWrapping
func runBitOp3() : Int64 {
    var res = 0;
    timer.start()
    for (y in 0..6000000) {
        var x = y
        var r = 0
        while (x != 0) {
            x &= x - 1
            r += 1
        }
        res += r
    }
    let time = timer.stop()
    println(res)
    print("Numerical Calculation - RunBitOp3:\t${Float64(time.toNanoseconds())/1000000.0}\tms\n");
    return Int64(time.toMilliseconds())
}

@OverflowWrapping
func runBitOp4()  : Int64 {
    var results = [3, 53, 76, 37, 82, 23, 66, 17, 82, 43, 77, 93, 28, 24, 85]
    let resources: Array<UInt64> = [12, 43, 56, 76, 89, 54, 45, 32, 35, 47, 46, 44, 21, 37, 84]
        var res = 0
        timer.start()
        let resultsLength = results.size - 1
        let resourcesLength = resources.size - 1
        for (i in 0..6000000) {
            res |= !(1.wrappingShl(resources[i & resourcesLength] ^ 31));
        }
        let time = timer.stop()
        println(res)
        print("Numerical Calculation - RunBitOp4:\t"+time.toMilliseconds().toString()+"\tms\n");
        return Int64(time.toMilliseconds())
}



main() {
    runBitOp1()
    runBitOp2()
    runBitOp3()
    runBitOp4()
    print("Bitops Is End , global value is ${global}")
    return 0
}
