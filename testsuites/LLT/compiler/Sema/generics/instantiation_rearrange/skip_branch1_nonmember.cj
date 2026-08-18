// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DT point#2 skip-policy branch1: non-virtual / non-member function.
// ShouldSkipAbstractFuncResolution returns true immediately when fd.outerDecl is null or
// fd is not a virtual member (IsVirtualMember == false), so it never enters the
// OverrideFunctionResolver call-target rearrange.
// Here the call target `foo` is an interface *instance* method. During generic instantiation
// ShouldSkipAbstractFuncResolution is exercised on many candidate members; this case drives
// the branch1 path (`!IsVirtualMember(fd)` true for the non-virtual candidates) by routing
// the call through the interface default implementation, asserting the default is used and
// the runtime output is unchanged (single "nonvirtual"). Note: C deliberately does NOT
// override foo, so the interface default implementation is the one that runs.
// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan nonvirtual

interface I1 {
    func foo() {
        println("nonvirtual")
    }
}

class C <: I1 {}

// C does not override foo; the interface default implementation is the call target.
// ShouldSkipAbstractFuncResolution skips non-virtual candidates; dispatch reaches the
// interface default without any retarget to a wrong implementation version.
func callFoo<T>(x: T) where T <: I1 {
    x.foo()
}

main() {
    callFoo(C())
    0
}
