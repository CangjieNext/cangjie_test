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
    var a1 = Month
    var b = match (a1) {
        case TimeUnit.Month => 3
        case Year(1) => 4
        case Year(_) => 5
    }
    return b - 3
}
