// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DT whitebox#19 / feature-C FindGenericInstantiatedFunc fallback (returns fd itself when
// no candidate implementation exists).
// FindImplFuncForAbstractFunc falls back to &fd (L774) when no isInDiffDecl implementation is
// hit among candidate funcs, i.e. the call goes to the interface default implementation.
// This case: the class implements the interface but does NOT override foo, asserting the
// interface default implementation is used instead of crashing.
// This also covers the GetInstantiatedTarget empty-fallback semantics (after the issue #843
// fix, the default implementation is correctly preserved).
// Note: structurally this mirrors skip_branch2_interface_nonstatic.cj, but they exercise
// different internals -- this one targets the FindImplFuncForAbstractFunc no-match fallback
// to &fd (whitebox#19), while skip_branch2 targets the skip-policy branch2. Keep both.
// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan iface default

interface I1<T> {
    func foo(x: T) {
        println("iface default")
    }
}

// Does not override foo, triggering FindImplFuncForAbstractFunc fallback to fd itself
// (the interface default implementation).
class C <: I1<Int64> {}

func dispatch<T, U>(x: T, a: U) where T <: I1<U> {
    x.foo(a)
}

main() {
    dispatch(C(), 1)
    0
}
