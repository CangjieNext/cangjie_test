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

struct RecordField0 {
    public static let kNullRecordField0:RecordField0 = RecordField0(FieldObject.kNullFieldObj)
    public RecordField0(var f0: FieldObject) {}
}

struct RecordField1 {
    public static let kNullRecordField1:RecordField1 = RecordField1(-1, FieldObject.kNullFieldObj)
    public RecordField1(var i1: Int64, var f1: FieldObject) {}
}

struct RecordField2 {
    public static let kNullRecordField2:RecordField2 = RecordField2(-1, FieldObject.kNullFieldObj, -1, FieldObject.kNullFieldObj)
    public RecordField2(var i1: Int64, var f1: FieldObject, var i2: Int64, var f2: FieldObject) {}
}

class Foo {
    public static let kNullFoo:Foo = Foo(-1, RecordField0.kNullRecordField0, RecordField1.kNullRecordField1,
        RecordField2.kNullRecordField2)
    public Foo(var i: Int64, var r0: RecordField0, var r1: RecordField1, var r2: RecordField2) {}
}

let kThreadNum = 10
let kHeapObjArrayColumnSize = 50000 // need fine tune
let gHeapObjArray = Array<Array<Foo>>(kThreadNum, {i => Array<Foo>(kHeapObjArrayColumnSize, {j => Foo.kNullFoo})})

class GC_ConcurrentMarkSweepTest {
    public static var coroutineRowIndex: AtomicInt64 = AtomicInt64(0)
    public static let futureList:ArrayList<Future<Int64>> = ArrayList<Future<Int64>>()
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

                arrays[rowIndex][toIndex].r0 = arrays[rowIndex][fromIndex].r0 // install white to black
                arrays[rowIndex][fromIndex].r0 = RecordField0.kNullRecordField0
                arrays[rowIndex][toIndex].r1 = arrays[rowIndex][fromIndex].r1 // install white to black
                arrays[rowIndex][fromIndex].r1 = RecordField1.kNullRecordField1
                arrays[rowIndex][toIndex].r2 = arrays[rowIndex][fromIndex].r2 // install white to black
                arrays[rowIndex][fromIndex].r2 = RecordField2.kNullRecordField2

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
            if (array[checkIndex].r0.f0.i0 != expectedValue || array[checkIndex].r1.f1.i0 != expectedValue ||
                array[checkIndex].r2.f1.i0 != expectedValue || array[checkIndex].r2.f2.i0 != expectedValue) {
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

    public static func CheckAllArrayObjsLiveness(arrays: Array<Array<Foo>>, list: ArrayList<Future<Int64>>,
        reverse: Bool):Unit {
        var i: Int64 = 0
        while (i < list.size) {
            var rowIndex = 0
            try {
                let op1: Int64 = list.get(i).getOrThrow().get()
            } catch (e: Exception) {
                e.printStackTrace()
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
        let createFooFunc: (Int64, Int64) -> Foo = {
            i, j => return Foo(i, RecordField0(FieldObject(j)), RecordField1(i, FieldObject(j)),
                RecordField2(i, FieldObject(j), i, FieldObject(j)))
        }

        InitArray(gHeapObjArray, kThreadNum, kHeapObjArrayColumnSize, createFooFunc)
        coroutineRowIndex.store(0)

        var i: Int64 = 0
        while (i < kThreadNum) {
            futureList.add(AsyncModifyArrayFields(gHeapObjArray, kHeapObjArrayColumnSize, reverse))
            i++
        }

        GC()
        CheckAllArrayObjsLiveness(gHeapObjArray, futureList, reverse)
    }
}

// Objective: concurrently write heap objs' aggField during GC
// Each coroutine concurrently modifys a specific row in gHeapObjArray[][]
// A half row of heap objs' aggField (obj) are expected to be alive since they are reachable in cj
main(): Int64 {
    GC_ConcurrentMarkSweepTest.TriggerConcurrentGCTest1(reverse: true) // reverse according to tracing algorithm
    print("success")
    return 0
}
