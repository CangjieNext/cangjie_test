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
 * Description:     The string test conducts a list of operations on strings and string buffers.
 * Main Focus:      TODO
 *
 */

import std.io.*
import std.process.*
import std.time.*
import std.convert.*
import std.convert.*
import std.collection.*

class StringAtom {
    public var stringBuffer: StringBuilder = StringBuilder()
    public var wIterationCount: Int64 = 0
    public var sPattern1: String = ""
    public var sPattern2: String = ""
    public var sPattern3: String = ""

    private static var PREDEFINED_ITER_COUNT: Int64 = 500

    public StringAtom() {
        wIterationCount = 50
    }

    public func initialize(i: Int64): Bool {
        if (i != 0) {
            wIterationCount = i
        }
        sPattern1 = "one "
        sPattern2 = "two "
        sPattern3 = "three "
        return true
    }

    public func execute(): Int64 {
        stringBuffer = StringBuilder()
        stringBuffer.append("Test")
        for (j in 0..wIterationCount) {
            stringBuffer.append([sPattern1, sPattern2, sPattern3])
        }
        stringBuffer.append("four")
        for(k in 0..wIterationCount) {
            if (k*65 < stringBuffer.size) {
                var substringstream: String = stringBuffer.toString()
                var indexes = substringstream.indexOf("four", k*65)
                var i: Int64 = match (indexes) {
                    case Some(x) => x
                    case None => -1
                }
            }
        }
        return stringBuffer.size
    }

    public func testName(): String {
        return "String"
    }

    public func setLocal(): Unit {}

    public func cleanUp(): Int32 {
        return 0
    }

    public func defaultMagnification(): Int32 {
        return 2771
    }

    public func setRemote(): Unit {}

    public func timeStringAtom(iters: Int32): Unit {
        initialize(PREDEFINED_ITER_COUNT)
        for (i in 0..iters) {
            execute()
        }
    }

    public func verifyStringAtom(): Bool {
        initialize(PREDEFINED_ITER_COUNT)
        var expected: Int64 = 7008
        var found: Int64 = execute()

        if (found != expected) {
            println("ERROR: Expected: " + expected.toString() + ", but found: " + found.toString())
            return false
        }
        return true
    }
}

main(): Int64 {
    var reps: Int32 = 50

    var args = Process.current.arguments
    if (args.size == 1) {
        var num = Int32.tryParse(args[0])??0
        if (num != 0) {
            reps = num
        }
    }

    var obj: StringAtom = StringAtom()

    var startTime = DateTime.now()
    obj.timeStringAtom(reps)
    var endTime = DateTime.now()
    var durTime = endTime - startTime
    var perTime: Float64 = Float64(durTime.toNanoseconds())/Float64(reps)

    if (obj.verifyStringAtom() == true) {
        print(perTime.format(".2") + "ns\n")
    } else {
        print("Error!\n")
    }

    return 0
}
