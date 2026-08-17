// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DT whitebox#21 RecordImplExtendDecl override.
// RecordImplExtendDecl records the extend when the implementing function lives in an ExtendDecl
// (not the origin decl), so the generic-instantiated interface call target is rearranged to the
// extend implementation version. This case: a generic struct's extend implements an interface
// method, asserting the call goes to the extend implementation (outputs "extend impl") rather
// than the interface default implementation.
// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan extend impl
// ASSERT: scan-not iface default

interface I1 {
    func greet() {
        println("iface default")
    }
}

public struct Box<T> {
    let inner: T
    public init(inner: T) {
        this.inner = inner
    }
}

// The extend implements the interface method: the implementation lives in an ExtendDecl,
// triggering RecordImplExtendDecl to record this extend.
extend<T> Box<T> <: I1 {
    public func greet() {
        println("extend impl")
    }
}

func dispatch<T>(x: T) where T <: I1 {
    x.greet()
}

main() {
    dispatch(Box<Int64>(1))
    0
}
