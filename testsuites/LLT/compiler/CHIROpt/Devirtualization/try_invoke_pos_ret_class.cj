// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: TryInvoke returning class is rewritten; covers class-typed TryInvoke path in analysis.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default3useHv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan TryApply(Class-_CN7default5ChildE&->@_CN7default5Child3fooHv
// ASSERT: scan-not TryInvoke(

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

func use(): Int64 {
    let b: Base = Child()
    try {
        let r = b.foo()
        1
    } catch (_: Exception) {
        0
    }
}

main() {
    use() - 1
}
