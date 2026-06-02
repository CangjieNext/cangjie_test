// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %f -o %output
// ASSERT: regex expected '<NL>' or ';', found '|'

import view.*

enum TimeUnit {
    Year | @MonthAndDay
    M | Hour
}

main() {
    var time = TimeUnit.Year
    var res: Int32 = match (time) {
        case Day => 1
        case Year => 0
        case _ => 2
    }
    return res
}
