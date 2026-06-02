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
import std.convert.*

func matchResult<T>(x: Option<T>, default: T): T {
    var result = match (x) {
        case Some(x) => x
        case None => default
    }
    return result
}

main(): Int64 {
    var str1 = "'a'"
    var str2 = "'仓'"
    var a = Rune.tryParse("'\n'")
    var b = Rune.tryParse(str1)
    var c = Rune.tryParse(str2)
    var d = Rune.tryParse("'\u{200}'")
    var e = Rune.tryParse("'3'")
    var f = Rune.tryParse("'\''")
    var g = Rune.tryParse("'@'")
    var h = Rune.tryParse("'/'")
    var i = Rune.tryParse("' '")

    var res1 = matchResult<Rune>(a, r'-')
    var res2 = matchResult<Rune>(b, r'-')
    var res3 = matchResult<Rune>(c, r'-')
    var res4 = matchResult<Rune>(d, r'-')
    var res5 = matchResult<Rune>(e, r'-')
    var res6 = matchResult<Rune>(f, r'-')
    var res7 = matchResult<Rune>(g, r'-')
    var res8 = matchResult<Rune>(h, r'-')
    var res9 = matchResult<Rune>(i, r'-')

    if (res1 == r'\n' && res2 == r'a' && res3 == r'仓' && res4 == r'\u{200}' && res5 == r'3' && res6 == r'\'' && res7 ==
        r'@' && res8 == r'/' && res9 == r' ') {
        return 0
    }
    return 1
}
