// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj 
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output %macro_debug
// EXEC: %cat call4.cj.macrocall
// EXEC: %run %run_opt %output %run_args

package demo

import pkg1.*

@Foo
class A {
    @Bar
    @Bar
    let x = 1
}

main() {
    @Bar
    @Bar
    let y = 3

    if (a1 != 1 || a2 != 2) {
        return 1
    }
    if (d != 2021) {
        return 1
    }
    0
}
