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

class FieldObject {
    public static let kNullFieldObj:FieldObject = FieldObject(-1)
    public FieldObject(var i0: Int64) {}
}

class Foo {
    public static let kNullFoo:Foo = Foo(-1, FieldObject.kNullFieldObj)
    public Foo(var i: Int64, var f0: FieldObject) {}
}

let kThreadNum = 10
let kHeapObjArrayColumnSize = 50000 // need fine tune
let gHeapObjArray = Array<Array<Foo>>(kThreadNum, {i => Array<Foo>(kHeapObjArrayColumnSize, {j => Foo.kNullFoo})})

class GC_ConcurrentMarkTest {
    public static var coroutineRowIndex: AtomicInt64 = AtomicInt64(0)
    public static let futureList:ArrayList<Future<Int64>> = ArrayList<Future<Int64>>()

    // GC: <--, tracing order is from end to begin.
    // write new objs: -->, thus to install a new obj into a black obj
    public static func AsyncInitArrays(arrays: Array<Array<Foo>>, columnSize: Int64): Future<Int64> {
        return spawn {
            =>
            let rowIndex: Int64 = coroutineRowIndex.fetchAdd(1)
            let kSleepStep: Int64 = 5
            var j: Int64 = 0

            let oneRow = Array<Foo>(columnSize, {k => Foo.kNullFoo})
            while (j < columnSize) {
                if (j % kSleepStep == 0) {
                    sleep(Duration.nanosecond * 500) // 500ns, re-schedule, probably run on another OSThread next time
                }
                oneRow[j] = Foo(rowIndex, FieldObject(j)) // do not use arrays[i][j]
                j++
            }
            arrays[rowIndex] = oneRow
            return rowIndex
        }
    }

    public static func CheckSingleArrayObjsLiveness(array: Array<Foo>, columnSize: Int64, onFail: (Int64, Int64) -> Unit): Unit {
        var i: Int64 = 0

        while (i < columnSize) {
            if (array[i].f0.i0 != i) {
                onFail(i, i)
            }

            i++
        }
    }

    public static func CheckAllArrayObjsLiveness(arrays: Array<Array<Foo>>, columnSize: Int64,
        list: ArrayList<Future<Int64>>):Unit {
        var i: Int64 = 0
        while (i < list.size) {
            var rowIndex = 0
            try {
                let res: Int64 = list.get(i).getOrThrow().get()
                rowIndex = res
            } catch (_) {
                rowIndex = -1
            }

            if (rowIndex != -1) {
                let failList = ArrayList<(Int64, Int64)>()
                CheckSingleArrayObjsLiveness(arrays[rowIndex], columnSize,
                    {column, expectedValue => failList.add((column, expectedValue))})

                if (failList.size > 0) {
                    print("fail: row=" + rowIndex.toString() + " size=" + failList.size.toString() + "\n")
                }
            } else {
                print("fail: CheckAllArrayObjsLiveness, rowIndex=" + rowIndex.toString())
            }
            i++
        }
    }

    // concurrently new objs and install them into black
    public static func TriggerConcurrentGCTest1():Unit {
        coroutineRowIndex.store(0)

        var i: Int64 = 0
        while (i < kThreadNum) {
            futureList.add(AsyncInitArrays(gHeapObjArray, kHeapObjArrayColumnSize))
            i++
        }

        GC()
        CheckAllArrayObjsLiveness(gHeapObjArray, kHeapObjArrayColumnSize, futureList)
    }
}

// Objective: black allocator invariant test
// new objs during concurrent mark should be all alive
main(): Int64 {
    GC_ConcurrentMarkTest.TriggerConcurrentGCTest1()
    print("success")
    return 0
}
