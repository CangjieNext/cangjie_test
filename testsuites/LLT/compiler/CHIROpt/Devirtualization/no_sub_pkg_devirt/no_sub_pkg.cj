// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../../pick_defination.py no_sub_pkg_lib.cj
// EXEC: %compiler %cmp_opt --no-sub-pkg no_sub_pkg_lib.cj %compile_lib_opt -o test0.%middle
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all test0.%middle %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "WHOLE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Invoke(Class-_CN14no_sub_pkg_lib2IIIG_E<Int32>&->@_CN14no_sub_pkg_lib2IIIG_E3fooHv
// ASSERT: scan-not Apply(Class-_CN14no_sub_pkg_lib2IIIG_E<Int32>&->@_CN14no_sub_pkg_lib2IIIG_E3fooHv

import no_sub_pkg_lib.*

main() {
    let a: II<Int32> = goo()
    a.foo() - 0
}
