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
// ASSERT: scan Invoke(Class-_CN7default1AE&->@_CN7default1A3FooHv

open class A {
    public open func Foo() {
        return 1
    }
}

open class Q <: A {
    public override func Foo() {
        return 3
    }
}

class B <: Q {}

class C <: Q {}

main() {
    var a = A();
    var s = "hello world"
    if (s.size == 11) {
        a = B()
    } else {
        a = Q()
    }
    a.Foo() - 3 // Q::Foo()
}
