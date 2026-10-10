// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: extend<T1, T2> Pair<T1, CA<T2>>; wrapper fixes T1=Int64, call insts T2=Bool.
// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(@_CIN7defaultXRNY_4PairIG_CNY_2CAIG0_EE3fooHv$lCN7default2CAIG_Eb
// ASSERT: scan-not InvokeStatic(Struct-_CN7default4PairIG_G0_E<Int64,Class-_CN7default2CAIG_E<Bool>&>->@_CN7default1A3fooHv

interface A {
    static func foo(): Int64
    static func bar(): Int64 {
        return foo()
    }
}

class CA<T> {}

struct Pair<T1, T2> {}

extend<T1, T2> Pair<T1, CA<T2>> <: A {
    public static func foo(): Int64 {
        return 1
    }
}

func callWithT1Fixed<T2>(): Int64 {
    return Pair<Int64, CA<T2>>.bar()
}

main() {
    callWithT1Fixed<Bool>() - 1
}
