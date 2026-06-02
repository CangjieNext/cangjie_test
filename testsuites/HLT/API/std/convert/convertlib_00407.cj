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

import std.convert.*

func matchResult<T>(x: Option<T>, default: T): T {
    var result = match (x) {
        case Some(x) => x
        case None => default
    }
    return result
}

main(): Int64 {
    var str1 = "r'1'r'2'"
    var a = Rune.tryParse("r'3'r'4'")
    var b = Rune.tryParse(str1)

    var res1 = matchResult<Rune>(a, r'-')
    var res2 = matchResult<Rune>(b, r'-')

    if (res1 == r'-' && res2 == r'-') {
        return 0
    }
    return 1
}
