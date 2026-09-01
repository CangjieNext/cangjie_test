// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Negative: I2/I3-typed parameters stay Invoke even for single impl class A1.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7defaultU00000004c4CMQ7TestAllHCNY_2I2ECNY_2I3E" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Invoke(Class-_CN7defaultU00000004c4CMQ2I2E&->@_CN7defaultU00000004c4CMQ2I12f1Hl
// ASSERT: scan Invoke(Class-_CN7defaultU00000004c4CMQ2I3E&->@_CN7defaultU00000004c4CMQ2I12f1Hl
// ASSERT: scan-not Apply(Class-_CN7defaultU00000004c4CMQ2I2E&->@_CN7defaultU00000004c4CMQ2I12f1Hl
// ASSERT: scan-not Apply(Class-_CN7defaultU00000004c4CMQ2I3E&->@_CN7defaultU00000004c4CMQ2I12f1Hl

private interface I1 {
    func f1(a: Int64): Int64 {
        1
    }
}

private interface I2 <: I1 {
    func f1(a: Int64): Int64 {
        2
    }
}

private interface I3 <: I2 {
    func f1(a: Int64): Int64 {
        3
    }
}

private open class A {}

private open class A1 <: A & I2 & I3 {
    public func f1(a: Int64): Int64 {
        0
    }
}

private func TestAll(i2: I2, i3: I3): Int64 {
    i2.f1(1) + i3.f1(1)
}

main() {
    // Expected 0: A1.f1 returns 0 through both I2 and I3 views.
    TestAll(A1(), A1()) - 0
}
