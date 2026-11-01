// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Dylib: public open + public final — exact PublicFinal devirts, OpenBase param stays Invoke.
// DEPENDENCE: ../../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj %compile_shared_lib_opt -o test0.%dylib_suffix
// EXEC: %python pick_defination.py test0_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN5test015testOpenInDylibHCNY_8OpenBaseE" | compare %f
// ASSERT: scan Apply(Class-_CN5test011PublicFinalE&->@_CN5test011PublicFinal3fooHv
// ASSERT: scan Invoke(Class-_CN5test08OpenBaseE&->@_CN5test08OpenBase3fooHv
// ASSERT: scan-not Apply(Class-_CN5test08OpenBaseE&->@_CN5test08OpenBase3fooHv

package test0

public open class OpenBase {
    public open func foo(): Int64 {
        1
    }
}

public class PublicFinal <: OpenBase {
    public func foo(): Int64 {
        2
    }
}

public func testOpenInDylib(a: OpenBase): Int64 {
    let x: PublicFinal = PublicFinal()
    x.foo() + a.foo()
}
