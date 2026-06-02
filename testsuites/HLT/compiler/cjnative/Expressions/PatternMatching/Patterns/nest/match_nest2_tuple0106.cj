/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

var r1: Float32 = match ((TimeUnit.Year(1.0), Month(1.0, 2.0))) {
    case (Month(b, c), Year(a)) => 1.0
    case (Year(y), Month(b, c)) => y - 1.0 + c - b - 1.0
    case _ => 1.0
}

enum TimeUnit {
    Year(Float32)
    | Month(Float32, Float32)
    | Day(Float32, Float32, Float32)
    | Hour(Float32, Float32, Float32, Float32)
}

main(): Int64 {
    if (r1 != 0.0) {
        return 1
    }

    return 0
}
