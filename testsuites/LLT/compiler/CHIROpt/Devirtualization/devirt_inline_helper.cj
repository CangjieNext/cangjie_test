// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: helper inlined under O2 + function inlining, then exact Child call devirted in main.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %enableFuncInlining %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(Class-_CN7default5ChildE&->@_CN7default5Child3fooHv
// ASSERT: scan-not Invoke(Class-_CN7default5ChildE&->@_CN7default5Child3fooHv

open class Base {
    public open func foo(): Int64 {
        1
    }
}

class Child <: Base {
    public func foo(): Int64 {
        2
    }
}

func helper(b: Base): Int64 {
    b.foo()
}

main() {
    helper(Child()) - 2
}
