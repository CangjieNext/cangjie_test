/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

type int = (Int32)

interface I {
    prop i: int {
        get() {
            var a: int = 90
            return a
        }
    }
}

extend int <: I {}

main(): Int64 {
    var score: int = Int32(1).i
    var scoreResult: String = match (score) {
        case 10 | 20 | 30 | 40 | 50 => "fail"
        case 60 => "pass"
        case 70 | 80 => "good"
        case 90 | 100 => "excellent"
        case _ => "invalid"
    }
    if (scoreResult == "excellent") {
        return 0
    } else {
        return 1
    }
}
