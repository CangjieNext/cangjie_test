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
 * Description:     Tests the speed with which the virtual machine executes decision-making
 *                  instructions.
 * Main Focus:      TODO
 *
 */

import std.io.*
import std.process.*
import std.math.*
import std.time.*
import std.convert.*
import std.convert.*

class LogicAtom {
    public var wIterationCount: Int64 = 0

    private static var PREDEFINED_ITERATION_COUNT: Int64 = 500000

    public LogicAtom() {
        wIterationCount = 1200
    }

    public func initialize(i: Int64): Bool {
        if (i != 0) {
            wIterationCount = i
        }

        return true
    }

    public func execute(): Int32 {
        var flag7: Bool = true
        var flag8: Bool = true
        var flag9: Bool = true
        var flag10: Bool = true
        var flag11: Bool = true
        var flag12: Bool = true
        var flag6: Bool = true
        var flag: Bool = true
        var flag1: Bool = true
        var flag2: Bool = true
        var flag3: Bool = true
        var flag4: Bool = true
        var flag5: Bool = true
        flag7 = true
        flag8 = true
        flag9 = true
        flag10 = true
        flag11 = true
        flag12 = true

        for (i in 0..wIterationCount) {
            if((flag || flag1) && (flag2 || flag3) && (flag4 || flag5 || flag6)) {
                flag7 = !flag7
                flag8 = !flag8
                flag9 = !flag9
                flag10 = !flag10
                flag11 = !flag11
                flag12 = !flag12
                flag = !flag
                flag1 = !flag1
                flag2 = !flag2
                flag3 = !flag3
                flag4 = !flag4
                flag5 = !flag5
                flag = !flag
                flag1 = !flag1
                flag2 = !flag2
                flag3 = !flag3
                flag4 = !flag4
                flag5 = !flag5
            }
        }
        flag = true
        flag1 = false
        flag2 = true
        flag3 = false
        flag4 = true
        flag5 = false
        for (j in 0..wIterationCount) {
            if((flag || flag1) && (flag2 || flag3) && (flag4 || flag5 || flag6)) {
                flag = !flag
                flag1 = !flag1
                flag2 = !flag2
                flag3 = !flag3
                flag4 = !flag4
                flag5 = !flag5
                flag7 = !flag7
                flag8 = !flag8
                flag9 = !flag9
                flag10 = !flag10
                flag11 = !flag11
                flag12 = !flag12
                flag7 = !flag7
                flag8 = !flag8
                flag9 = !flag9
                flag10 = !flag10
                flag11 = !flag11
                flag12 = !flag12
            }
        }
        if (!flag7 == true) {
            return 1
        }
        return 0
    }

    public func testName(): String {
        return "Logic"
    }

    public func setLocal(): Unit {}

    public func cleanUp(): Int32 {
        return 0
    }

    public func defaultMagnification(): Int32 {
        return 3813
    }

    public func setRemote(): Unit {}

    public func timeLogicAtom(iters: Int32): Unit {
        initialize(PREDEFINED_ITERATION_COUNT)
        for (i in 0..iters) {
            execute()
        }
    }

    public func verifyLogicAtom(): Bool {
        initialize(PREDEFINED_ITERATION_COUNT)
        
        var expected: Int32 = 0
        var found: Int32 = execute()

        if (found != expected) {
            println("ERROR: Expected: " + expected.toString() + ", but found: " + found.toString())
            return false
        }
        return true
    }
}

main(): Int64 {
    var reps: Int32 = 80

    var args = Process.current.arguments
    if (args.size == 1) {
        var num = Int32.tryParse(args[0])??0
        if (num != 0) {
            reps = num
        }
    }

    var obj: LogicAtom = LogicAtom()

    var startTime = DateTime.now()
    obj.timeLogicAtom(reps)
    var endTime = DateTime.now()
    var durTime = endTime - startTime
    var perTime: Float64 = Float64(durTime.toNanoseconds())/Float64(reps)

    if (obj.verifyLogicAtom() == true) {
        print(perTime.format(".2") + "ns\n")
    } else {
        print("Error!\n")
    }

    return 0
}