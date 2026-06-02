// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg1.cj pkg2.cj
// EXEC-PIPE: %compiler %cmp_opt %enableCompileDebug %compile_lib_opt pkg1.cj -o pkg1.%middle
// EXEC-PIPE: %compiler %cmp_opt %enableCompileDebug %compile_lib_opt pkg2.cj -o pkg2.%middle
// (CJNATIVE) EXEC-PIPE: %compiler %cmp_opt %enableCompileDebug %n.cj pkg2.%middle pkg1.%middle -o %n.%suffix
// (not CJNATIVE) EXEC-PIPE: %compiler %cmp_opt %enableCompileDebug %n.cj pkg1.%middle pkg2.%middle -o %n.%suffix
// RUN-EXEC-PIPE: %run %run_opt %n.%suffix %run_args

internal import pkg2.*

main() {
    let a: A = getA()
    a.test()
}
