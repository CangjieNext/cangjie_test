// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: I<Int64>&I<String> dual inst; C.f3(1) must resolve correct overloads via Apply.
// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "WHOLE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(Class-_CN7default1CE&->@_CN7default2I12f1Hl
// ASSERT: scan Apply(Class-_CN7default1CE&->@_CN7default2I12f1HRNat6StringE
// ASSERT: scan Apply(Class-_CN7default1CE&->@_CN7default1C2f2Hv
// ASSERT: scan InvokeStatic(This&->@_CN7default1IIG_E2f1HG_
// ASSERT: scan-not InvokeStatic(Class-_CN7default1CE&->@_CN7default1IIG_E2f1HG_

interface I<T> {
    static func f1(a: T): Unit

    static func f3(a: T): Unit {
        f1(a)
    }
}

interface I1 <: I<Int64> & I<String> {
    static func f1(a: Int64): Unit {
        f1("1")
    }
    static func f1(a: String): Unit {
        f2()
    }

    static func f2(): Unit
}

class C <: I1 {
    static public func f2(): Unit {}
}

main() {
    C.f3(1)
}
