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
    | Year(Float32)
    | Month(Float32, Float32)
    | Day(Float32, Float32, Float32)
    | Hour(Float32, Float32, Float32, Float32)
}

main() {
    let oneYear = TimeUnit.Year(1.0)
    var howManyHours: Float32 = match (oneYear) {
        case Year(y) where (y > 0.0) => y * 365.0 * 24.0 // matched
        case Year(y) where (y <= 0.0) => 0.0
        case Month(y, m) where (y > 0.0 && m > 0.0) => y * 365.0 * 24.0 + m * 30.0 * 24.0
        case Day(y, m, d) where (y > 0.0 && m > 0.0 && d > 0.0) => y * 365.0 * 24.0 + m * 30.0 * 24.0 + d * 24.0
        case Hour(y, m, d, h) where (y > 0.0 && m > 0.0 && d > 0.0 && h > 0.0) => y * 365.0 * 24.0 + m * 30.0 * 24.0 +
            d * 24.0 + h
        case _ => 0.0
    }
    return 0
}
