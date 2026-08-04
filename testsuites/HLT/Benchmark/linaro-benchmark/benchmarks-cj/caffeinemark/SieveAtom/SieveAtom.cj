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
 * Description:     The classic sieve of eratosthenes finds prime numbers.
 * Main Focus:      TODO
 *
 */

import std.process.*
import std.time.*
import std.convert.*
import std.convert.*

class SieveAtom {
    public var wPrimes: Array<Int32> = Array<Int32>()
    public var wMaxCandidate: Int32 = 0

    private static var PREDEFINED_MAX_CANDIDATE: Int32 = 10000

    public SieveAtom() {
        wMaxCandidate = 512
    }

    public func initialize(i: Int32): Bool {
        if (i != 0) {
            wMaxCandidate = i
        }
        wPrimes = Array<Int32>(Int64(wMaxCandidate), repeat:0)
        return true
    }

    public func execute(): Int32 {
        var j: Int64 = 1
        var flag1: Bool = false
        wPrimes[0] = 1
        wPrimes[1] = 2
        j = 2
        for (i in 3..wMaxCandidate) {
            var k: Int64 = 1
            var flag: Bool = true
            for (x in k..j) {
                if(wPrimes[x] > 0 && wPrimes[x] <= i / 2 && i % wPrimes[x] == 0) {
                    flag = false
                }
            }

            if (flag) {
                j++
                wPrimes[j-1] = i
            }
        }
        return Int32(j)
    }

    public func testName(): String {
        return "Sieve"
    }

    public func setLocal(): Unit {}

    public func cleanUp(): Int32 {
        return 0
    }

    public func defaultMagnification(): Int32 {
        return 2771
    }

    public func setRemote(): Unit {}

    public func timeSieveAtom(iters: Int32): Unit {
        initialize(PREDEFINED_MAX_CANDIDATE)
        for (i in 0..iters) {
            execute()
        }
    }

    public func verifySieveAtom(): Bool {
        initialize(PREDEFINED_MAX_CANDIDATE)
        var expected: Int32 = 1230
        var found: Int32 = execute()

        if (found != expected) {
            println("ERROR: Expected: " + expected.toString() + ", but found: " + found.toString())
            return false
        }
        return true
    }
}

main(): Int64 {
    var reps: Int32 = 90

    var args = Process.current.arguments
    if (args.size == 1) {
        var num = Int32.tryParse(args[0])??0
        if (num != 0) {
            reps = num
        }
    }

    var obj: SieveAtom = SieveAtom()

    var startTime = DateTime.now()
    obj.timeSieveAtom(reps)
    var endTime = DateTime.now()
    var durTime = endTime - startTime
    var perTime: Float64 = Float64(durTime.toNanoseconds())/Float64(reps)

    if (obj.verifySieveAtom() == true) {
        print(perTime.format(".2") + "ns\n")
    } else {
        print("Error!\n")
    }

    return 0
}
