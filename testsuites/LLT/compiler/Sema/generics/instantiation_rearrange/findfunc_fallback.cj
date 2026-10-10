// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DT whitebox#19 / feature-C FindGenericInstantiatedFunc fallback (returns fd itself when
// no candidate implementation exists).
// FindImplFuncForAbstractFunc (GenericInstantiationManagerImpl.cpp:750) calls
// ShouldSkipAbstractFuncResolution first; when none of its three skip-branches fire it enters
// OverrideFunctionResolver to look for a real implementation. If no candidate satisfies
// isInDiffDecl, the loop falls through and the function returns &fd (the interface default).
//
// This case drives exactly that no-skip + no-candidate path: the call target `foo` is an
// interface instance method (virtual, so branch1's !IsVirtualMember is false; outerDecl=I1 is
// non-null so !fd.outerDecl is false), the receiver is class C (ty.IsInterface() false ->
// branch2 false), and C != I1 (branch3 DIFF -> false). All skip-branches false -> enter the
// resolver. C does not override foo, so the only candidate is I1's own foo and isInDiffDecl is
// false -> loop is empty -> return &fd -> the interface default runs. Verified via instrumented
// cjc: this file reaches the resolver and returns &fd; it does NOT hit branch2 (unlike
// skip_branch2_interface_nonstatic.cj, which now binds the receiver to the interface type and
// hits branch2). The two files are genuinely distinct paths.
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
