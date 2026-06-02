// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization -Woff all %f -o %n.%suffix 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %run_opt %output %run_args
// ASSERT: scan-not Devirtualization
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface Base {
    func foo() {
        println(0)
    }
}

class A <: Base {
    var a = 1
    public func foo() {
        println(1)
    }
}

class B<T> {
    static var sa: Base
    static init() {
        sa = A()
    }
}

main() {
    var x = B<Int64>()
    B<Int64>.sa.foo()
}
