// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC:%compiler %enableCompileDebug %sync-link %verbose_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
internal import std.sync.*

class A {}

main(): Int64 {
    var fut = spawn {
        var a = AtomicInt32(1)
        var b = AtomicBool(false)
        AtomicReference(A())
    }
    fut.get()
    return 0
}
