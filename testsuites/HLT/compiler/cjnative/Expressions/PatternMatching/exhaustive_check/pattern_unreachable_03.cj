/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

let score: Int32 = 90
let PASS: Int32 = 60
let FULL: Int32 = 100
var scoreResult: String = match (score) {
    case 0 => "zero"
    case 10 | 20 | 30 | 40 | 50 => "fail"
    case 60 => "pass"
    case 70 | 80 => "good"
    case 90 | 100 => "excellent" // matched
    case 70 | 20 => "good" //unreachable
    case 50 | 100 => "good" //unreachable
    case 70 | 80 => "good" //unreachable
    case 70 | 80 => "good" //unreachable
    case 70 | 80 => "good" //unreachable
    case _ => "good" //unreachable
    case _ => "good" //unreachable
}

main() {
    return 0
}
// ASSERT: scan sema_unreachable_pattern
