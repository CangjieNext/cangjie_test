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
 * Description:     The Method test executes recursive function calls to see how well the VM handles
 *                  method calls.
 * Main Focus:      TODO
 *
 */
import std.process.*
import std.time.*
import std.convert.*
import std.convert.*

class MethodAtom {
    public var wIterationCount: Int32 = 0

    public MethodAtom() {
        wIterationCount = 100
    }

    public var depthCount: Int32 = 0
    private static var PREDEFINED_ITER_COUNT: Int32 = 2000
    public func setRemote(): Unit {}

    public func arithmeticSeries(i: Int32): Int32 {
        if (i == 0) {
            return 0
        } else {
            return (i + arithmeticSeries(i-1))
        }
    }

    public func initialize(i: Int32): Bool {
        if (i != 0) {
            wIterationCount = i
        }
        return true
    }

    public func execute(): Int32 {
        var j: Int32 = 0
        for (i in 0..wIterationCount) {
            var k: Int32 = arithmeticSeries(i)
            var l: Int32 = notInlineableSeries(i)
            if (k>l) {
                j += l
            } else {
                j += k
            }
        }
        return j
    }

    public func testName(): String {
        return "Method"
    }

    public func setLocal(): Unit {}

    public func cleanUp(): Int32 {
        return 0
    }

    public func defaultMagnification(): Int32 {
        return 3728
    }

    public func notInlineableSeries(i: Int32): Int32 {
        var j: Int32 = i
        depthCount++
        if (i==0) {
            return j
        }
        if ((j &1) != 0) {
            j += notInlineableSeries(i-1)
        } else {
            j += 1 + notInlineableSeries(i-1)
        }
        return j
    }

    public func timeMethodAtom(iters: Int32): Unit {
        initialize(PREDEFINED_ITER_COUNT)
        for (i in 0..iters) {
            execute()
        }
    }

    public func verifyMethodAtom() {
        initialize(PREDEFINED_ITER_COUNT)
        var expected: Int32 = 1333333000
        var found: Int32 = execute()

        if (found != expected) {
            println("ERROR! Expected: " + expected.toString() + ", but found: " + found.toString())
            return false
        }
        return true
    }
}

main(): Int64 {
    var reps: Int32 = 9

    var args = Process.current.arguments
    if (args.size == 1) {
        var num = Int32.tryParse(args[0])??0
        if (num != 0) {
            reps = num
        }
    }

    var obj: MethodAtom = MethodAtom()

    var startTime = DateTime.now()
    obj.timeMethodAtom(reps)
    var endTime = DateTime.now()
    var durTime = endTime - startTime
    var perTime: Float64 = Float64(durTime.toNanoseconds())/Float64(reps)

    if (obj.verifyMethodAtom() == true) {
        print(perTime.format(".2") + "ns\n")
    } else {
        print("Error!\n")
    }

    return 0
}
