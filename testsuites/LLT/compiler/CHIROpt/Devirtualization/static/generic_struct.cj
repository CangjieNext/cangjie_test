// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: generic struct S1<T>; S1<Int64>.bar() -> Apply(S1<Int64>.foo).
// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "WHOLE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(@_CIN7default2S1IG_E3fooHv$l
// ASSERT: scan InvokeStatic(This&->@_CN7default1A3fooHv
// ASSERT: scan-not InvokeStatic(Struct-_CN7default2S1IG_E<Int64>->@_CN7default1A3fooHv

interface A {
    static func foo(): Int64
    static func bar(): Int64 {
        return foo()
    }
}

struct S1<T> <: A {
    public static func foo(): Int64 {
        return 1
    }
}

main() {
    S1<Int64>.bar() - 1
}
