// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Negative: D <: C<Int64> & I<String>; I<Int64>/I<String> parameters stay Invoke on I<T>::foo.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default14useIfaceParamsHCNY_1IIlECNY_1IIRNat6StringEE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Invoke(Class-_CN7default1IIG_E<Int64>&->@_CN7default1IIG_E3fooHv
// ASSERT: scan Invoke(Class-_CN7default1IIG_E<Struct-_CNat6StringE>&->@_CN7default1IIG_E3fooHv
// ASSERT: scan-not Apply(Class-_CN7default1DE&->@_CN7default1D3fooHv

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

func useIfaceParams(x: I<Int64>, y: I<String>): Int64 {
    let r1 = x.foo()
    let r2 = y.foo()
    r1 + r2
}

main() {
    let d = D()
    useIfaceParams(d, d) - 4
}
