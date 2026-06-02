// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization -Woff all %f -o %n.%suffix 2>&1 | compare %f
// ASSERT: scan [Devirtualization] The function call to Foo at [33,14] was optimized.
// ASSERT: scan [Devirtualization] The function call to Foo at [40,14] was optimized.
// (DEBUG_OPTION)EXEC: %run %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

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
    let r0 = a.Foo() - 1 // A :: Foo()

    // Bar is only defined in A, so it can only be A::Bar 
    a.Bar() // A :: Foo()
    let b: A = B()
    // Devirtualization required as we declare "b" as an instance of class A
    // It could be either A::Foo or B::Foo, so we need devirtualization to determine it's B::Foo
    let r1 = b.Foo() - 3 // B :: Foo()

    // Bar is only defined in A, so it can only be A::Bar 
    b.Bar() // A :: Foo()
    r0 + r1
}
