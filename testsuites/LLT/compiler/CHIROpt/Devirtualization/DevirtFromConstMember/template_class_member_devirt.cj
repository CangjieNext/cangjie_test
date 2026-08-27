// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(@_CIN7default2CBIG_E3fooHv$l
// ASSERT: scan-not Invoke(@_CIN7default2CBIG_E3fooHv$l
// ASSERT: scan Apply(@_CIN7default2CBIG_E3fooHv$l
// ASSERT: scan-not Invoke(@_CIN7default2CBIG_E3fooHv$l

interface CA<T> {
    open func foo(): Unit {}
}

class CB<T> <: CA<T> {
    public func foo(): Unit {}
}

class CC<T> <: CA<T> {
    public func foo(): Unit {}
}

class Test2 {
    public let b: CA<Int64>
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
    func hoo() {
        b.foo()
    }
}

main() {
    let t = Test2()
    t.b.foo()
    t.hoo()
}
