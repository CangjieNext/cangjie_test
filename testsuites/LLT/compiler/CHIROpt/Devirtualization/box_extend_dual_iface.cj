// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: extend S <: I1 & I2; boxed as either iface -> Apply(S::foo)/Apply(S::bar).
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default3useHv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(Struct-_CN7default1SE->@_CN7defaultXRNY_1SE3fooHv
// ASSERT: scan Apply(Struct-_CN7default1SE->@_CN7defaultXRNY_1SE3barHv
// ASSERT: scan-not Invoke(Class-_CN7default2I1E&->@_CN7default2I13fooHv
// ASSERT: scan-not Invoke(Class-_CN7default2I2E&->@_CN7default2I23barHv

interface I1 {
    func foo(): Int64
}

interface I2 {
    func bar(): Int64
}

struct S {}

extend S <: I1 & I2 {
    public func foo(): Int64 {
        1
    }
    public func bar(): Int64 {
        2
    }
}

func use(): Int64 {
    var a: I1 = S()
    var b: I2 = S()
    a.foo() + b.bar()
}

main() {
    use() - 3
}
