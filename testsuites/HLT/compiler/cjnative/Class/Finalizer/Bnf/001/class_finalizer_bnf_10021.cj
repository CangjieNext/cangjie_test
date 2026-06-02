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
var list: ArrayList<A> = ArrayList<A>()

class A {
    public var x: Int64 = 0
    ~init() {
        mon.lock()
        flag += 1
        mon.notifyAll()
        mon.unlock()
    }
}

func foo() {
    let objToBeCollectedByGC = A()
    list.add(objToBeCollectedByGC)
    list.remove(at: 0)
}

main() {
    var a = A() // this object should not be collected
    GC()
    sleep(Duration.millisecond * 200)
    var i = a.x
    foo() // the A instance created inside this call will be collected
    GC()
    mon.lock()
    while (flag != 1) {
        mon.wait()
    }
    mon.unlock()
    i = a.x
    return i
}
