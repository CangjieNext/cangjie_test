/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.sync.Monitor
import std.runtime.*
import std.collection.*

var flag = 0
var mon = Monitor()
var list0: ArrayList<A0> = ArrayList<A0>()

class A0 {
    ~init() {
        mon.lock()
        flag += 1
        test2()
        GC()
        mon.notifyAll()
        mon.unlock()
    }
}

var list1: ArrayList<A1> = ArrayList<A1>()

class A1 {
    ~init() {
        mon.lock()
        flag += 2
        mon.notifyAll()
        mon.unlock()
    }
}

func test1() {
    var a = A0()
    list0.add(a)
    list0.remove(at: 0)
}

func test2() {
    var a = A1()
    list1.add(a)
    list1.remove(at: 0)
}

main() {
    test1()
    GC()
    mon.lock()
    while (flag != 3) {
        mon.wait()
    }
    mon.unlock()
    return flag - 3
}
