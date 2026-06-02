// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macroOverLoad.cj
// EXEC: %compiler %cmp_macro macroOverLoad.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import pkg1.*

main(): Int64 {
    var a: Int64 = @Foo[1+](2+3)
    var b: Int64 = @Foo(2+3)
    var c: Int64 = @Bar[2+]((2+4))
    var d: Int64 = @Bar(2+4)
    if (a != 6) {
        return 1
    }
    if (b != 5) {
        return 1
    }
    if (c != 8) {
        return 1
    }
    if (d != 6) {
        return 1
    }
    0
}
