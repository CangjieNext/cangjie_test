// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// Negative: nested I1-typed calls stay Invoke on I1 default methods.
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7defaultU00000003DhOdL4TestHCNY_2I1El" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Invoke(Class-_CN7defaultU00000003DhOdL2I1E&->@_CN7defaultU00000003DhOdL2I12f1Hl
// ASSERT: scan Invoke(Class-_CN7defaultU00000003DhOdL2I1E&->@_CN7defaultU00000003DhOdL2I12f2Hl
// ASSERT: scan-not Apply(Class-_CN7defaultU00000003DhOdL2I1E&->@_CN7defaultU00000003DhOdL2I12f1Hl
// ASSERT: scan-not Apply(Class-_CN7defaultU00000003DhOdL2I1E&->@_CN7defaultU00000003DhOdL2I12f2Hl

private interface I1 {
    func f1(a: Int64): Int64 {
        return 1
    }
    func f2(b: Int64): Int64 {
        return 1
    }
}

private open class B <: I1 {
    public func f1(a: Int64): Int64 {
        return a + 3
    }

    public func f2(b: Int64): Int64 {
        return b + 4
    }
}

private func Test(a: I1, c: Int64) {
    a.f2(a.f1(c))
}

main() {
    Test(B(), 2) - 9
}
