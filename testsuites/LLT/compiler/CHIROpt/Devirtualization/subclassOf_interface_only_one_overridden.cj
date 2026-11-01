// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Negative: I1-typed parameter stays Invoke when only subclass B overrides i1.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7defaultU00000003LcO9s4TestHCNY_2I1E" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Invoke(Class-_CN7defaultU00000003LcO9s2I1E&->@_CN7defaultU00000003LcO9s2I12i1Hl
// ASSERT: scan-not Apply(Class-_CN7defaultU00000003LcO9s2I1E&->@_CN7defaultU00000003LcO9s2I12i1Hl

private interface I1 {
    func i1(a: Int64): Int64 {
        1
    }
}

private open class B <: I1 {
    public override func i1(a: Int64): Int64 {
        0
    }
}

private func Test(a: I1): Int64 {
    a.i1(1)
}

main() {
    Test(B()) - 0
}
