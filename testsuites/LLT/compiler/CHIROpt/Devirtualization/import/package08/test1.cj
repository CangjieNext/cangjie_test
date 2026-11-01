// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../../../pick_defination.py p1
// EXEC: %compiler %cmp_opt %enableDevirtualization p1/test0.cj %compile_lib_opt -o test0.%middle
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all test0.%middle %n.cj
// Negative: I/I2-typed parameters stay Invoke across imported A and local interface defaults.
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7defaultUtest1\$7TestAllHCNY_1IECNY_2I2E" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Invoke(Class-_CN7defaultUtest1$1IE&->@_CN7defaultUtest1$1I3FooHv
// ASSERT: scan Invoke(Class-_CN7defaultUtest1$2I2E&->@_CN7defaultUtest1$2I23BarHv
// ASSERT: scan-not Apply(Class-_CN7defaultUtest1$1IE&->@_CN7defaultUtest1$1I3FooHv
// ASSERT: scan-not Apply(Class-_CN7defaultUtest1$2I2E&->@_CN7defaultUtest1$2I23BarHv

internal import test0.*

private interface I {
    func Foo(): Int64 {
        3
    }
}

private interface I2 {
    func Bar(): Int64 {
        4
    }
}

private class B <: A & I & I2 {}

private func TestAll(i: I, i2: I2): Int64 {
    i.Foo() + i2.Bar()
}

main() {
    let b = B()
    // A.Foo=1, A.Bar=0 (B does not override)
    TestAll(b, b) - 1
}
