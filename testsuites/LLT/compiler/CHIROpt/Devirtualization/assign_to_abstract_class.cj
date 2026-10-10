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
// ASSERT: scan Apply(Class-_CN7default2A1E&->@_CN7default2A13fooHv
// ASSERT: scan-not Invoke(Class-_CN7default2A1E&->@_CN7default2A13fooHv
// ASSERT: scan Apply(Class-_CN7default2A1E&->@_CN7default2A13fooHv
// ASSERT: scan-not Invoke(Class-_CN7default2A1E&->@_CN7default2A13fooHv

abstract open class A {
    protected open func foo(): Int64 {
        return 2
    }
}

open class A1 <: A {
    public func foo(): Int64 {
        return 1
    }
}

open class A11 <: A1 {}

open class A12 <: A1 {}

main() {
    var a11: A = A11()
    var a: A = A1()
    if (a11.foo() == 1 // invoke
        && a.foo() == 1) { // invoke
        return 0
    }

    return 1
}
