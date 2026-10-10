// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Negative: class-returning TryInvoke on open param stays virtual; covers HandleTryInvoke class branch.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default3useHCNY_4BaseE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan TryInvoke(Class-_CN7default4BaseE&->@_CN7default4Base3fooHv
// ASSERT: scan-not TryApply(

open class Base {
    public open func foo(): Base {
        this
    }
}

class Child <: Base {
    public func foo(): Base {
        this
    }
}

func use(b: Base): Int64 {
    try {
        let r = b.foo()
        1
    } catch (_: Exception) {
        0
    }
}

main() {
    use(Child()) - 1
}
