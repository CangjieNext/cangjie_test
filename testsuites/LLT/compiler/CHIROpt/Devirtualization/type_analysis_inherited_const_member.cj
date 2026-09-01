// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Cover member access on inherited const field (outerDef / parent const map lookup).
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default3useHCNY_5ChildE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan GetElementRef(
// ASSERT: scan Apply(Class-_CN7default4ImplE&->@_CN7default4Impl3fooHv
// ASSERT: scan-not Invoke(Class-_CN7default1IE&->@_CN7default1I3fooHv

interface I {
    func foo(): Int64
}

class Impl <: I {
    public func foo(): Int64 {
        5
    }
}

open class Parent {
    public let m: I = Impl()
}

class Child <: Parent {}

func use(c: Child): Int64 {
    c.m.foo()
}

main() {
    use(Child()) - 5
}
