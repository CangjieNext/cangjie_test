// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Negative: TryInvokeStatic + GetRTTI must not become TryApply.
// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "WHOLE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan GetRTTI(
// ASSERT: scan TryInvokeStatic(This&->@_CN7default1A3fooHv
// ASSERT: scan-not TryApply(Class-_CN7default2A1E&->@_CN7default2A13fooHv
// ASSERT: scan-not TryApply(Class-_CN7default2A2E&->@_CN7default2A23fooHv

interface A {
    static func foo(): Int64
    public func goo(): Int64 {
        try {
            return foo()
        } catch (_: Exception) {
            return 0
        }
    }
}

open class A1 <: A {
    public static func foo(): Int64 {
        return 1
    }
}

class A2 <: A1 {
    public static func foo(): Int64 {
        return 2
    }
}

main() {
    let a: A1 = A2()
    a.goo() - 2
}
