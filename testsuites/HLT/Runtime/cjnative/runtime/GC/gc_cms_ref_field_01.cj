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
    public Foo(var i0: Int64, var f0: FieldObject) {}
}

let kThreadNum = 10
let kHeapObjArrayColumnSize = 50000 // need fine tune

let kNullFieldObj = FieldObject(-1)
let gHeapObjArray = Array<Array<Foo>>(kThreadNum, {i => Array<Foo>(kHeapObjArrayColumnSize, {j => Foo.kNullFoo})})

class GC_ConcurrentMarkTest {
    public static var coroutineRowIndex: AtomicInt64 = AtomicInt64(0)
    public static let futureBuf:ArrayList<Future<Int64>> = ArrayList<Future<Int64>>()
    public static let kSeperateIndex:Int64 = kHeapObjArrayColumnSize / 2

    public static func InitArray(arrays: Array<Array<Foo>>, row: Int64, column: Int64, value: (Int64, Int64) -> Foo):Unit {
        var i: Int64 = 0
        var j: Int64 = 0

        while (i < row) {
            let oneRow = Array<Foo>(column, {k => Foo.kNullFoo})
            while (j < column) {
                oneRow[j] = value(i, j) // do not use arrays[i][j]
                j++
            }
            arrays[i] = oneRow
            i++
            j = 0
        }
    }

    // reverse = false: GC tracing order is from begin to end. GC: -->, write: <-- to | kSeperateIndex | from -->
    // reverse = true: GC tracing order is from end to begin. GC: <--, write: <-- from | kSeperateIndex | to -->
    public static func AsyncModifyArrayFields(arrays: Array<Array<Foo>>, column: Int64, reverse: Bool): Future<Int64> {
        let sleepStep: Int64 = 5

        return spawn {
            =>
            let rowIndex: Int64 = coroutineRowIndex.fetchAdd(1)

            var fromIndex: Int64 = kSeperateIndex
            var toIndex: Int64 = kSeperateIndex - 1
            var count: Int64 = kSeperateIndex - 1

            if (reverse) {
                fromIndex = kSeperateIndex - 1
                toIndex = kSeperateIndex
            }

            while (count >= 0) {
                if (count % sleepStep == 0) {
                    sleep(Duration.nanosecond * 500) // 500ns, re-schedule, probably run on another OSThread next time
                }

                arrays[rowIndex][toIndex].f0 = arrays[rowIndex][fromIndex].f0 // install white to black
                arrays[rowIndex][fromIndex].f0 = kNullFieldObj

                if (reverse) {
                    fromIndex--
                    toIndex++
                } else {
                    fromIndex++
                    toIndex--
                }
                count--
            }
            return rowIndex
        }
    }

    // reverse = false: check left part
    // reverse = true: check right part
    public static func CheckSingleArrayObjsLiveness(array: Array<Foo>, seperateIndex: Int64, reverse: Bool,
        onFail: (Int64, Int64) -> Unit): Unit {
        var checkIndex: Int64 = seperateIndex - 1
        var expectedValue: Int64 = seperateIndex
        var count: Int64 = seperateIndex - 1

        if (reverse) {
            checkIndex = seperateIndex
            expectedValue = seperateIndex - 1
        }

        while (count >= 0) {
            if (array[checkIndex].f0.i0 != expectedValue) {
                onFail(checkIndex, expectedValue)
            }

            if (reverse) {
                checkIndex++
                expectedValue--
            } else {
                checkIndex--
                expectedValue++
            }
            count--
        }
    }

    public static func CheckAllArrayObjsLiveness(arrays: Array<Array<Foo>>, buf: ArrayList<Future<Int64>>, reverse: Bool):Unit {
        var i: Int64 = 0
        while (i < buf.size) {
            var rowIndex = 0
            try {
                let res: Int64 = buf.get(i).getOrThrow().get()
                rowIndex = res
            } catch (_) {
                rowIndex = -1
            }

            if (rowIndex != -1) {
                let failList = ArrayList<(Int64, Int64)>()
                CheckSingleArrayObjsLiveness(arrays[rowIndex], kSeperateIndex, reverse,
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

    // concurrently modify obj graph
    public static func TriggerConcurrentGCTest1(reverse!: Bool):Unit {
        InitArray(gHeapObjArray, kThreadNum, kHeapObjArrayColumnSize, {i, j => return Foo(i, FieldObject(j))})
        coroutineRowIndex.store(0)

        var i: Int64 = 0
        while (i < kThreadNum) {
            futureBuf.add(AsyncModifyArrayFields(gHeapObjArray, kHeapObjArrayColumnSize, reverse))
            i++
        }

        GC()
        CheckAllArrayObjsLiveness(gHeapObjArray, futureBuf, reverse)
    }
}

// Objective: concurrently write heap objs' refField during GC
// Each coroutine concurrently modifys a specific row in gHeapObjArray[][]
// A half row of heap objs' refField (obj) are expected to be alive since they are reachable in cj
main(): Int64 {
    GC_ConcurrentMarkTest.TriggerConcurrentGCTest1(reverse: true) // reverse according to tracing algorithm
    print("success")
    return 0
}
