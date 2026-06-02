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

type A = TimeUnit

main() {
    var a1 = Year(8)
    var b = match (a1) {
        case A.Month => 3
        case A.Year(a) => a
    }
    return b - 8
}
