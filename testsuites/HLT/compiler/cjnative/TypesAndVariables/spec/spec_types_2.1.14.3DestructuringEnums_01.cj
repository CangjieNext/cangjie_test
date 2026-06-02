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

enum TimeUnit1 {
    Year | Month | Day | Hour
}

enum TimeUnit2 {
    | Year(Float32)
    | Month(Float32, Float32)
    | Day(Float32, Float32, Float32)
    | Hour(Float32, Float32, Float32, Float32)
}

main() {
    let time12 = TimeUnit1.Year
    let howManyHours: Int32 = match (time12) {
        case Year => 365 * 24 // matched
        case Month => 30 * 24
        case Day => 24
        case Hour => 1
    }
    let time13 = TimeUnit2.Month(1.0, 1.5)
    let howManyHours2: Float32 = match (time13) {
        case Year(y) => y * 365.0 * 24.0
        case Month(y, m) => y * 365.0 * 24.0 + m * 30.0 * 24.0 // matched
        case Day(y, m, d) => y * 365.0 * 24.0 + m * 30.0 * 24.0 + d * 24.0
        case Hour(y, m, d, h) => y * 365.0 * 24.0 + m * 30.0 * 24.0 + d * 24.0 + h
    }

    return 0
}
