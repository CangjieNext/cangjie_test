// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Negative: generic types keep virtual dispatch (I1 param, TryInvoke, generic Wrapper method).
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization --no-sub-pkg %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "WHOLE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Invoke(Class-_CN7default2I1E&->@_CN7default2I13fooHv
// ASSERT: scan TryInvoke(Class-_CN7default2I1E&->@_CN7default2I13fooHv
// ASSERT: scan-not TryApply(Class-_CN7default2I1E&->@_CN7default2I13fooHv
// ASSERT: scan Invoke(Generic-_CN7default7WrapperIG_E1TE->@_CN7default4Base3fooHv
// ASSERT: scan-not Apply(Generic-_CN7default7WrapperIG_E1TE->@_CN7default4Base3fooHv

interface I1 {
    func foo(): Int64
}

class CA<T> <: I1 {
    public func foo(): Int64 {
        1
    }
}

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

class Wrapper<T> where T <: Base {
    public func run(obj: T): Int64 {
        obj.foo()
    }
}

func testFoo(a: I1): Int64 {
    a.foo()
}

func testTryFoo(a: I1): Int64 {
    try {
        a.foo()
    } catch (_: Exception) {
        0
    }
}

func testWrapper(): Int64 {
    Wrapper<Child>().run(Child())
}

main() {
    testFoo(CA<Int64>()) + testTryFoo(CA<Int64>()) + testWrapper() - 4
}
