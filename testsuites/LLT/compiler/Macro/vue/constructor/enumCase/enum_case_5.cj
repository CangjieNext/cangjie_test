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

enum TimeUnit {
    Year | @M
    Month(Int64) | Day | Hour
}

main() {
    var time = TimeUnit.Month(1)
    var res: Int32 = match (time) {
        case Day => 1
        case Month(_) => 0
        case _ => 2
    }
    return res
}
