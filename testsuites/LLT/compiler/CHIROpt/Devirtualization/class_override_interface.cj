// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Negative: interface-typed parameter stays Invoke even when actual object is B.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7defaultU00000002LHoYr4TestHCNY_1IIlE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Invoke(Class-_CN7defaultU00000002LHoYr1IIG_E<Int64>&->@_CN7defaultU00000002LHoYr1IIG_E2f1HG_
// ASSERT: scan-not Apply(Class-_CN7defaultU00000002LHoYr1IIG_E<Int64>&->@_CN7defaultU00000002LHoYr1IIG_E2f1HG_

private interface I<T> {
    func f1(a: T): Int64 {
        1
    }
}

private open class A {
    public open func f1(a: Int64): Int64 {
        2
    }
}

private class B <: A & I<Int64> {
    public override func f1(a: Int64): Int64 {
        0
    }
}

private func Test(i: I<Int64>): Int64 {
    i.f1(1)
}

main() {
    Test(B()) - 0
}
