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
// ASSERT: scan Apply(Class-_CN7default1BE&->@_CN7default1B3getHv
// ASSERT: scan-not Invoke(Class-_CN7default1BE&->@_CN7default1B3getHv
// ASSERT: scan Apply(Class-_CN7default1BE&->@_CN7default1B3getHv
// ASSERT: scan-not Invoke(Class-_CN7default1BE&->@_CN7default1B3getHv
// ASSERT: scan Apply(Class-_CN7default1BE&->@_CN7default1B3getHv
// ASSERT: scan-not Invoke(Class-_CN7default1BE&->@_CN7default1B3getHv

interface A {
    func get(): Int64
}

class B <: A {
    public open func get(): Int64 {
        1
    }
}

class D <: A {
    public func get(): Int64 {
        2
    }
}

class TestGet {
    public var success: B = B()
}

func foo(): A {
    let a = TestGet()
    return a.success
}

func foo2(a: A): Int64 {
    a.get()
}

main() {
    let a = foo()
    let r1 = a.get()

    let t = TestGet()
    var a1: A = t.success
    let r2 = a1.get()

    let r3 = foo2(t.success)
    r1 + r2 + r3 - 3
}
