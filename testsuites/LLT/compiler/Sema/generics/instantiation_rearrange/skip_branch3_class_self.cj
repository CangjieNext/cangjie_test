// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DT point#2 skip-policy branch3: class itself (receiver type == the class defining the func).
// ShouldSkipAbstractFuncResolution returns true at the last branch when
// ty.IsClass() && Ty::GetDeclPtrOfTy(fd.outerDecl->GetTy()) == Ty::GetDeclPtrOfTy(&ty), i.e. the
// receiver type (ty, = ma.baseExpr->GetTy()) is a class AND equals the class where fd is
// defined, so no upward rearrange is needed.
//
// Important: ShouldSkipAbstractFuncResolution is only called from FindImplFuncForAbstractFunc,
// which is reached only via the generic-instantiation rearrange path. A purely non-generic
// program (the previous version of this file) never enters that path, so the function was
// never called for this case (verified: called 0 times). This version routes the call through a
// generic dispatch<T> where T <: B and instantiates with B() itself, so the receiver type is
// exactly B -- the open class that defines the virtual `own`. ty.IsClass() is true and
// fd.outerDecl (B) == ty (B) -> branch3 returns true (skip). Verified via instrumented cjc:
// [BR3_SAME] is emitted during compilation here.
//
// Note: the class defining the virtual function MUST be open/abstract so IsVirtualMember(rule 4)
// returns true -- otherwise branch1 (!IsVirtualMember) fires first and branch3 is unreachable.
// That is why `B` is `open` here. The previous version used a non-open C, which made C.own
// non-virtual and, combined with the lack of generics, never reached this code at all.
// Verified via instrumented cjc: [BR3_SAME] is emitted during compilation here. See the
// instrumented-cjc reproduction steps recorded in dt-check.md to re-verify that this case
// still targets branch3.
// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan base in B
// ASSERT: scan-not own in C

open class B {
    public open func own(): Int64 {
        println("base in B")
        0
    }
}

// NOTE: `C` is intentionally kept even though main() never constructs it. Its `own`
// override exists solely so that the `ASSERT: scan-not own in C` below has a real source
// string to match -- it guards against the rearranger wrongly redirecting B.own to a subclass
// version. Do NOT delete C as dead code; removing it turns that scan-not into a vacuously-true
// assertion that guards nothing.
class C <: B {
    public override func own(): Int64 {
        println("own in C")
        1
    }
}

// Generic dispatch constrained to B. Instantiated with B() (not a subclass), so the receiver's
// static type is exactly B -- the class that defines `own` -- making branch3 (same-class) true.
func dispatch<T>(x: T) where T <: B {
    x.own()
}

main() {
    dispatch(B())   // receiver type == B (defining class) -> branch3 skip
    0
}
