// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: D <: C<Int64> & I<String>; exact local D narrowed to I<Int64>/I<String> -> Apply(D::foo).
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default17useExactLocalBothHv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan-2 Apply(Class-_CN7default1DE&->@_CN7default1D3fooHv
// ASSERT: scan Apply(Class-_CN7default1DE&->@_CN7default1D3fooHv
// ASSERT: scan Apply(Class-_CN7default1DE&->@_CN7default1D3fooHv
// ASSERT: scan-not Invoke(Class-_CN7default1IIG_E<Int64>&->@_CN7default1IIG_E3fooHv
// ASSERT: scan-not Invoke(Class-_CN7default1IIG_E<Struct-_CNat6StringE>&->@_CN7default1IIG_E3fooHv

interface I<T> {
    func foo(): Int64
}

open class C<T> <: I<T> {
    public open func foo(): Int64 {
        1
    }
}

class D <: C<Int64> & I<String> {
    public func foo(): Int64 {
        2
    }
}

func useExactLocalBoth(): Int64 {
    let d: D = D()
    let a: I<Int64> = d
    let b: I<String> = d
    let r1 = a.foo()
    let r2 = b.foo()
    r1 + r2
}

main() {
    useExactLocalBoth() - 4
}
