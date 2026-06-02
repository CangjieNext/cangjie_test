// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %n.cj %enableCompileDebug -o %output
// RUN-EXEC-PIPE-0: %run %output 2>&1 | compare %f
// ASSERT: scan-not 1

import std.runtime.*

class C {
    @When[!debug] // finalizer
    ~init() {
        println("1")
    }
}

main() {
    C()
    GC()
}
