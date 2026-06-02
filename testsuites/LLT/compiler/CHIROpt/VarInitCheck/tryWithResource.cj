// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %disableSemaVic  %cmp_opt -Woff unused %n.cj 2>&1 | compare %f
// ASSERT: scan-not variable 'a' is used before initialization


import std.sync.*

class A <: Resource {
    public func isClosed(): Bool {
        true
    }
    public func close() {
        println("123")
    }
}

public func tryWithResource() {
    var a: Int32
    try (x = A()) {
        a = 1
    }
    println(a)
}

public func inSynchronized() {
    let mtx: MultiConditionMonitor = MultiConditionMonitor()
    var a: Int32
    synchronized(mtx) {
        a = 1
    }
    println(a)
}

main(): Int32 {
    return 0
}
