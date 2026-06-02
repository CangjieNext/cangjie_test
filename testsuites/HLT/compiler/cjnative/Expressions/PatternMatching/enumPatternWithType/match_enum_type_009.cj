/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

enum TimeUnit {
    Month
    | Year(Unit)
    | Day(Int32, Int64)
}

main() {
    var a1 = Year(())
    var b1 = match (a1) {
        case TimeUnit.Month | TimeUnit.Year(()) | TimeUnit.Day(1, 1) => 3
        case TimeUnit.Day(_, _) => 4
    }

    return b1 - 3
}
