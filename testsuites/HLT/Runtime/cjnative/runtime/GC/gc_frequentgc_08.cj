/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// (not iOS) EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// (not iOS) RUN-EXEC-PIPE: %export cjHeapSize=4GB && %run %run_opt %output %run_args | compare %f
// ASSERT:scan success
// TIMEOUT: 900

import std.sync.*
import std.collection.*
import std.runtime.*

class Test {
    public var t0: Int64 = 1
}

class BigTest {
    public var t0: Int64 = 1
    public var a1: Test = Test()
    public var r0: Rcd = Rcd()
    public var r1: Rcd = Rcd()
    public var r2: Rcd = Rcd()
    public var r3: Rcd = Rcd()
    public var r4: Rcd = Rcd()
    public var r5: Rcd = Rcd()
    public var r6: Rcd = Rcd()
    public var r7: Rcd = Rcd()
    public var r8: Rcd = Rcd()
    public var r9: Rcd = Rcd()
}

struct Rcd {
    public var a0: Int64 = 0
    public var a1: Int64 = 2
    public var a3: Test = Test()
    public var a4: Test = Test()
    public var a5: Test = Test()
    public var a6: Test = Test()
    public var a7: Test = Test()
    public var a8: Test = Test()
    public var a9: Test = Test()
    public var a10: Test = Test()
    public var a11: Test = Test()
    public var a12: Test = Test()
}

var t1: BigTest = BigTest()

class GC_FrequentGCTest {
    public static var array: Array<Object> = Array<Object>(20 * 1024 * 1024, {i => Object()})
    public static let parallelCoroutineNum = 100
    public static let futureList = ArrayList<Future<Unit>>()

    public static func WaitAllCoroutinesExit(list: ArrayList<Future<Unit>>) {
        var i: Int64 = 0
        while (i < list.size) {
            try {
                list.get(i).getOrThrow().get()
            } catch (e: Exception) {
                print("Exception occured: ${e}\n")
            }
            i++
        }
    }

    public static func FrequentGCTest1(threadCount: Int64) {
        var i: Int64 = 0
        while (i < threadCount) {
            let fut = spawn {
                var j: Int64 = 200000
                j--
                while (j > 0) {
                    t1.r0 = Rcd()
                    sleep(Duration.nanosecond * 100)
                    j--
                }
                if ((t1.r0.a3.t0 == 0) && (array.size != 20 * 1024 * 1024)) {
                    print("error\n")
                }
            }
            futureList.add(fut)
            i++
        }
        WaitAllCoroutinesExit(futureList)
    }
}

var invokeGC: Bool = true

main(): Int64 {
    let gcFut: Future<Unit> = spawn {
        while (invokeGC) {
            GC()
            sleep(Duration.microsecond * 1)
        }
    }
    GC_FrequentGCTest.FrequentGCTest1(GC_FrequentGCTest.parallelCoroutineNum)
    invokeGC = false
    gcFut.get()
    print("success")
    return 0
}
