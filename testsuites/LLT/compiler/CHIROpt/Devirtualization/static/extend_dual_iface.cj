// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: extend S <: A & B; S.bar()/S.qux() -> Apply(S.foo)/Apply(S.baz).
// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(Struct-_CN7default1SE->@_CN7defaultXRNY_1SE3fooHv
// ASSERT: scan Apply(Struct-_CN7default1SE->@_CN7defaultXRNY_1SE3bazHv
// ASSERT: scan-not InvokeStatic(Struct-_CN7default1SE->@_CN7default1A3fooHv
// ASSERT: scan-not InvokeStatic(Struct-_CN7default1SE->@_CN7default1B3bazHv

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

struct S {}

extend S <: A & B {
    public static func foo(): Int64 {
        return 1
    }
    public static func baz(): Int64 {
        return 2
    }
}

main() {
    S.bar() + S.qux() - 3
}
