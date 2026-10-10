// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DT point#2 skip-policy branch2: interface non-static function.
// ShouldSkipAbstractFuncResolution(Ty& ty, const FuncDecl& fd) returns true when
// ty.IsInterface() && !fd.TestAttr(STATIC). Here `ty` is the RECEIVER type (the type of the
// base expression at the call site, passed in as ma.baseExpr->GetTy() at
// GenericInstantiationManagerImpl.cpp:889/894), NOT the type of fd.outerDecl.
//
// To make ty.IsInterface() true, the receiver's static type must be an interface. A generic
// dispatch func<T> where T <: I1 instantiated with a concrete class C leaves the receiver type
// as class C (ty.IsInterface() == false -> branch2 NOT hit). So this case binds the receiver
// to the interface type directly: `let i: I1<Int64> = C(); i.foo(1)`, making ty == I1<Int64>
// (an interface) and foo a non-static instance member of I1 -> branch2 returns true (skip).
// Verified via instrumented cjc: branch2 is hit exactly once here, whereas the class-receiver
// form hits zero. See the instrumented-cjc reproduction steps recorded in dt-check.md to
// re-verify that this case still targets branch2.
// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan iface default

interface I1<T> {
    func foo(a: T) {
        println("iface default")
    }
}

class C <: I1<Int64> {}

main() {
    // Bind to the interface type so the receiver's static type is I1<Int64> (not class C).
    let i: I1<Int64> = C()
    i.foo(1)
    0
}
