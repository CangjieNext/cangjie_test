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

struct A {
    var num: Int64 = 0
    var obj = Object()
    init(num: Int64) {
        this.num = num
    }
}

var a = A(0)

class GC_FrequentGCTest {
    public static var array: Array<Object> = Array<Object>(10 * 1024 * 1024, {i => Object()})
    public static let parallelCoroutineNum :Int64= 50
    public static let futureList :ArrayList<Future<Unit>>= ArrayList<Future<Unit>>()

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
                j--
                while (j > 0) {
                    a = A(j)
                    sleep(Duration.nanosecond * 100)
                    j--
                }
                if ((a.num == 0) && (array.size != 20 * 1024 * 1024)) {
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
