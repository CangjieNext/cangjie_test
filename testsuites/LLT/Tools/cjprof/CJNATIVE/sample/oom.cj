// Copyright (c) Huawei Technologies Co., Ltd. 2025-2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

import std.collection.*
import std.sync.*
import std.time.*
import std.runtime.*

var num = AtomicInt64(0)

class A {
    let x1 = 1.0
    let x2 = 1.0
    let x3 = 1.0
    let x4 = 1.0
    let x5 = 1.0
}

main(): Int64 {
    sleep(1000 * Duration.millisecond)
    var list = ArrayList<A>()
    try {
        while (true) {
            list.append(A())
        }
    } catch (_:OutOfMemoryError) {
        return 0
    }
    return 1
}
