/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f

// ASSERT: scan scoreResult = excellent

var scoreResult: String = ""

main(): Int64 {
    let fut1: Future<Unit> = spawn {
        let score: Int64 = 90
        let PASS = 60
        let FULL = 100
        scoreResult = match (score) {
            case 0 => "zero"
            case 10 | 20 | 30 | 40 | 50 => "fail"
            case 60 => "pass"
            case 70 | 80 => "good"
            case 90 | 100 => "excellent" // matched
            case _ => "not a valid score"
        }
    }
    sleep(Duration.second);
    print("scoreResult = " + scoreResult)
    return 0
}
