// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: a.cj b.cj define.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt a.cj -o liba.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt b.cj -o libb.%middle
// (Windows) EXEC: %compiler %cmp_opt %cmp_macro define.cj libb.%middle liba.%middle
// (Unix) EXEC: %compiler %cmp_opt %cmp_macro define.cj liba.%middle libb.%middle
// EXEC: %compiler %cmp_opt %f liba.%middle libb.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import M.*

main() {
    var a = foo()
    var b = bar()
    return a + b - 3
}
