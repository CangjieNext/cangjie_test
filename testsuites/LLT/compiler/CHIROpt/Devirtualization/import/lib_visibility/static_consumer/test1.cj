// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Staticlib consumer: public exact type devirts, imported open base param stays Invoke.
// DEPENDENCE: ../../../../pick_defination.py p1
// EXEC: %compiler %cmp_opt %enableDevirtualization p1/test0.cj %compile_lib_opt -o test0.%middle
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all test0.%middle %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7defaultUtest1\$7TestAllHCN5test08OpenBaseE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(Class-_CN5test011PublicFinalE&->@_CN5test011PublicFinal3fooHv
// ASSERT: scan Invoke(Class-_CN5test08OpenBaseE&->@_CN5test08OpenBase3fooHv
// ASSERT: scan-not Apply(Class-_CN5test08OpenBaseE&->@_CN5test08OpenBase3fooHv

internal import test0.*

private func TestAll(a: OpenBase): Int64 {
    let r1 = PublicFinal().foo()
    let r2 = a.foo()
    r1 + r2
}

main() {
    TestAll(PublicFinal()) - 4
}
