// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DT point#2 skip-policy branch1: the !fd.outerDecl half (top-level function).
// ShouldSkipAbstractFuncResolution(Ty& ty, const FuncDecl& fd) returns true at the first
// branch when `!fd.outerDecl || !IsVirtualMember(fd)`. A top-level (free) generic function has
// fd.outerDecl == nullptr, so the `!fd.outerDecl` half is satisfied and the function returns
// true without entering OverrideFunctionResolver.
//
// Important: FindImplFuncForAbstractFunc is only reached through the generic-instantiation
// rearrange path, and GenericRefExprInstantiate (GenericInstantiationManagerImpl.cpp:926-940)
// only builds a non-null baseTy when `structDecl != target->outerDecl`. Calling a top-level
// generic function from main() directly leaves structContext empty so structDecl ==
// target->outerDecl (both nullptr) -> baseTy stays null -> FindImplFuncForAbstractFunc is never
// called. The correct trigger is to reference the top-level generic function FROM INSIDE a
// generic class member: then structDecl (the enclosing instantiated class) != target->outerDecl
// (nullptr) -> baseTy non-null -> FindImplFuncForAbstractFunc called -> !fd.outerDecl true ->
// branch1 hit. Verified via instrumented cjc: [BR1_NULL] is emitted during compilation here.
//
// Note: the other half of branch1, `!IsVirtualMember(fd)`, is covered elsewhere (extend members
// in record_impl_extend.cj, non-open class members in prop_getter_setter.cj /
// cache_lifecycle_reset.cj) since IsVirtualMember returns false for those. This file is the
// only one that targets the `!fd.outerDecl` half.
// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan top level generic

func topLevelGeneric<T>(x: T): Int64 where T <: ToString {
    println("top level generic: ${x}")
    0
}

// Generic class whose member calls the top-level generic function. The reference happens inside
// the generic class body, so GenericRefExprInstantiate sees a non-empty structContext and the
// !fd.outerDecl branch of ShouldSkipAbstractFuncResolution is reached.
class Box<T> where T <: ToString {
    var v: T
    public init(v: T) { this.v = v }
    public func callTopLevel(): Int64 {
        topLevelGeneric(v)
    }
}

main() {
    let b = Box<Int64>(5)
    b.callTopLevel()
    0
}
