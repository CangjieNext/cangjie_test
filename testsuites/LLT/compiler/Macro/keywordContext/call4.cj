// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import open.*

main(): Int64 {
    var a: Int64 = @public[1](2+3)
    var b: Int64 = @public[2*(2+3)](+2+3)
    var c: Int64 = @public[2+(2+3)](*(2+4))
    if (a != 4) {
        return 1
    }
    if (b != 13) {
        return 1
    }
    if (c != 10) {
        return 1
    }
    0
}
