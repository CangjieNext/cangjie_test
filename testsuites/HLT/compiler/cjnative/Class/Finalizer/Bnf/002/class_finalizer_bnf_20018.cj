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

import std.runtime.*
import std.sync.*
import std.collection.*

var x = AtomicInt64(0)
var mon = Monitor()
var list: ArrayList<A<Int64>> = ArrayList<A<Int64>>()

class A<T> {
    ~init() {
        mon.lock()
        x.store(1)
        mon.notifyAll()
        mon.unlock()
    }
}

func test() {
    var a = A<Int64>()
    list.add(a)
    list.remove(at: 0)
}

main() {
    test()
    GC()
    mon.lock()
    while (x.load() != 1) {
        mon.wait()
    }
    mon.unlock()
    return x.load() - 1
}
