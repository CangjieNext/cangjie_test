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

var flag = 0
var mon = Monitor()

class A<T> {
    public var x: T
    public init(u: T) {
        x = u
    }
    ~init() {
        mon.lock()
        var a: T = x
        flag += 1
        mon.notifyAll()
        mon.unlock()
    }
}

func test() {
    var a = A<Unit>(())
}

main() {
    test()
    GC()
    mon.lock()
    while (flag != 1) {
        mon.wait()
    }
    mon.unlock()
    return flag - 1
}
