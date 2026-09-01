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
// ASSERT: scan Invoke(Class-_CN7default4BaseE&->@_CN7default4Base3fooHv

interface Base {
    func foo(): Int64 {
        0
    }
}

class A <: Base {
    var a = 1
    public func foo(): Int64 {
        1
    }
}

class B<T> {
    static var sa: Base
    static init() {
        sa = A()
    }
}

main() {
    var x = B<Int64>()
    B<Int64>.sa.foo() - 1
}
