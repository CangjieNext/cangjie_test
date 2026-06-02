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

class HeapObject {
    public static let kNullHeapObj:HeapObject = HeapObject(-1)
    public HeapObject(var i0: Int64) {}
}

class GC_MultiCoroutineTest {
    public static let futureList:ArrayList<Future<Unit>> = ArrayList<Future<Unit>>()
    public static var finishedCoroutineCount: AtomicInt64 = AtomicInt64(0) // global root
    public static let kNestCoroutineDepth: Int64 = 8

    public static func WaitAllCoroutinesJobDone(coroutineCount: Int64):Unit {
        var i: Int64 = 0
        while (i < futureList.size) {
            try {
                let op1: Unit = futureList.get(i).getOrThrow().get()
            } catch (e: Exception) {
                e.printStackTrace()
            }
            i++
        }
    }

    public static func CheckResult(coroutineCount: Int64, objArray: Array<HeapObject>): Bool {
        var result: Int64 = finishedCoroutineCount.load()
        if (result != coroutineCount) {
            print("CheckResult fail, finishedCoroutineCount=" + result.toString() + "\n")
            return false
        }

        var i: Int64 = 0
        while (i < objArray.size) {
            if (objArray[i].i0 != i) {
                print("CheckResult fail, objArray[" + i.toString() + "] = " + objArray[i].i0.toString() + "\n")
                return false
            }
            i++
        }
        return true
    }

    public static func SpawnAlloc4(threadCount: Int64, objArray: Array<HeapObject>):Int64 {
        var i: Int64 = 0

        while (i < threadCount) {
            futureList.add(
                spawn {
                    var f1: Future<Unit> = spawn {
                        var f2: Future<Unit> = spawn {
                            var f3: Future<Unit> = spawn {
                                var f4: Future<Unit> = spawn {
                                    var f5: Future<Unit> = spawn {
                                        var f6: Future<Unit> = spawn {
                                            var f7: Future<Unit> = spawn {
                                                var index: Int64 = finishedCoroutineCount.fetchAdd(1)
                                                objArray[index] = HeapObject(index)
                                            }
                                            var index: Int64 = finishedCoroutineCount.fetchAdd(1)
                                            objArray[index] = HeapObject(index)
                                            try {
                                                let op7: Unit = f7.get()
                                            } catch (e: Exception) {
                                                e.printStackTrace()
                                            }
                                        }
                                        var index: Int64 = finishedCoroutineCount.fetchAdd(1)
                                        objArray[index] = HeapObject(index)
                                        try {
                                            let op6: Unit = f6.get()
                                        } catch (e: Exception) {
                                            e.printStackTrace()
                                        }
                                    }
                                    var index: Int64 = finishedCoroutineCount.fetchAdd(1)
                                    objArray[index] = HeapObject(index)
                                    try {
                                        let op5: Unit = f5.get()
                                    } catch (e: Exception) {
                                        e.printStackTrace()
                                    }
                                }
                                var index: Int64 = finishedCoroutineCount.fetchAdd(1)
                                objArray[index] = HeapObject(index)
                                try {
                                    let op4: Unit = f4.get()
                                } catch (e: Exception) {
                                    e.printStackTrace()
                                }
                            }
                            var index: Int64 = finishedCoroutineCount.fetchAdd(1)
                            objArray[index] = HeapObject(index)
                            try {
                                let op3: Unit = f3.get()
                            } catch (e: Exception) {
                                e.printStackTrace()
                            }
                        }
                        var index: Int64 = finishedCoroutineCount.fetchAdd(1)
                        objArray[index] = HeapObject(index)
                        try {
                            let op2: Unit = f2.get()
                        } catch (e: Exception) {
                            e.printStackTrace()
                        }
                    }
                    var index: Int64 = finishedCoroutineCount.fetchAdd(1)
                    objArray[index] = HeapObject(index)
                    try {
                        let op1: Unit = f1.get()
                    } catch (e: Exception) {
                        e.printStackTrace()
                    }
                })
            i++
        }
        return threadCount * kNestCoroutineDepth
    }

    public static func NestCoroutineGCTest(threadCount: Int64, spawnAlloc: (Int64, Array<HeapObject>) -> Int64): Bool {
        futureList.clear()
        finishedCoroutineCount.store(0)
        let objectArray: Array<HeapObject> = Array<HeapObject>(threadCount * kNestCoroutineDepth,
            {i => HeapObject.kNullHeapObj})

        let spawnCount = spawnAlloc(threadCount, objectArray)
        GC() // blocking GC expected
        WaitAllCoroutinesJobDone(spawnCount)
        return CheckResult(spawnCount, objectArray)
    }
}

// Objective: concurrently fetchAdd atomic during GC, check result
main(): Int64 {
    if (GC_MultiCoroutineTest.NestCoroutineGCTest(500, GC_MultiCoroutineTest.SpawnAlloc4)) {
        print("success")
    }
    return 0
}
