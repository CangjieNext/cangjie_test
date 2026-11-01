// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: extend<T1, T2> Pair<T1, T2>; T2 instantiated as CA<Bool>.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default3useHv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(@_CIN7defaultXRNY_4PairIG_G0_E3fooHv$lCN7default2CAIG_Eb
// ASSERT: scan-not Invoke(Class-_CN7default1IE&->@_CN7default1I3fooHv

interface I {
    func foo(): Int64
}

class CA<T> {}

struct Pair<T1, T2> {}

extend<T1, T2> Pair<T1, T2> <: I {
    public func foo(): Int64 {
        2
    }
}

func use(): Int64 {
    var x: I = Pair<Int64, CA<Bool>>()
    x.foo()
}

main() {
    use() - 2
}
