/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping %f -o %output
// RUN-EXEC: %export cjHeapSize=16GB && %export JETVMPROP="-Xmx2G" && %run %run_opt %output %run_args

import std.process.*
import std.time.*
import std.convert.*
import std.convert.*

class NSieveAccess {
    private var EXPECTED: Int64 = 14302

    private var NUM_SIEVES: Int64 = 4

    private var flags: Array<Bool> = Array<Bool>(80001, repeat:false)

    private var results: Array<Int64> = Array<Int64>(NUM_SIEVES, repeat:0)

    private func nsieve(m: Int64): Int64 {
        for (i in 2..=m) {
            flags[i] = true
        }

        var count: Int64 = 0

        for (i in 2..=m) {
            if (flags[i]) {
                for (k in i+i..=m:i) {
                    flags[k] = false
                }
                count++
            }
        }
        return count
    }

    public func timeNSieveAccess(iterations: Int64): Unit {
        for (iter in 0..iterations) {
            for (i in 0..NUM_SIEVES) {
                var sum: Int64 = 0
                for (o in 1..=3) {
                    var m: Int64 = (1 << o) * 10000
                    sum += nsieve(m)
                }
                results[i] = sum
            }
        }
    }

    public func verify(): Bool {
        for (i in 0..NUM_SIEVES) {
            if (results[i] != EXPECTED) {
                return false
            }
        }
        return true
    }
}

main(): Int64 {
    var reps: Int64 = 100

    var args = Process.current.arguments
    if (args.size == 1) {
        var num = Int64.tryParse(args[0])??0

        if (num != 0) {
            reps = num
        }
    }

    var obj: NSieveAccess = NSieveAccess()

    var startTime = DateTime.now()
    obj.timeNSieveAccess(reps)
    var endTime = DateTime.now()
    var durTime = endTime - startTime
    var perTime: Float64 = Float64(durTime.toNanoseconds())/Float64(reps)

    if (obj.verify() == true) {
        print(perTime.format(".2") + "ns\n")
    } else {
        print("Error!\n")
    }

    return 0
}
