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
 * Description:     Simulates a 3D rotation of objects around a point.
 * Main Focus:      TODO
 *
 */

import std.io.*
import std.process.*
import std.math.*
import std.time.*
import std.convert.*
import std.convert.*

class FloatAtom {

    public var xA: Array<Array<Float32>> = Array<Array<Float32>>()
    public var xB: Array<Array<Float32>> = Array<Array<Float32>>()
    public var vA: Array<Array<Float32>> = Array<Array<Float32>>()
    public var vB: Array<Array<Float32>> = Array<Array<Float32>>()
    public var wMaxDegrees: Int64 = 0

    private static var PREDEFINED_MAX_DEGREES: Int64 = 10000

    public FloatAtom() {
        wMaxDegrees = 185
    }

    public func initialize(i: Int64): Bool {
        if (i != 0) {
            wMaxDegrees = i
        }

        xA = Array<Array<Float32>>(3, repeat:Array<Float32>(3, repeat:0.0))
        vA = Array<Array<Float32>>(3, repeat:Array<Float32>(20, repeat:0.0))
        vB = Array<Array<Float32>>(3, repeat:Array<Float32>(20, repeat:0.0))

        var j: Int64 = 0
        do {
            vA[0][j] = Float32(j)
            vA[1][j] = Float32(!j)
            vA[2][j] = Float32(j) * 3.1415926535897931
            j += 1
        } while (j < 20)

        return true
    }

    public func execute(): Int64 {
        var m: Int64 = 0
        for (j in 0..wMaxDegrees:5) {
            var d: Float32 = Float32(j) * 3.1415926535897931 / 180.0
            var d1: Float32 = sin(d)
            var d2: Float32 = cos(d)

            xA[0][0] = d2
            xA[1][0] = d1
            xA[2][0] = 0.0
            xA[0][1] = -d1
            xA[1][1] = d2
            xA[2][1] = 0.0
            xA[0][2] = 0.0
            xA[1][2] = 0.0
            xA[2][2] = 1.0

            var i: Int64 = 0
            do {
                vB[0][i] = 0.0
                vB[1][i] = 0.0
                vB[2][i] = 0.0
                var l: Int64 = 0
                do {
                    var k: Int64 = 0
                    do {
                        vB[l][i] = vB[l][i] + xA[k][l] * vB[l][i]
                        k += 1
                    } while (k < 3)
                    l += 1
                } while ( l < 3)
                i += 1
            } while ( i < 20)
        }
        return m
    }

    public func testName(): String {
        return "Float"
    }

    public func setLocal(): Unit {}

    public func cleanUp(): Int32 {
        return 0
    }

    public func defaultMagnification(): Int32 {
        return 4449
    }

    public func setRemote(): Unit {}

    public func timeFloatAtom(iters: Int32): Unit {
        initialize(PREDEFINED_MAX_DEGREES)
        for (i in 0..iters) {
            execute()
        }
    }

    public func verifyFloatAtom(): Bool {
        initialize(PREDEFINED_MAX_DEGREES)
        execute()
        var sum: Float32 = 0.0

        for (i in 0..20) {
            sum += vB[0][i] + vB[1][i] + vB[2][i]
        }

        var expected: Float32 = 0.0
        var found: Float32 = sum

        if (abs(expected - found) > 0.000000001) {
            println("ERROR: Expected: " + expected.toString() + ", but found: " + found.toString())
            return false
        }
        return true
    }
}

main(): Int64 {
    var reps: Int32 = 100

    var args = Process.current.arguments
    if (args.size == 1) {
        var num = Int32.tryParse(args[0])??0
        if (num != 0) {
            reps = num
        }
    }

    var obj: FloatAtom = FloatAtom()

    var startTime = DateTime.now()
    obj.timeFloatAtom(reps)
    var endTime = DateTime.now()
    var durTime = endTime - startTime
    var perTime: Float64 = Float64(durTime.toNanoseconds())/Float64(reps)

    if (obj.verifyFloatAtom() == true) {
        print(perTime.format(".2") + "ns\n")
    } else {
        print("Error!\n")
    }

    return 0
}
