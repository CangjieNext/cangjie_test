// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Staticlib: private open/final — exact PrivateFinal devirts, PrivateOpen param stays Invoke.
// DEPENDENCE: ../../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj %compile_lib_opt -o test0.%middle
// EXEC: %python pick_defination.py test0_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN5test0U00000002ptVRQ22testPrivateInStaticLibHCNY_11PrivateOpenE" | compare %f
// ASSERT: scan Apply(Class-_CN5test0U00000002ptVRQ12PrivateFinalE&->@_CN5test0U00000002ptVRQ12PrivateFinal3fooHv
// ASSERT: scan Invoke(Class-_CN5test0U00000002ptVRQ11PrivateOpenE&->@_CN5test0U00000002ptVRQ11PrivateOpen3fooHv
// ASSERT: scan-not Apply(Class-_CN5test0U00000002ptVRQ11PrivateOpenE&->@_CN5test0U00000002ptVRQ11PrivateOpen3fooHv

package test0

private open class PrivateOpen {
    public open func foo(): Int64 {
        7
    }
}

private class PrivateFinal <: PrivateOpen {
    public func foo(): Int64 {
        8
    }
}

private func testPrivateInStaticLib(a: PrivateOpen): Int64 {
    let x: PrivateFinal = PrivateFinal()
    x.foo() + a.foo()
}
