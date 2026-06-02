// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %n.cj -o %output
// (not CJNATIVE) RUN-EXEC-PIPE-0: JETVMPROP=-Xmx12M %run %output 2>&1 | compare %f
// (CJNATIVE) RUN-EXEC-PIPE-0: %run %output 2>&1 | compare %f
// ASSERT: scan 1

import std.runtime.*
import std.sync.AtomicBool

var spin: AtomicBool = AtomicBool(true)

class C {
    var arr1 = Array<Int32>(1024 * 1024, repeat: 0)

    @When[!debug] // finalizer
    ~init() {
        println("1")
        // let it go
        spin.store(false)
    }
}

main() {
    C()
    GC() // According to SPEC, GC() only suggests runtime to trigger GC, but it's not promised to happen
    C()
    while (spin.load()) {}
}
