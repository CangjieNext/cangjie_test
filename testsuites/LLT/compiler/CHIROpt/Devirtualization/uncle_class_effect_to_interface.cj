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
// ASSERT: scan Apply(Class-_CN7default1BE&->@_CN7default1A2f1Hl
// ASSERT: scan-not Invoke(Class-_CN7default1AE&->@_CN7default1A2f1Hl

interface I<T> {
    func f1(a: T): Int64 {
        1
    }
    func f2(a: T): Int64 {
        f1(a)
    }
}

open class A {
    public open func f1(a: Int64): Int64 {
        0
    }
}

class B <: A & I<Int64> {}

main() {
    var a: I<Int64> = B()
    let r0 = a.f1(1) // should print extend A f1
    var b: A = B()
    let r1 = b.f1(1) // print extend A f1
    r0 + r1 - 0
}
