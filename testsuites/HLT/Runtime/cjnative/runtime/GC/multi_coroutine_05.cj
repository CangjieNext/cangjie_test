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

import std.collection.*
import std.runtime.*

var globalNumber: Int64 = 0

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
    let objBuf = ArrayList<Object1>(arrSize)
    let rcdBuf = ArrayList<Rcd>(arrSize)
    var count: Int64 = 0
    while (count < arrSize) {
        objBuf.add(Object1())
        rcdBuf.add(Rcd())
        count++
    }
}

main(): Int64 {
    var threadCount: Int64 = 100
    var i: Int64 = 0
    var array = ArrayList<Future<Unit>>()
    while (i < threadCount) {
        let coroutine = spawn {
            Allocate()
            globalNumber++
        }
        array.add(coroutine)
        i++
    }
    GC()
    for (f in array) {
        f.get()
    }
    if (globalNumber > 0 && globalNumber <= threadCount) {
        print((10).toString() + "\n")
    } else {
        print(globalNumber.toString() + "\n")
        print(threadCount.toString() + "\n")
    }
    return 0
}
