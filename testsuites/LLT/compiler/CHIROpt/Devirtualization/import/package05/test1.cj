// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../../../pick_defination.py p1
// EXEC: %compiler %cmp_opt %enableDevirtualization p1/test0.cj %compile_lib_opt -o test0.%middle
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all test0.%middle %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "WHOLE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Invoke(Class-_CN5test01AE&->@_CN5test01A3FooHv
// ASSERT: scan-not Apply(Class-_CN5test01AE&->@_CN5test01A3FooHv

internal import test0.*

func test(): A {
    var b: B = C()
    return b
}

main() {
    var x: A = test()
    return x.Foo() - 20
}
