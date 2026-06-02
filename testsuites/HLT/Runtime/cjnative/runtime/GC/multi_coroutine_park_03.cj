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

import std.collection.*

class Object1 {
    public var var1: Int32 = 4
    public var var2: Int64 = 4
    public var var3: Int64 = 4
    public var var4: Int64 = 4
    public var var5: Int64 = 4
}

struct Rcd {
    public var a0: Int64 = 0
    public var a1: Int32 = 2
    public var a3: Object1 = Object1()
}

var globalNumber: Int64 = 0
var microInterval: Int64 = 1000 * 1000
var nanoInterval: Int64 = 1000 * 1000 * 1000
let futureList = ArrayList<Future<Unit>>()

func Allocate(): Unit {
    var arrSize: Int64 = 100
    let objList = ArrayList<Object1>(arrSize)
    let rcdList = ArrayList<Rcd>(arrSize)
    var count: Int64 = 0
    while (count < arrSize) {
        objList.add(Object1())
        rcdList.add(Rcd())
        count++
    }
}

func InvokeOOM(): Unit {
    let kMaxObjCount: Int64 = 1000 * 1000;
    let objList = ArrayList<Object1>(kMaxObjCount + 10) // avoid reallocate in Buffer
    var count: Int64 = 0
    while (count < kMaxObjCount) {
        objList.add(Object1())
        count++
    }
}

func WaitAllCoroutinesExit(list: ArrayList<Future<Unit>>): Unit {
    var i: Int64 = 0
    while (i < list.size) {
        list.get(i).getOrThrow().get()
        i++
    }
}

main(): Int64 {
    var threadCount: Int64 = 100
    var i: Int64 = 0
    while (i < threadCount) {
        futureList.add(
            spawn {
                =>
                var allocIndex: Int64 = 0
                while (allocIndex < 100) {
                    sleep(Duration.millisecond * 100)
                    Allocate()
                    allocIndex++
                }
                globalNumber++
            })
        i++
    }
    InvokeOOM()
    WaitAllCoroutinesExit(futureList)
    print("success\n")
    return 0
}
