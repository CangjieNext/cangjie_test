/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum TimeUnit {
    | Year(Float32)
    | Month(Float32, Float32)
    | Day(Float32, Float32, Float32)
    | Hour(Float32, Float32, Float32, Float32)
    | AA
    | BB
}

let oneYear = TimeUnit.Year(1.0)
var howManyHours: Float32 = match (oneYear) {
    case Year(y) => 1.0
    case Month(y, m) => 2.0
    case Day(y, m, d) => 3.0
    case Day(y, m, d) => 3.0
    case Hour(y, m, d, a) => 3.0
    case AA => 4.0
    case AA => 4.0
    case BB => 4.1
    case BB => 4.1
    case _ => 4.1
}

main() {
    return 0
}
// ASSERT: scan sema_unreachable_pattern
