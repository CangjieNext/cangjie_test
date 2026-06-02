// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macroFoo.cj
// EXEC: %compiler %cmp_macro macroFoo.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 

import pkg1.*

@Foo
func foo(): Int64 {
    var a = @Foo(2019+1)
    return a + 1
}

main(): Int64 {
    var year = foo()
    if (year != 2021) {
        return 1
    }
    0
}
