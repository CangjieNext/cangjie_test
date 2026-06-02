/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not iOS) EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// (not iOS) RUN-EXEC-PIPE: %export cjHeapSize=4GB && %run %run_opt %output %run_args | compare %f
// ASSERT:scan success

import std.sync.*
import std.collection.*
import std.runtime.*

class A {
    var testI1: Bool = true
    var testI8: Int8 = 0
    var testI16: Int16 = 0
    var testI32: Int32 = 0
    var testI64: Int64 = 0
    var testF16: Float16 = 1.0
    var testF32: Float32 = 1.0
    var testF64: Float64 = 1.0
}

class GC_FrequentGCTest {
    public static var array: Array<Object> = Array<Object>(10 * 1024 * 1024, {i => Object()})
    public static let parallelCoroutineNum :Int64= 50
    public static let futureList:ArrayList<Future<Unit>> = ArrayList<Future<Unit>>()

    public static func WaitAllCoroutinesExit(list: ArrayList<Future<Unit>>):Unit {
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

    public static func FrequentGCTest1(threadCount: Int64):Unit {
        var i: Int64 = 0
        while (i < threadCount) {
            let fut = spawn {
                var j: Int64 = 200000
                var a = A()
                j--
                while (j > 0) {
                    if (a.testI1) {
                        a.testI1 = false
                    } else {
                        a.testI1 = false
                    }
                    a.testI8 = Int8(j % 127)
                    a.testI16 = Int16(j % 32766)
                    a.testI32 = Int32(j)
                    a.testI64 = j
                    a.testF16 = Float16(Float16(j) / 200000.0)
                    a.testF32 = Float32(Float32(j) / 200000.0)
                    a.testF64 = Float64(Float64(j) / 200000.0)
                    sleep(Duration.nanosecond * 100)
                    j--
                }
                if ((a.testI8 == 0) || (a.testI16 == 0) || (a.testI32 == 0) || (a.testI64 == 0) || (a.testF16 > 0.1) || (a
                    .testF32 > 0.1) || (a.testF64 > 0.1) || (array.size != 20 * 1024 * 1024)) {
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
