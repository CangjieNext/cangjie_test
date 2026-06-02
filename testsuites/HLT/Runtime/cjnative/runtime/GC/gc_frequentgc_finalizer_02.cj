/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan success

import std.sync.*
import std.collection.*
import std.runtime.*

class GC_FrequentGCTest {
    public static let parallelCoroutineNum = 100
    public static let futureBuf:ArrayList<Future<Unit>> = ArrayList<Future<Unit>>()
    public static var curCoroutineIndex: AtomicInt64 = AtomicInt64(0)
    public static let flagList:Array<AtomicInt64> = Array<AtomicInt64>(100, repeat: AtomicInt64(0))

    public let index: Int64
    public init(n: Int64) {
        index = n
        flagList[index].store(index)
    }
    ~init() {
        let n: Int64 = flagList[index].load()
        if (n != index) {
            print("fail: finalizer run error " + index.toString() + " " + n.toString() + "\n")
        }
        flagList[index].store(0)
    }

    public static func test(n: Int64): Int64 {
        let obj = GC_FrequentGCTest(n)
        return flagList[n].load()
    }

    public static func WaitAllCoroutinesExit(buf: ArrayList<Future<Unit>>):Unit {
        var i: Int64 = 0
        while (i < buf.size) {
            try {
                buf.get(i).getOrThrow().get()
            } catch (e: Exception) {
                print("Exception occured: ${e}\n")
            }
            i++
        }
    }

    public static func FrequentGCTest1():Unit {
        var i: Int64 = 0
        while (i < 100) {
            flagList[i] = AtomicInt64(0)
            i++
        }
        curCoroutineIndex.store(0)

        i = 0
        while (i < parallelCoroutineNum) {
            let fut = spawn {
                let curIndex: Int64 = curCoroutineIndex.fetchAdd(1)
                sleep(Duration.millisecond * curIndex)
                if (test(curIndex) != curIndex) {
                    print("fail: coroutine=" + curIndex.toString() + "'s init call!\n")
                }
                GC()
                sleep(Duration.millisecond * 200)
                if (flagList[curIndex].load() != 0) { // obj should be freed by current coroutine's block GC call
                    print("fail: coroutine=" + curIndex.toString() + "'s blocking GC call!\n")
                }
            }
            futureBuf.add(fut)
            i++
        }
        WaitAllCoroutinesExit(futureBuf)
    }

    public static func FinalizerCheck():Unit {
        let totalIndex: Int64 = curCoroutineIndex.load()
        if (totalIndex != parallelCoroutineNum) {
            print("fail: totalIndex=" + totalIndex.toString() + "!\n")
        }
        var i: Int64 = 0
        while (i < parallelCoroutineNum) {
            let n: Int64 = flagList[i].load()
            if (n != 0) { // obj should be freed by current coroutine's block GC call
                print("fail: finalizer check error " + i.toString() + " " + n.toString() + "\n")
            }
            i++
        }
    }
}

// Objective: when invokeGC is called by multi-coroutines, each coroutine should block till current GC is finished
main(): Int64 {
    GC_FrequentGCTest.FrequentGCTest1()
    GC_FrequentGCTest.FinalizerCheck()
    print("success")
    return 0
}
