// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(Class-_CN7default1AE&->@_CN7default1A3FooHv
// ASSERT: scan Apply(Class-_CN7default1BE&->@_CN7default1B3FooHv
// ASSERT: scan-not Invoke(Class-_CN7default1AE&->@_CN7default1A3FooHv

open class A {
    public open func Foo() {
        return 1
    }
    public func Bar() {
        return 2
    }
}

class B <: A {
    public override func Foo() {
        return 3
    }
}

main() {
    let a: A = A()
    // Devirtualization required as we declare "a" as an instance of class A
    // It could be either A::Foo or B::Foo, so we need devirtualization to determine it's A::Foo
    let r0 = a.Foo() // A :: Foo()

    // Bar is only defined in A, so it can only be A::Bar 
    let _ = a.Bar() // A :: Bar()
    let b: A = B()
    // Devirtualization required as we declare "b" as an instance of class A
    // It could be either A::Foo or B::Foo, so we need devirtualization to determine it's B::Foo
    let r1 = b.Foo() // B :: Foo()

    // Bar is only defined in A, so it can only be A::Bar 
    let _ = b.Bar() // A :: Bar()
    r0 + r1 - 4
}
