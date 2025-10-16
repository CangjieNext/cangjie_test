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

var gObj: Test = Test()

class GC_MultiCoroutineTest {
    public static let objIndexBuf:ArrayList<Int64> = ArrayList<Int64>()

    public static func AssureLivenessAccrossGC(indexBuf: ArrayList<Int64>): Bool {
        let failIndexes = ArrayList<Int64>()
        var i: Int64 = 0
        while (i < indexBuf.size) {
            if (tmpCheck.CheckItem(indexBuf.get(i).getOrThrow()) == true) {
                failIndexes.add(indexBuf.get(i).getOrThrow())
            }
            i++
        }

        if (failIndexes.size > 0) {
            i = 0
            print("fail: obj indexes: ")
            while (i < failIndexes.size) {
                print(failIndexes.get(i).getOrThrow().toString() + " ")
                i++
            }
            print("are freed before GC!\n")
            return false
        }

        GC() // blocking GC expected
        sleep(Duration.millisecond * 200) // for finalizer, wait it done
        i = 0
        while (i < indexBuf.size) {
            if (tmpCheck.CheckItem(indexBuf.get(i).getOrThrow()) == true) {
                failIndexes.add(indexBuf.get(i).getOrThrow())
            }
            i++
        }

        if (failIndexes.size > 0) {
            i = 0
            print("fail: obj indexes: ")
            while (i < failIndexes.size) {
                print(failIndexes.get(i).getOrThrow().toString() + " ")
                i++
            }
            print("are freed after GC!\n")
            return false
        }
        return true
    }

    public static func NestCoroutineGCTest1(threadCount: Int64):Unit {
        let obj0 = Test()
        let objIndex0: Int64 = tmpCheck.RegisterIndex(obj0)

        var i: Int64 = 0
        while (i < threadCount) {
            let fut0 = spawn {
                =>
                objIndexBuf.clear()
                objIndexBuf.add(objIndex0)
                if (!AssureLivenessAccrossGC(objIndexBuf)) {
                    print("fail: NestCoroutineGCTest1\n")
                }
            }
            fut0.get()
            i++
        }
        tmpCheck.Reset()
        gObj = obj0 // prevent early release
    }

    public static func NestCoroutineGCTest2(threadCount: Int64):Unit {
        let obj0 = Test()
        let objIndex0: Int64 = tmpCheck.RegisterIndex(obj0)

        var index: Int64 = 0
        while (index < threadCount) {
            let fut0 = spawn {
                =>
                let obj1 = Test()
                let objIndex1: Int64 = tmpCheck.RegisterIndex(obj1)
                let fut1 = spawn {
                    =>
                    objIndexBuf.clear()
                    objIndexBuf.add(objIndex0)
                    objIndexBuf.add(objIndex1)
                    if (!AssureLivenessAccrossGC(objIndexBuf)) {
                        print("fail: NestCoroutineGCTest2\n")
                    }
                }
                sleep(Duration.microsecond * 200)
                gObj = obj1 // prevent early release
                fut1.get()
            }
            fut0.get()
            index++
        }
        tmpCheck.Reset()
        gObj = obj0 // prevent early release
    }

    public static func NestCoroutineGCTest3(threadCount: Int64):Unit {
        let obj0 = Test()
        let objIndex0: Int64 = tmpCheck.RegisterIndex(obj0)

        var index: Int64 = 0
        while (index < threadCount) {
            let fut0 = spawn {
                =>
                let obj1 = Test()
                let objIndex1: Int64 = tmpCheck.RegisterIndex(obj1)
                let fut1 = spawn {
                    =>
                    let obj2 = Test()
                    let objIndex2: Int64 = tmpCheck.RegisterIndex(obj2)
                    let fut2 = spawn {
                        =>
                        objIndexBuf.clear()
                        objIndexBuf.add(objIndex0)
                        objIndexBuf.add(objIndex1)
                        objIndexBuf.add(objIndex2)
                        if (!AssureLivenessAccrossGC(objIndexBuf)) {
                            print("fail: NestCoroutineGCTest3\n")
                        }
                    }
                    sleep(Duration.microsecond * 200)
                    fut2.get() // blocking current coroutine till verify done, stack map at this point should struct obj2
                    gObj = obj2 // prevent early release
                }
                sleep(Duration.microsecond * 200)
                fut1.get() // blocking current coroutine till verify done, stack map at this point should struct obj1
                gObj = obj1 // prevent early release
            }
            fut0.get() // blocking current coroutine till verify done
            index++
        }
        tmpCheck.Reset()
        gObj = obj0 // prevent early release
    }

    public static func NestCoroutineGCTest4(threadCount: Int64) {
        let obj0 = Test()
        let objIndex0: Int64 = tmpCheck.RegisterIndex(obj0)

        var index: Int64 = 0
        while (index < threadCount) {
            let fut0 = spawn {
                =>
                let obj1 = Test()
                let objIndex1: Int64 = tmpCheck.RegisterIndex(obj1)
                let fut1 = spawn {
                    =>
                    let obj2 = Test()
                    let objIndex2: Int64 = tmpCheck.RegisterIndex(obj2)
                    let fut2 = spawn {
                        =>
                        let obj3 = Test()
                        let objIndex3: Int64 = tmpCheck.RegisterIndex(obj3)
                        let fut3 = spawn {
                            =>
                            objIndexBuf.clear()
                            objIndexBuf.add(objIndex0)
                            objIndexBuf.add(objIndex1)
                            objIndexBuf.add(objIndex2)
                            objIndexBuf.add(objIndex3)
                            if (!AssureLivenessAccrossGC(objIndexBuf)) {
                                print("fail: NestCoroutineGCTest4\n")
                            }
                        }
                        sleep(Duration.microsecond * 200)
                        fut3.get() // blocking current coroutine till verify done, stack map at this point should struct obj3
                        gObj = obj3 // prevent early release
                    }
                    sleep(Duration.microsecond * 200)
                    fut2.get() // blocking current coroutine till verify done, stack map at this point should struct obj2
                    gObj = obj2 // prevent early release
                }
                sleep(Duration.microsecond * 200)
                fut1.get() // blocking current coroutine till verify done, stack map at this point should struct obj1
                gObj = obj1 // prevent early release
            }
            fut0.get() // blocking current coroutine till verify done
            index++
        }
        tmpCheck.Reset()
        gObj = obj0 // prevent early release
    }
}

// Objective: invoke GC in coroutine, check stack roots' liveness
// Stack roots' liveness should be guaranteed by stack map
main(): Int64 {
    GC_MultiCoroutineTest.NestCoroutineGCTest1(1)
    GC_MultiCoroutineTest.NestCoroutineGCTest2(1)
    GC_MultiCoroutineTest.NestCoroutineGCTest3(1)
    GC_MultiCoroutineTest.NestCoroutineGCTest4(1)
    print("success")
    let ao = ArgOpt(process.Process.current.arguments, "", ["asan"])
    let map = ao.getArgumentsMap()
    if (map.contains("--asan")) {
        GC()
        sleep(Duration.second * 2)
    }
    return 0
}
