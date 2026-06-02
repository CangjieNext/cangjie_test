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
    var str1 = "True"
    var str2 = "False"
    var a = Bool.tryParse("TRUE")
    var b = Bool.tryParse(str1)
    var c = Bool.tryParse(str2)

    var res1 = matchResult<Bool>(a, false)
    var res2 = matchResult<Bool>(b, false)
    var res3 = matchResult<Bool>(c, false)

    if (!res1 && !res2 && !res3) {
        return 0
    }
    return 1
}
