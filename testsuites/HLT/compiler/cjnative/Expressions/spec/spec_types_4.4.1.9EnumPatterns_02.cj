/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum TimeUnit {
    | Year(Float32)
    | Month(Float32, Float32)
    | Day(Float32, Float32, Float32)
    | Hour(Float32, Float32, Float32, Float32)
}

main() {
    let oneYear = TimeUnit.Year(1.0)
    var howManyHours: Float32 = match (oneYear) {
        case Year(y) => y * 365.0 * 24.0 // matched
        case Month(y, m) => y * 365.0 * 24.0 + m * 30.0 * 24.0
    }
    return 0
}
// ASSERT: scan sema_nonexhuastive_patterns
