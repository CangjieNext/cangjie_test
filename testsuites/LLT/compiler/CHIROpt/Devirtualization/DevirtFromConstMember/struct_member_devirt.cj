// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(Struct-_CN7default2CBE->@_CN7default2CB3fooHv
// ASSERT: scan-not Invoke(Struct-_CN7default2CBE->@_CN7default2CB3fooHv
// ASSERT: scan Apply(Struct-_CN7default2CBE->@_CN7default2CB3fooHv
// ASSERT: scan-not Invoke(Struct-_CN7default2CBE->@_CN7default2CB3fooHv

interface CA {
    open func foo(): Int64 {
        0
    }
}

struct CB <: CA {
    public func foo(): Int64 {
        1
    }
}

class CC <: CA {
    public func foo(): Int64 {
        2
    }
}

struct Test2 {
    public let b: CA
    init() {
        b = CB()
    }
    init(i: Int64) {
        if (i > 3) {
            b = CB()
        } else {
            b = CB()
        }
    }
    func hoo(): Int64 {
        b.foo()
    }
}

main() {
    let t = Test2()
    t.b.foo() - 1
}
