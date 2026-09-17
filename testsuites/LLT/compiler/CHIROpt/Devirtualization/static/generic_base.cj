// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: concrete A1 <: A<Int64>, A1.bar() -> Apply(A1.foo).
// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "WHOLE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(Class-_CN7default2A1E&->@_CN7default2A13fooHv
// ASSERT: scan InvokeStatic(This&->@_CN7default1AIG_E3fooHv
// ASSERT: scan-not InvokeStatic(Class-_CN7default2A1E&->@_CN7default1AIG_E3fooHv

interface A<T> {
    static func foo(): T
    static func bar(): T {
        return foo()
    }
}

open class A1 <: A<Int64> {
    public static func foo(): Int64 {
        return 1
    }
}

class A2 <: A1 {}

main() {
    A1.bar() - 1
}
