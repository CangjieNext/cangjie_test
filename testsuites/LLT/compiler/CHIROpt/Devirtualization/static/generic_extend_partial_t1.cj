// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: extend<T2> Pair<Int64, T2>; T1 already concrete, only T2 left generic.
// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(@_CIN7defaultXRNY_4PairIlG_E3fooHv$lRNat6StringE
// ASSERT: scan-not InvokeStatic(Struct-_CN7default4PairIG_G0_E<Int64,Struct-_CNat6StringE>->@_CN7default1A3fooHv

interface A {
    static func foo(): Int64
    static func bar(): Int64 {
        return foo()
    }
}

struct Pair<T1, T2> {}

extend<T2> Pair<Int64, T2> <: A {
    public static func foo(): Int64 {
        return 1
    }
}

main() {
    Pair<Int64, String>.bar() - 1
}
