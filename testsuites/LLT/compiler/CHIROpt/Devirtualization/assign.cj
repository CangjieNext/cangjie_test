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
// ASSERT: scan Apply(Class-_CN7default1CE&->@_CN7default1C3FooHv
// ASSERT: scan-not Invoke(Class-_CN7default1CE&->@_CN7default1C3FooHv

interface I1 {}

interface I2 <: I1 {}

open class A {
    protected open func Foo() {
        return 1
    }
}

open class B <: A {
    // open function, can be overridden again
    protected open override func Foo() {
        return 10
    }
}

open class C <: B {
    protected open override func Foo() {
        return 20
    }
}

main() {
    var a = B();
    a = C()
    return a.Foo() - 20;
}
