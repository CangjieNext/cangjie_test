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
// ASSERT: scan Apply(Class-_CN7default3A11E&->@_CN7default1A3fooHv
// ASSERT: scan-not Invoke(Class-_CN7default1AE&->@_CN7default1A3fooHv

interface A {
    func foo(): Int64 {
        return 2
    }
}

abstract class A1 <: A {}

open class A11 <: A1 {}

open class A12 <: A1 {}

main() {
    var a: A = A11() // invoke
    a.foo() - 2
}
