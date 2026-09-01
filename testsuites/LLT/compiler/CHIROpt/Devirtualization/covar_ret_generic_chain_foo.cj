// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: unique generic Impl<T>; covariant goo return RetImpl.
// Under --no-sub-pkg, Base param keeps goo as Invoke, but chained .foo() uses
// return-type map → Apply(RetImpl::foo).
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization --fno-chir-function-inlining %dumpCHIRDebug -Woff all --no-sub-pkg %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default4callHCNY_4BaseE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Invoke(Class-_CN7default4BaseE&->@_CN7default4Base3gooIG_Hv
// ASSERT: scan Apply(Class-_CN7default7RetImplE&->@_CN7default7RetImpl3fooHv
// ASSERT: scan-not Invoke(Class-_CN7default7RetBaseE&->@_CN7default7RetBase3fooHv

interface RetBase {
    func foo(): Int64
}

class RetImpl <: RetBase {
    public func foo(): Int64 {
        9
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

func call(b: Base): Int64 {
    b.goo<Bool>().foo()
}

main(): Int64 {
    call(Impl<Int64>()) - 9
}
