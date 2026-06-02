// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import view.*

@callView
class te2 {
    var fi: Int64 = 1
    @M[1 + 2]
    init(name: Int64) {
        fi = name
    }
}

main(): Int64 {
    if (te2(5).fi != 5) {
        return 1
    }
    return 0
}
