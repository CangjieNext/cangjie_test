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
@Foo
func foo(): Int64 {
    @Foo var a = 1
    var b = 2
    @Foo var c = 3
    var d = 4
    return a + b + c + d
}

main(): Int64 {
    var cnt = foo()
    if (cnt != 10) {
        return 1
    }
    0
}
