/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output  %run_args

let score: Int64 = 10

class A {
    static var scoreResult: String = match (score) {
        case 10 | 20 | 30 | 40 | 50 => "fail"
        case _ => "not a valid score"
    }
}

main(): Int64 {
    if (A.scoreResult == "fail") {
        return 0
    } else {
        return 1
    }
}
