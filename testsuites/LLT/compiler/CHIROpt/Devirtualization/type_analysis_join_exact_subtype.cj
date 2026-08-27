// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Cover Join(EXACTLY, SUBTYPE_OF): loop-header merge and if-branch downcast merge.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "WHOLE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan ClassStaticCast(
// ASSERT: scan Invoke(Class-_CN7default4BaseE&->@_CN7default4Base3fooHv
// ASSERT: scan Apply(Class-_CN7default5ExactE&->@_CN7default5Exact3fooHv
// ASSERT: scan-not Invoke(Class-_CN7default5ExactE&->@_CN7default5Exact3fooHv

open class Base {
    public open func foo(): Int64 {
        1
    }
}

class Exact <: Base {
    public func foo(): Int64 {
        2
    }
}

func useLoop(b: Base): Int64 {
    var x: Exact = Exact()
    var i: Int64 = 0
    while (i < 1) {
        if (let Some(e) <- (b as Exact)) {
            x = e
        }
        i = i + 1
    }
    b.foo()
    x.foo()
}

func useIf(flag: Bool, b: Base): Int64 {
    var x: Exact
    if (flag) {
        x = Exact()
    } else {
        if (let Some(e) <- (b as Exact)) {
            x = e
        } else {
            x = Exact()
        }
    }
    b.foo()
    x.foo()
}

main() {
    useLoop(Exact()) + useIf(false, Exact()) - 4
}
