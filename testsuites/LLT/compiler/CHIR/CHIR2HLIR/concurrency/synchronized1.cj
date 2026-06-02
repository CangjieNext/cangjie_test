// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC:%compiler %enableCompileDebug %sync-link %verbose_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
internal import std.sync.*
internal import std.collection.*

class A {}

var x = ArrayList<?A>()
let m = ReentrantMutex()

main(): Int64 {
    while (true) {
        synchronized(m) {
            break
        }
    }
    var i: Int64 = 10
    while (i > 0) {
        synchronized(m) {
            i--
            continue
        }
    }
    synchronized(m) {
        x.add(None<A>)
    }
    return 0
}
