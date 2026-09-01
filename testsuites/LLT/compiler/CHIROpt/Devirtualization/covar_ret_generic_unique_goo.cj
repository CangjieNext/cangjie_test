// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: unique generic Impl<T> <: Base; covariant goo(): RetBase → RetImpl.
// Local Base = Impl<Int64>() is exact enough → goo rewritten to Apply(inst Impl::goo).
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization --fno-chir-function-inlining %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(@_CIN7default4ImplIG_E3gooIG0_Hv$lb
// ASSERT: scan-not Invoke(Class-_CN7default4BaseE&->@_CN7default4Base3gooIG_Hv

interface RetBase {
    func foo(): Int64
}

class RetImpl <: RetBase {
    public func foo(): Int64 {
        1
    }
}

interface Base {
    func goo<R>(): RetBase
}

class Impl<T> <: Base {
    public func goo<R>(): RetImpl {
        RetImpl()
    }
}

main(): Int64 {
    var tmp1: Base = Impl<Int64>()
    var tmp2: RetBase = tmp1.goo<Bool>()
    tmp2.foo() - 1
}
