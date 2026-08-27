// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../../../pick_defination.py p1
// EXEC: %compiler %cmp_opt %enableDevirtualization p1/test0.cj %compile_lib_opt -o test0.%middle
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all test0.%middle %n.cj
// Negative: I-typed parameter stays Invoke even when B overrides Foo.
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7defaultUtest1\$4TestHCNY_1IE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Invoke(Class-_CN7defaultUtest1$1IE&->@_CN7defaultUtest1$1I3FooHv
// ASSERT: scan-not Apply(Class-_CN7defaultUtest1$1IE&->@_CN7defaultUtest1$1I3FooHv

internal import test0.*

private interface I {
    func Foo(): Int64 {
        1
    }
}

private class B <: A & I {
    public func Foo(): Int64 {
        0
    }
}

private func Test(i: I): Int64 {
    i.Foo()
}

main() {
    Test(B()) - 0
}
