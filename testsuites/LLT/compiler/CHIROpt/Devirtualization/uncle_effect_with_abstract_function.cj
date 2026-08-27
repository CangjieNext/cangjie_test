// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(Class-_CN7default1BE&->@_CN7default1B2f1Hl
// ASSERT: scan-not Invoke(Class-_CN7default1BE&->@_CN7default1B2f1Hl

interface I<T> {
    func f1(a: T): Int64
}

open class A {
    public open func f1(a: Int64): Int64 {
        1
    }
}

class B <: A & I<Int64> {
    public func f1(a: Int64): Int64 {
        0
    }
}

main() {
    var a: I<Int64> = B()
    a.f1(1)
    var b: A = B()
    b.f1(1)
}
