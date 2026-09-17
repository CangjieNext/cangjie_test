// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Negative: InvokeStatic(This) / GetRTTIStatic(This) must not be rewritten
// (includes abstract interface static slot reached via This).
// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default1A3barHv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan GetRTTIStatic(This)
// ASSERT: scan InvokeStatic(This&->@_CN7default1A3fooHv
// ASSERT: scan-not Apply(

interface A {
    static func foo(): Int64
    static func bar(): Int64 {
        return foo()
    }
}

open class A1 <: A {
    public static func foo(): Int64 {
        return 1
    }
}

main() {
    A1.bar() - 1
}
