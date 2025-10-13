/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %export cjHeapSize=4GB && %run %run_opt %output %run_args | compare %f
// ASSERT:scan success

import std.sync.*
import std.collection.*
import std.runtime.*

class GC_FrequentGCTest {
    public static var array: Array<Object> = Array<Object>(10 * 1024 * 1024, {i => Object()})
    public static let parallelCoroutineNum:Int64 = 50
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
                let testI1 = AtomicBool(true)
                let testI8 = AtomicInt8(Int8(j % 127))
                let testI16 = AtomicInt16(Int16(j % 32766))
                let testI32 = AtomicInt32(Int32(j))
                let testI64 = AtomicInt64(j)
                j--
                while (j > 0) {
                    if (testI1.load()) {
                        testI1.compareAndSwap(true, false)
                    } else {
                        testI1.compareAndSwap(false, true)
                    }
                    testI8.compareAndSwap(Int8((j + 1) % 127), Int8(j % 127))
                    testI16.compareAndSwap(Int16((j + 1) % 32766), Int16(j % 32766))
                    testI32.compareAndSwap(Int32(j + 1), Int32(j))
                    testI64.compareAndSwap((j + 1), j)
                    sleep(Duration.nanosecond * 100)
                    j--
                }
                if (testI1.load() || (testI8.load() != 1) || (testI16.load() != 1) || (testI32.load() != 1) || (testI64
                    .load() != 1) || (array.size != 20 * 1024 * 1024)) {
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
