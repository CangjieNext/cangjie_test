// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Negative: interface SUBTYPE_OF with default foo(), multiple impls, only B overrides -> Invoke.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default3useHCNY_1IE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Invoke(Class-_CN7default1IE&->@_CN7default1I3fooHv
// ASSERT: scan-not Apply(Class-_CN7default1IE&->@_CN7default1I3fooHv
// ASSERT: scan-not Apply(Class-_CN7default1BE&->@_CN7default1B3fooHv

interface I {
    open func foo(): Int64 {
        0
    }
}

class A <: I {}

class B <: I {
    public func foo(): Int64 {
        1
    }
}

class C <: I {}

func use(i: I): Int64 {
    i.foo()
}

main() {
    use(A()) + use(B()) + use(C()) - 1
}
