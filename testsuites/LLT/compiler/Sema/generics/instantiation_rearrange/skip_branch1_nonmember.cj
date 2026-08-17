// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DT point#2 skip-policy branch1: non-virtual / non-member function.
// ShouldSkipAbstractFuncResolution returns true immediately when fd.outerDecl is null or
// fd is not a virtual member, so it never enters the OverrideFunctionResolver call-target
// rearrange. This case builds a non-virtual top-level generic function whose call must NOT
// trigger rearrange; runtime output stays the direct-call result.
// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan nonvirtual
// ASSERT: scan-not rearranged

interface I1 {
    func foo() {
        println("nonvirtual")
    }
}

class C <: I1 {}

// Top-level generic function: fd.outerDecl is non-null but foo is non-virtual (directly
// implemented by C). The rearranger must skip it and must not retarget to a wrong version.
func callFoo<T>(x: T) where T <: I1 {
    x.foo()
}

main() {
    callFoo(C())
    0
}
