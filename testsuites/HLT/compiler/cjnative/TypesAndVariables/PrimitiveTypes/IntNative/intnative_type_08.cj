/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not iOS) EXEC: %compiler %cmp_opt %f -o %output
// (not iOS) RUN-EXEC: %run %run_opt %output %run_args

main(): IntNative {
    let score: IntNative = 100
    var scoreResult: String = match (score) {
        case 60 => "pass"
        case 70 | 80 => "good"
        case excellentScore => "excellent! score = ${excellentScore}"
        case _ => "invalid score"
    }
    if (scoreResult != "excellent! score = 100") {
        return 1
    }
    0
}
