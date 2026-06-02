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
    | Year(Int64)
}

main() {
    var a1 = (Month, Month)
    var b1 = match (a1) {
        case (TimeUnit.Month, TimeUnit.Month) => 3
        case (_, _) => 4
    }

    var a2 = (Year(1), Year(2))
    var b2 = match (a2) {
        case (TimeUnit.Month, TimeUnit.Month) => 3
        case (TimeUnit.Year(a), TimeUnit.Year(b)) => a + b
        case (_, _) => 8
    }
    return b1 + b2 - 6
}
