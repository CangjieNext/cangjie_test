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
// ASSERT: scan Apply(Class-_CN7default1BE&->@_CN7default1B3barHv
// ASSERT: scan-not Invoke(Class-_CN7default1BE&->@_CN7default1B3barHv

open class A {
    public open func foo(): Int64 {
        return 1
    }
}

open class B {
    public var a: A = A()
    public open func bar(): Int64 {
        return 0
    }
}

main() {
    var b = B()
    b.a = A()
    b.bar() - 0
}
