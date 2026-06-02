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

func getResultParse<T>(f: (String) -> Option<T>, arg: String, default: T): T {
    var parse = f(arg)
    var res = matchResult<T>(parse, default)
    return res
}

func matchResult<T>(x: Option<T>, default: T): T {
    var result = match (x) {
        case Some(x) => x
        case None => default
    }
    return result
}

main(): Int64 {
    var str1 = """
123"""
    var str2 = #"123"#
    var a = Int8.tryParse(str1)
    var b = Int8.tryParse(str2)
    var c = Int8.tryParse("""
123""")
    var d = Int8.tryParse(#"123"#)

    var res1 = matchResult<Int8>(a, 0)
    var res2 = matchResult<Int8>(b, 0)
    var res3 = matchResult<Int8>(c, 0)
    var res4 = matchResult<Int8>(d, 0)
    if (res1 == 123 && res2 == 123 && res3 == 123 && res4 == 123) {
        return 0
    }
    return 1
}
