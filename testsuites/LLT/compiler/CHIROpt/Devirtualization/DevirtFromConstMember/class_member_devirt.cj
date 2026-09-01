// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "WHOLE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(Class-_CN7default2CBE&->@_CN7default2CB3fooHv
// ASSERT: scan-not Invoke(Class-_CN7default2CBE&->@_CN7default2CB3fooHv
// ASSERT: scan Apply(Class-_CN7default2CCE&->@_CN7default2CC3fooHv
// ASSERT: scan-not Invoke(Class-_CN7default2CCE&->@_CN7default2CC3fooHv

open class CA {
    public open func foo(): Int64 {
        0
    }
}

class CB <: CA {
    public func foo(): Int64 {
        1
    }
}

class CC <: CA {
    public func foo(): Int64 {
        2
    }
}

class Test {
    let b: CA = CB()
    func goo(): Int64 {
        b.foo()
    }
}

class Test2 {
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

open class TestI {
    let b: CA
    init() {
        b = CC()
    }
}

class TestII <: TestI {
    func hoo(): Int64 {
        b.foo()
    }
}

main() {
    let xx: Test2 = Test2()
    xx.b.foo() + TestII().hoo() - 3
}
