// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: generic static foo<T, U>; A1.bar<Int64, Bool>() -> Apply(A1.foo<Int64, Bool>).
// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "WHOLE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(@_CIN7default2A13fooIG_G0_Hv$lb
// ASSERT: scan-not InvokeStatic(Class-_CN7default2A1E&->@_CN7default1A3fooIG_G0_Hv

interface A {
    static func foo<T, U>(): Int64
    static func bar<T, U>(): Int64 {
        return foo<T, U>()
    }
}

open class A1 <: A {
    public static func foo<T, U>(): Int64 {
        return 1
    }
}

main() {
    A1.bar<Int64, Bool>() - 1
}
