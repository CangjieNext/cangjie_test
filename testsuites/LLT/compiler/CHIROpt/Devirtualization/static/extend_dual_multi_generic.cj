// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: Pair<T1,T2>/Other both <: A & B; resolve Pair.foo and Other.baz separately.
// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(@_CIN7defaultXRNY_4PairIG_G0_E3fooHv$lRNat6StringE
// ASSERT: scan Apply(Struct-_CN7default5OtherE->@_CN7defaultXRNY_5OtherE3bazHv
// ASSERT: scan-not Apply(Struct-_CN7default5OtherE->@_CN7defaultXRNY_5OtherE3fooHv
// ASSERT: scan-not InvokeStatic(Struct-_CN7default4PairIG_G0_E<Int64,Struct-_CNat6StringE>->@_CN7default1A3fooHv
// ASSERT: scan-not InvokeStatic(Struct-_CN7default5OtherE->@_CN7default1B3bazHv

interface A {
    static func foo(): Int64
    static func bar(): Int64 {
        return foo()
    }
}

interface B {
    static func baz(): Int64
    static func qux(): Int64 {
        return baz()
    }
}

struct Pair<T1, T2> {}
struct Other {}

extend<T1, T2> Pair<T1, T2> <: A & B {
    public static func foo(): Int64 {
        return 1
    }
    public static func baz(): Int64 {
        return 3
    }
}

extend Other <: A & B {
    public static func foo(): Int64 {
        return 2
    }
    public static func baz(): Int64 {
        return 4
    }
}

main() {
    Pair<Int64, String>.bar() + Other.qux() - 5
}
