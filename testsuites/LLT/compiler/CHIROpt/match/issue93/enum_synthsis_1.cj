// LEVEL: 0
// EXEC: %compiler %cmp_opt %f %enableO2 -o %output
// RUN-EXEC-8: %run %run_opt %output %run_args

enum TimeUnit{
Year(Int64) |
Month(Int64, Int64) |
Day(Int64, Int64, Int64)
}

main() {
    var a = Day(0, 0, 0)
    var b = match (a) {
        case TimeUnit.Day(1, 2, 3) => 4
        case TimeUnit.Day(2, _, _) => 5
        case TimeUnit.Day(_, _, _) => 8
        case _ => 6
    }
    return b
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
