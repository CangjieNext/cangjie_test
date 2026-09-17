// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: B and C both <: A; C.bar() -> Apply(C.foo), not B.foo.
// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "WHOLE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(Class-_CN7default1CE&->@_CN7default1C3fooHv
// ASSERT: scan-not Apply(Class-_CN7default1CE&->@_CN7default1B3fooHv
// ASSERT: scan-not InvokeStatic(Class-_CN7default1CE&->@_CN7default1A3fooHv

interface A {
    static func foo(): Int64
    static func bar(): Int64 {
        return foo()
    }
}

open class B <: A {
    public static func foo(): Int64 {
        return 1
    }
}

class C <: A {
    public static func foo(): Int64 {
        return 2
    }
}

main() {
    C.bar() - 2
}
