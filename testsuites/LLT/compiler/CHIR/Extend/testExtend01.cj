// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %output
// ASSERT: regex The function call to f in .* was an apply call
// ASSERT: regex The function call to g in .* was an apply call
// ASSERT: regex The function call to k in .* was an apply call
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

open class Foo {
    public func g() {
        return 1
    }
}

extend Foo {
    public func f() {
        return 2
    }
}

class B <: Foo {
    public func k() {
        return 3
    }
}

main() {
    let a = Foo()
    a.f() // apply
    a.g() // apply
    var b = B()
    b.k() - 3 // apply
}