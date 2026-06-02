/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

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
}

main() {
    return 0
}
// ASSERT: scan sema_nonexhuastive_patterns
