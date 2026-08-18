// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DT point#2 skip-policy branch4: base type DIFFERS from the implementing class, so it
// enters the real rearrange (L729-730 returns false).
// When ty.IsClass() but the type where fd.outerDecl lives != ty, ShouldSkipAbstractFuncResolution
// returns false -- it does NOT skip, and enters OverrideFunctionResolver to actually query the
// call target. This case has a generic-constrained method where the parent virtual function is
// overridden by the subclass, verifying the rearranger retargets to the subclass implementation
// rather than the parent base-type version.
// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan rearranged to sub
// ASSERT: scan-not base type

open class Base {
    public open func who(): Int64 {
        println("base type")
        0
    }
}

// Subclass overrides the parent virtual method: the call-target class (Sub) != the class
// where `who` is defined (Base), so it enters the rearrange.
class Sub <: Base {
    public override func who(): Int64 {
        println("rearranged to sub")
        1
    }
}

func dispatch<T>(x: T) where T <: Base {
    x.who()
}

main() {
    dispatch(Sub())
    0
}
