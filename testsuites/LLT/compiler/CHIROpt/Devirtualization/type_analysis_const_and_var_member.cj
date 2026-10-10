// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Cover constMemberTypeMap hit with index miss (var member) -> HandleDefaultExpr.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default3useHCNY_6HolderE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan GetElementRef(
// ASSERT: scan Apply(Class-_CN7default4ImplE&->@_CN7default4Impl3fooHv
// ASSERT: scan Invoke(Class-_CN7default1IE&->@_CN7default1I3fooHv

interface I {
    func foo(): Int64
}

class Impl <: I {
    public func foo(): Int64 {
        4
    }
}

class Holder {
    public let a: I = Impl()
    public var b: I = Impl()
}

func use(h: Holder): Int64 {
    h.a.foo() + h.b.foo()
}

main() {
    use(Holder()) - 8
}
