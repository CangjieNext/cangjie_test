// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: extend<T2> Pair<Int64, T2>; T1 already concrete, only T2 left generic.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default3useHv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(@_CIN7defaultXRNY_4PairIlG_E3fooHv$lRNat6StringE
// ASSERT: scan-not Invoke(Class-_CN7default1IE&->@_CN7default1I3fooHv

interface I {
    func foo(): Int64
}

struct Pair<T1, T2> {}

extend<T2> Pair<Int64, T2> <: I {
    public func foo(): Int64 {
        1
    }
}

func use(): Int64 {
    var x: I = Pair<Int64, String>()
    x.foo()
}

main() {
    use() - 1
}
