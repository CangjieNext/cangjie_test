// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Negative: f<T>(x: T) where T <: I is never fully instantiated; x.foo() stays Invoke.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default1fIG_HG_<Generic-_CN7default1fIG_HG_E1TE>" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan CastToConcrete(
// ASSERT: scan Invoke(Generic-_CN7default1fIG_HG_E1TE->@_CN7default1I3fooHv
// ASSERT: scan-not Apply(Struct-_CN7default1SE->@_CN7default1S3fooHv

interface I {
    func foo(): Int64
}

struct S <: I {
    public func foo(): Int64 {
        6
    }
}

func f<T>(x: T) where T <: I {
    x.foo()
}

func use<T>(x: T) where T <: I {
    f(x)
}

main() {
    use(S()) - 6
}
