// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../../../pick_defination.py pkgA.cj
// EXEC: %compiler %cmp_opt %enableDevirtualization pkgA.cj %compile_lib_opt -o test0.%middle
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all test0.%middle %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "WHOLE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(Class-_CN1A3FooE&->@_CN1A3Foo6createHRNat6StringE
// ASSERT: scan-not Invoke(Class-_CN1A3FooE&->@_CN1A3Foo6createHRNat6StringE
// ASSERT: scan Apply(Class-_CN1A3FooE&->@_CN1A3Foo7getNameHv
// ASSERT: scan-not Invoke(Class-_CN1A3FooE&->@_CN1A3Foo7getNameHv

internal import A.*

main() {
    Foo.create("foo").getName().size - 3
}
