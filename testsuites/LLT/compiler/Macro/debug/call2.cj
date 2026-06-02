// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj file1.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt %f file1.cj -o %output %macro_debug
// EXEC: %run %run_opt %output %run_args
// EXEC: %cat call2.cj.macrocall
// EXEC: %cat file1.cj.macrocall

package demo

import pkg1.*

@Foo
struct Data {
    let a = 1
}

main() {
    @Bar
    let x = 2

    let y = @Same(2+3)

    baz()
    0
}
