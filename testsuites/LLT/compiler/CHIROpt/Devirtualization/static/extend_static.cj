// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: extend Int64 static bar inlines then InvokeStatic -> Apply(Int64.foo).
// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "WHOLE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(Int64->@_CN7defaultXl3fooHv
// ASSERT: scan-not InvokeStatic(Int64->@_CN7defaultXl3fooHv

var g: Int64 = 0

interface A {
    static func foo(): Int64
}

extend Int64 <: A {
    public static func foo(): Int64 {
        var x = g
        var i = 0
        while (i < 10) {
            x = x + i
            x = x ^ (x << 3)
            i = i + 1
        }
        g = x
        return x
    }
    public static func bar(): Int64 {
        return foo()
    }
}

main() {
    Int64.bar()
    0
}
