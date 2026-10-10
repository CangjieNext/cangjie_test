// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: S1/S2 both extend <: A; S2.bar() -> Apply(S2.foo), not S1.foo.
// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(Struct-_CN7default2S2E->@_CN7defaultXRNY_2S2E3fooHv
// ASSERT: scan-not Apply(Struct-_CN7default2S2E->@_CN7defaultXRNY_2S1E3fooHv
// ASSERT: scan-not InvokeStatic(Struct-_CN7default2S2E->@_CN7default1A3fooHv

interface A {
    static func foo(): Int64
    static func bar(): Int64 {
        return foo()
    }
}

struct S1 {}
struct S2 {}

extend S1 <: A {
    public static func foo(): Int64 {
        return 1
    }
}

extend S2 <: A {
    public static func foo(): Int64 {
        return 2
    }
}

main() {
    S2.bar() - 2
}
