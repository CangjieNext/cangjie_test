// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Invoke(Class-_CN7default1AE&->@_CN7default1A3aooHv

main(): Int64 {
    if (case01(1, 2).aoo() != 1) {
        return 4
    }
    return 0
}

func case01(a: Int32, b: Int32): A {
    if (a > b) {
        return A()
    } else {
        return B()
    }
}

open class A {
    public let a = 2
    public open func aoo() {
        return a
    }
}

class B <: A {
    public let b = 1
    public override func aoo() {
        return b
    }
}
