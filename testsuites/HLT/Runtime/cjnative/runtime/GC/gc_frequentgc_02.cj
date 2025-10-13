/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: check_array.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt check_array.cj -o libcangjie-check.%middle
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -L. -lcangjie-check -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan success

import A.*
import std.sync.*
import std.collection.*
import std.runtime.*
import std.argopt.*
import std.process

let tmpCheck: CheckArray = CheckArray()

class Test <: TestBase {
    public var t0: Int32 = 1
    ~init() {
        tmpCheck.SetIndex(index)
    }
}

class GC_FrequentGCTest {
    public static let kAllocActivenessSize:Int64 = 64 + 8 // enable the local buffer when allocates > 64 times
    public static var gObj:Test = Test()
    public static let parallelCoroutineNum:Int64 = 100
    public static let futureList:ArrayList<Future<Unit>> = ArrayList<Future<Unit>>()
    public static var curCoroutineIndex: AtomicInt64 = AtomicInt64(0)

    public static func ActivateLocalBuffer():Unit {
        var j: Int64 = 0
        while (j < kAllocActivenessSize) {
            gObj = Test()
            j++
        }
    }

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
        curCoroutineIndex.store(0)

        var i: Int64 = 0
        while (i < threadCount) {
            let fut = spawn {
                let curIndex: Int64 = curCoroutineIndex.fetchAdd(1)
                sleep(Duration.millisecond * curIndex)
                var objIndex: Int64 = tmpCheck.RegisterIndex(Test()) // allocate from coroutine's local buffer

                let ao = ArgOpt(process.Process.current.arguments, "", ["asan"])
                let map = ao.getArgumentsMap()
                if (map.contains("--asan")) {
                    GC()
                    sleep(Duration.second * 2) // for finalizer, wait it done
                }
                if (!tmpCheck.CheckItem(objIndex)) { // obj should be freed by current coroutine's block GC call
                    print("fail: coroutine=" + curIndex.toString() + "'s blocking GC call!\n")
                }
            }
            futureList.add(fut)
            i++
        }
        WaitAllCoroutinesExit(futureList)
    }
}

// Objective: when invokeGC is called by multi-coroutines, each coroutine should block till current GC is finished
main(): Int64 {
    GC_FrequentGCTest.FrequentGCTest1(GC_FrequentGCTest.parallelCoroutineNum)
    print("success")
    return 0
}
