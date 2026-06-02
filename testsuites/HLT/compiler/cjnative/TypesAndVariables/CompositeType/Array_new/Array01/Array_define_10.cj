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

var a1 = [r'a', r'b']

main(): Int64 {
    let score: Rune = r'a'
    var scoreResult: Array<Rune> = match (score) {
        case r'c' => [r'c', r'd']
        case r'g' | r'b' => [r'c', r'd']
        case r'a' => a1
        case _ => Array<Rune>()
    }
    if (scoreResult[0] == r'a' && scoreResult[1] == r'b') {
        return 0
    }
    return 1
}
