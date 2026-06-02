// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj file1.cj file2.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt %f file1.cj file2.cj -o %output %macro_debug
// EXEC: %run %run_opt %output %run_args
// EXEC: %cat call3.cj.macrocall
// EXEC: %cat file1.cj.macrocall

package demo

import pkg1.*

@Foo
class A {}

main() {
    @Bar let x = 2

    if (e != 2021 || a1 != 1) {
        return 1
    }

    baz()
    file2foo()
    0
}
