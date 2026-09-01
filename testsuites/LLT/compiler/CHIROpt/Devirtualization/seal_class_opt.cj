// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(Class-_CN7default2CAE&->@_CN7default2CA3fooHv
// ASSERT: scan Apply(Class-_CN7default3CA2E&->@_CN7default3CA23fooHv

public open interface I {
    public func foo(): Int64 {
        0
    }
}

public open class CA <: I {
    public func foo(): Int64 {
        1
    }
}

public class CA2 <: I {
    public func foo(): Int64 {
        2
    }
}

func goo(): I {
    return CA()
}

func goo2(): I {
    return CA2()
}

main() {
    goo().foo() + goo2().foo() - 3
}
