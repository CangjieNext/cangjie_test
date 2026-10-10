// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Negative: I1-typed parameter stays Invoke through multi-level interface/class override.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7defaultU00000004rRyZB4TestHCNY_2I1E" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Invoke(Class-_CN7defaultU00000004rRyZB2I1E&->@_CN7defaultU00000004rRyZB2I12f1Hl
// ASSERT: scan-not Apply(Class-_CN7defaultU00000004rRyZB2I1E&->@_CN7defaultU00000004rRyZB2I12f1Hl

private interface I1 {
    func f1(a: Int64): Int64 {
        1
    }
}

private interface I2 <: I1 {
    override func f1(a: Int64): Int64 {
        2
    }
}

private open class A {
    public open func f1(a: Int64): Int64 {
        3
    }
}

private class B <: A & I2 {
    public override func f1(a: Int64): Int64 {
        0
    }
}

private func Test(i1: I1): Int64 {
    i1.f1(1)
}

main() {
    Test(B()) - 0
}
