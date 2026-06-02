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
    Month
    | Year(Int64)
}

enum Time {
    Month
    | Year(String)
}

main() {
    var a1 = Year(8)
    var b = match (a1) {
        case TimeUnit.Month => 3
        case Time.Year(_) => 4
    }
    return 1
}
// ASSERT: scan sema_pattern_not_match
