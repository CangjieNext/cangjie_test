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

/*
 * Description:     The loop test uses sorting and sequence generation as to measure compiler
 *                  optimization of loops.
 * Main Focus:      TODO
 *
 */

import std.process.*
import std.time.*
import std.convert.*
import std.convert.*

class LoopAtom {
    public var dummy: Int32 = 0
    public var FIBCOUNT: Int32 = 0
    public var sum1: Int32 = 0
    public var sum2: Int32 = 0
    public var fibs: Array<Int32> = Array<Int32>()

    public LoopAtom() {
        dummy = 12
        FIBCOUNT =64
    }

    public func initialize(i: Int32): Bool {
        if (i != 0) {
            FIBCOUNT = i
        }
        fibs = Array<Int32>(Int64(FIBCOUNT), repeat:0)
        return true
    }

    public func execute(): Int32 {
        fibs[0] = 1
        for(i in 1..Int64(FIBCOUNT)) {
            fibs[i] = fibs[i-1] + Int32(i)
        }

        var j1: Int32 = 0
        var k1: Int32 = 0
        for (j in 0..Int64(FIBCOUNT)) {
            for (k in 1..Int64(FIBCOUNT)) {
                var l: Int32 = FIBCOUNT + dummy
                j1 += l
                k1 += 2
                if (fibs[k-1] < fibs[k]) {
                    var i1: Int32 = fibs[k-1]
                    fibs[k-1] = fibs[k]
                    fibs[k] = i1
                }
            }
        }

        sum1 = j1
        sum2 = k1
        return fibs[0]
    }

    public func testName(): String {
        return "Loop"
    }

    public func setLocal(): Unit {}

    public func cleanUp(): Int32 {
        return 0
    }

    public func defaultMagnification(): Int32 {
        return 2692
    }

    public func setRemote(): Unit {}

    private static var PREDEFINED_FIB_COUNT: Int32 = 1000

    public func timeLoopAtom(iters: Int32): Unit {
        initialize(PREDEFINED_FIB_COUNT)
        for (i in 0..iters) {
           execute()
        }
    }

    public func verifyLoopAtom(): Bool {
        initialize(PREDEFINED_FIB_COUNT)
        var expected: Int32 = 499501
        var found: Int32 = execute()

        if (found != expected) {
            println("ERROR! Expected: " + expected.toString() + ", but found: " + found.toString())
            return false
        }
        return true
    }
}

main(): Int64 {
    var reps: Int32 = 120

    var args = Process.current.arguments
    if (args.size == 1) {
        var num = Int32.tryParse(args[0])??0
        if (num != 0) {
            reps = num
        }
    }

    var obj: LoopAtom = LoopAtom()
    
    var startTime = DateTime.now()
    obj.timeLoopAtom(reps)
    var endTime = DateTime.now()
    var durTime = endTime - startTime
    var perTime: Float64 = Float64(durTime.toNanoseconds())/Float64(reps)

    if (obj.verifyLoopAtom() == true) {
        print(perTime.format(".2") + "ns\n")
    } else {
        print("Error!\n")
    }

    return 0
}
