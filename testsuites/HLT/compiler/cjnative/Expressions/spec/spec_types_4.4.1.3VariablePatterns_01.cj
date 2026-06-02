/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    let score: Int64 = 90
    let PASS = 60
    let Full = 100
    let good = 70
    var scoreResult: String = match (score) {
        case PASS => "pass" // constant pattern
        case Full => "Full" // ok, but not recommend.
        case good => "good"
    }
    return 0
}
// ASSERT: scan sema_unreachable_pattern
// ASSERT: scan chir_dce_unused_variable
