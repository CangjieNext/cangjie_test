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
    public init() {
        flag += 1
    }
    ~init() {
        mon.lock()
        flag += 1
        mon.notifyAll()
        mon.unlock()
    }
}

func test() {
    var a = A()
    list.add(a)
    list.remove(at: 0)
}

main() {
    test()
    GC()
    // use synchronization to ensure GC happen
    mon.lock()
    while (flag != 2) {
        mon.wait()
    }
    mon.unlock()
    return flag - 2
}
