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
// ASSERT:scan 10

import std.sync.*
import std.collection.*
import std.runtime.*

class Object1 {
    public var var1: Int32 = 4
    public var var2: Int64 = 24
}

struct Rcd {
    public var a0: Int64 = 0
    public var a1: Int32 = 2
    public var a3: Object1 = Object1()
}

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

var globalNumber: Int64 = 0
var microInterval: Int64 = 1000 * 1000
var nanoInterval: Int64 = 1000 * 1000 * 1000
let kTestCount: Int64 = 100
let kThreadCount: Int64 = 100

main(): Int64 {
    var i = 0
    var futureList = ArrayList<Future<Unit>>()
    while (i < kTestCount) {
        var j: Int64 = 0
        while (j < kThreadCount) {
            let coroutine = spawn {
                sleep(Duration.millisecond * 100)
                Allocate()
                globalNumber++
            }
            futureList.add(coroutine)
            j++
        }
        sleep(Duration.millisecond * 100)
        GC()
        i++;
    }

    for (f in futureList) {
        try {
            let res: Unit = f.get()
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }

    sleep(Duration.millisecond * 200)
    print((10).toString() + "\n")
    return 0
}
