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

import std.sync.AtomicInt64
import std.runtime.*
import std.collection.*

var flag: AtomicInt64 = AtomicInt64(0)

class SomeType0 {
    ~init() {
        flag.fetchAdd(1)
    }
}

var list: ArrayList<SomeType6> = ArrayList<SomeType6>()

class SomeType6 {
    public var field: SomeType0 = SomeType0()
    ~init() {
        flag.fetchAdd(1)
    }
}

func test() {
    var x = SomeType6()
    list.add(x)
    list.remove(at: 0)
}

main() {
    test()
    GC()
    // use synchronization to ensure GC happen
    while (flag.load() != 2) {}
    return 0
}
