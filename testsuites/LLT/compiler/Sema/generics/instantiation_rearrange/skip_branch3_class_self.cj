// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DT point#2 skip-policy branch3: class itself.
// ShouldSkipAbstractFuncResolution returns true when ty.IsClass() and the type where
// fd.outerDecl lives == ty. i.e. the class of the virtual function's call target is exactly
// the class where fd is defined, so no upward rearrange is needed. This case calls C's own
// virtual method from inside C, asserting C's own implementation (not the parent default).
// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan own in C
// ASSERT: scan-not base in B

open class B {
    public open func own() {
        println("base in B")
    }
}

class C <: B {
    // Override the parent virtual method: the call-target class (C) == the class where
    // `own` is defined (C), so the rearranger must skip and dispatch to C's own version.
    public override func own() {
        println("own in C")
    }
}

main() {
    let c = C()
    c.own()
    0
}
