// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: Pair/Other both <: I1 & I2; box Pair as I1 and Other as I2 -> correct Apply.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default3useHv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(@_CIN7defaultXRNY_4PairIG_G0_E3fooHv$lRNat6StringE
// ASSERT: scan Apply(Struct-_CN7default5OtherE->@_CN7defaultXRNY_5OtherE3barHv
// ASSERT: scan-not Apply(Struct-_CN7default5OtherE->@_CN7defaultXRNY_5OtherE3fooHv
// ASSERT: scan-not Invoke(Class-_CN7default2I1E&->@_CN7default2I13fooHv
// ASSERT: scan-not Invoke(Class-_CN7default2I2E&->@_CN7default2I23barHv

interface I1 {
    func foo(): Int64
}

interface I2 {
    func bar(): Int64
}

struct Pair<T1, T2> {}
struct Other {}

extend<T1, T2> Pair<T1, T2> <: I1 & I2 {
    public func foo(): Int64 {
        1
    }
    public func bar(): Int64 {
        3
    }
}

extend Other <: I1 & I2 {
    public func foo(): Int64 {
        2
    }
    public func bar(): Int64 {
        4
    }
}

func use(): Int64 {
    var a: I1 = Pair<Int64, String>()
    var b: I2 = Other()
    a.foo() + b.bar()
}

main() {
    use() - 5
}
