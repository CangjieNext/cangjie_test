// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Cover TypeValue::Join across two concrete classes merged under an interface.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default3useHb" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan ClassStaticCast(
// ASSERT: scan Invoke(Class-_CN7default1IE&->@_CN7default1I3fooHv

interface I {
    func foo(): Int64
}

open class A <: I {
    public func foo(): Int64 {
        1
    }
}

open class B <: I {
    public func foo(): Int64 {
        2
    }
}

func use(flag: Bool): Int64 {
    var x: I
    if (flag) {
        x = A()
    } else {
        x = B()
    }
    x.foo()
}

main() {
    use(true) - 1
}
