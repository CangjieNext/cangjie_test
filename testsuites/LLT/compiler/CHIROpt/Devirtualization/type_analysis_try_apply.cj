// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Cover TypeAnalysis::HandleTryApplyTerminator via try/catch around Apply.
// open A parameter: catch-body foo stays Invoke (no devirt).
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default4callHCNY_1AE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan TryApply(@_CN7default8mayThrowHCNY_1AE
// ASSERT: scan Invoke(Class-_CN7default1AE&->@_CN7default1A3fooHv
// ASSERT: scan-not Apply(Class-_CN7default1AE&->@_CN7default1A3fooHv

open class A {
    public open func foo(): Int64 {
        1
    }
}

func mayThrow(a: A): Int64 {
    throw Exception("e")
}

func call(a: A): Int64 {
    try {
        mayThrow(a)
    } catch (_: Exception) {
        a.foo()
    }
}

main() {
    call(A()) - 1
}
