// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: exact receiver TryInvoke -> TryApply (plain try, throwing override, nested try).
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "WHOLE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan TryApply(Class-_CN7default5ChildE&->@_CN7default5Child3fooHv
// ASSERT: scan TryApply(Class-_CN7default10ThrowChildE&->@_CN7default10ThrowChild3fooHv
// ASSERT: scan-not TryInvoke(Class-_CN7default5ChildE&->@_CN7default5Child3fooHv
// ASSERT: scan-not TryInvoke(Class-_CN7default10ThrowChildE&->@_CN7default10ThrowChild3fooHv

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

class ThrowChild <: Base {
    public func foo(): Int64 {
        throw Exception("e")
    }
}

func useExact(): Int64 {
    let b: Base = Child()
    try {
        b.foo()
    } catch (_: Exception) {
        0
    }
}

func useThrow(): Int64 {
    let b: Base = ThrowChild()
    try {
        b.foo()
    } catch (_: Exception) {
        42
    }
}

func useNested(): Int64 {
    let b: Base = Child()
    try {
        try {
            b.foo()
        } catch (_: Exception) {
            3
        }
    } catch (_: Exception) {
        0
    }
}

main() {
    useExact() + useThrow() + useNested() - 46
}
