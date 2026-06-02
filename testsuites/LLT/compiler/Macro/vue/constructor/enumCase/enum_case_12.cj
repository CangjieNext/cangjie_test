// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %f -o %output
// ASSERT: regex expected a enum value name after '|' in enum body, found keyword 'func'
import view.*

@M
enum TimeUnit {
    Year | @MonthFuncDecl
    M | Day | Hour
}

main() {
    var time = TimeUnit.Month(1)
    var res: Int64 = match (time) {
        case Month(_) => 0
        case _ => 2
    }
    return res
}
