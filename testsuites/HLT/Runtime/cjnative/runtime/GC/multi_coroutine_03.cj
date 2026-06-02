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

class GC_MultiCoroutineTest {
    public static let futureList:ArrayList<Future<Unit>> = ArrayList<Future<Unit>>()

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

    public static func SpawnAlloc1(threadCount: Int64):Int64 {
        var i: Int64 = 0
        while (i < threadCount) {
            futureList.add(spawn {
                tmpCheck.RegisterIndex(Test())
            })
            i++
        }
        return threadCount
    }

    public static func SpawnAlloc2(threadCount: Int64):Int64 {
        var i: Int64 = 0
        while (i < threadCount) {
            futureList.add(
                spawn {
                    var f1: Future<Unit> = spawn {
                        tmpCheck.RegisterIndex(Test())
                    }
                    tmpCheck.RegisterIndex(Test())
                    try {
                        let op1: Unit = f1.get()
                    } catch (e: Exception) {
                        e.printStackTrace()
                    }
                })
            i++
        }
        return threadCount * 2
    }

    public static func SpawnAlloc3(threadCount: Int64):Int64 {
        var i: Int64 = 0
        while (i < threadCount) {
            futureList.add(
                spawn {
                    var f1: Future<Unit> = spawn {
                        var f2: Future<Unit> = spawn {
                            tmpCheck.RegisterIndex(Test())
                        }
                        tmpCheck.RegisterIndex(Test())
                        try {
                            let op2: Unit = f2.get()
                        } catch (e: Exception) {
                            e.printStackTrace()
                        }
                    }
                    tmpCheck.RegisterIndex(Test())
                    try {
                        let op1: Unit = f1.get()
                    } catch (e: Exception) {
                        e.printStackTrace()
                    }
                })
            i++
        }
        return threadCount * 3
    }

    public static func SpawnAlloc4(threadCount: Int64):Int64 {
        var i: Int64 = 0
        while (i < threadCount) {
            futureList.add(
                spawn {
                    var f1: Future<Unit> = spawn {
                        var f2: Future<Unit> = spawn {
                            var f3: Future<Unit> = spawn {
                                tmpCheck.RegisterIndex(Test())
                            }
                            tmpCheck.RegisterIndex(Test())
                            try {
                                let op3: Unit = f3.get()
                            } catch (e: Exception) {
                                e.printStackTrace()
                            }
                        }
                        tmpCheck.RegisterIndex(Test())
                        try {
                            let op2: Unit = f2.get()
                        } catch (e: Exception) {
                            e.printStackTrace()
                        }
                    }
                    tmpCheck.RegisterIndex(Test())
                    try {
                        let op1: Unit = f1.get()
                    } catch (e: Exception) {
                        e.printStackTrace()
                    }
                })
            i++
        }
        return threadCount * 4
    }

    public static func NestCoroutineGCTest(threadCount: Int64, spawnAlloc: (Int64) -> Int64):Unit {
        futureList.clear()
        let spawnCount = spawnAlloc(threadCount)
        WaitAllCoroutinesJobDone(spawnCount)
        GC() // blocking GC expected
        sleep(Duration.millisecond * 200) // for finalizer, wait it done
        if (tmpCheck.Check() != true) {
            print("fail: NestCoroutineGCTest, objs are not freed by GC, spawnCount=" + spawnCount.toString() + "\n")
        }
        tmpCheck.Reset()
    }
}

// Objective: allocate objs in nested coroutines, let GC free them
main(): Int64 {
    GC_MultiCoroutineTest.NestCoroutineGCTest(100, GC_MultiCoroutineTest.SpawnAlloc1)
    GC_MultiCoroutineTest.NestCoroutineGCTest(100, GC_MultiCoroutineTest.SpawnAlloc2)
    GC_MultiCoroutineTest.NestCoroutineGCTest(100, GC_MultiCoroutineTest.SpawnAlloc3)
    GC_MultiCoroutineTest.NestCoroutineGCTest(100, GC_MultiCoroutineTest.SpawnAlloc4)
    print("success")
    let ao = ArgOpt(process.Process.current.arguments, "", ["asan"])
    let map = ao.getArgumentsMap()
    if (map.contains("--asan")) {
        GC()
        sleep(Duration.second * 2)
    }
    return 0
}
