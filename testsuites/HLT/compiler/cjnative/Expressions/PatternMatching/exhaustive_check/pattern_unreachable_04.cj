/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

let score: Int64 = 90
let PASS = 60
let FULL = 100
var scoreResult: String = match (score) {
    case 0 => "zero"
    case 10 | 20 | 30 | 40 | 50 => "fail"
    case PASS => "pass"
    case 70 | 80 => "good"
    case FULL => "excellent" // matched
    case good => "excellent" // matched
    case good => "excellent" // unreachable
    case good => "excellent" // unreachable
}

main() {
    return 0
}
// ASSERT: scan sema_unreachable_pattern
