// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Dylib: protected open/final — exact ProtectedFinal devirts, ProtectedOpen param stays Invoke.
// DEPENDENCE: ../../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj %compile_shared_lib_opt -o test0.%dylib_suffix
// EXEC: %python pick_defination.py test0_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN5test020testProtectedInDylibHCNY_13ProtectedOpenE" | compare %f
// ASSERT: regex Apply\(Class-_CN5test014ProtectedFinalE&->@_CN5test014ProtectedFinal3fooHv, %\d+\) // loc: "dylib_protected.cj"-31-5
// ASSERT: regex Invoke\(Class-_CN5test013ProtectedOpenE&->@_CN5test013ProtectedOpen3fooHv, %\d+\) // loc: "dylib_protected.cj"-31-15
// ASSERT: scan-not Apply(Class-_CN5test013ProtectedOpenE&->@_CN5test013ProtectedOpen3fooHv

package test0

protected open class ProtectedOpen {
    public open func foo(): Int64 {
        5
    }
}

protected class ProtectedFinal <: ProtectedOpen {
    public func foo(): Int64 {
        6
    }
}

protected func testProtectedInDylib(a: ProtectedOpen): Int64 {
    let x: ProtectedFinal = ProtectedFinal()
    x.foo() + a.foo()
}
