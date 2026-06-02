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
var temp: Int64 = 1

func f1() {
    return temp + 0
}

main(): Int64 {
    var arr: Array<Int64> = []
    var scoreResult: String = ""

    try {
        arr[f1()] = 1
    } catch (_) {
        scoreResult = match (score) {
            case 10 | 20 | 30 | 40 | 50 where (score < 0) => "not a valid score"
            case 10 | 20 | 30 | 40 | 50 where (score > 0) => "fail"
            case _ => "not a valid score"
        }
    }

    if (scoreResult == "fail") {
        return 0
    } else {
        return 1
    }
}
