// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: generic static foo<T>/bar<T>; A1.bar<Int64>() -> Apply(A1.foo<Int64>).
// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "WHOLE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(@_CIN7default2A13fooIG_Hv$l
// ASSERT: scan InvokeStatic(This&->@_CN7default1A3fooIG_Hv
// ASSERT: scan-not InvokeStatic(Class-_CN7default2A1E&->@_CN7default1A3fooIG_Hv

interface A {
    static func foo<T>(): Int64
    static func bar<T>(): Int64 {
        return foo<T>()
    }
}

open class A1 <: A {
    public static func foo<T>(): Int64 {
        return 1
    }
}

main() {
    A1.bar<Int64>() - 1
}
