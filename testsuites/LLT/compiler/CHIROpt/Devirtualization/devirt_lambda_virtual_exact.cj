// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: lambda body calls virtual on exact Child receiver -> Apply inside lambda.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default3useHv" | compare %f
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

func use(): Int64 {
    let c = Child()
    let f = { =>
        c.foo()
    }
    f()
}

main() {
    use() - 2
}
