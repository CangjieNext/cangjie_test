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
// ASSERT: scan Apply(@_CIN7default2BBIG_E3fooHv$l
// ASSERT: scan-not Invoke(@_CIN7default2BBIG_E3fooHv$l

open class AA<T> {
    public open func foo(): Int64 {
        0
    }
}

class BB<T> <: AA<T> {
    public func foo(): Int64 {
        1
    }
}

open class CA<T> {
    let a: AA<T> = BB<T>()
}

class CB <: CA<Int64> {}

func test<R>(): Int64 {
    let a = CA<R>()
    let b = a.a
    b.foo()
}

main() {
    let a = CA<Int64>()
    let b = a.a
    let r0 = b.foo()

    let cb = CB()
    let bb = cb.a
    let r1 = bb.foo()
    r0 + r1 - 2
}
