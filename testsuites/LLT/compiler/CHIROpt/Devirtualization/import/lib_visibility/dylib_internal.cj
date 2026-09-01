// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Dylib: internal open/final — exact InternalFinal devirts, InternalOpen param stays Invoke.
// DEPENDENCE: ../../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj %compile_shared_lib_opt -o test0.%dylib_suffix
// EXEC: %python pick_defination.py test0_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN5test019testInternalInDylibHCNY_12InternalOpenE" | compare %f
// ASSERT: scan Apply(Class-_CN5test013InternalFinalE&->@_CN5test013InternalFinal3fooHv
// ASSERT: scan Invoke(Class-_CN5test012InternalOpenE&->@_CN5test012InternalOpen3fooHv
// ASSERT: scan-not Apply(Class-_CN5test012InternalOpenE&->@_CN5test012InternalOpen3fooHv

package test0

internal open class InternalOpen {
    public open func foo(): Int64 {
        3
    }
}

internal class InternalFinal <: InternalOpen {
    public func foo(): Int64 {
        4
    }
}

internal func testInternalInDylib(a: InternalOpen): Int64 {
    let x: InternalFinal = InternalFinal()
    x.foo() + a.foo()
}
