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

main(): Int64 {
    var result = match (50) {
        case 60 => "pass"
        case 70 | 80 => "good"
        case 90 | 100 => "excellent"
        case failScore =>
            let passNeed = 60 - failScore
            "failed with ${failScore}, and ${passNeed} need to pass"
    }
    if (result == "failed with 50, and 10 need to pass") {
        return 0
    }
    return 1
}
