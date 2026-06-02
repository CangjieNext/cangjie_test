/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt  %f -o %output
// RUN-EXEC: %run_stdx %output %run_args

import stdx.encoding.url.*

main(): Int64 {
    var i = "http://www.testnet.com?"
    var i1 = "http:other.example.com?"
    let s = URL.parse(i)
    let s1 = URL.parse(i)
    let s2 = URL.parse(i1)
    let s3 = URL.parse(i1)
    var d = s.toString()
    var d1 = s1.toString()
    var d2 = s2.toString()
    var d3 = s3.toString()
    if (d != "http://www.testnet.com?") {
        return 1
    }
    if (d1 != "http://www.testnet.com?") {
        return 2
    }
    if (d2 != "http:other.example.com?") {
        return 3
    }
    if (d3 != "http:other.example.com?") {
        return 4
    }
    if (s.rawQuery != "") {
        return 5
    }
    if (s1.rawQuery != "") {
        return 6
    }
    if (s2.rawQuery != "") {
        return 7
    }
    if (s3.rawQuery != "") {
        return 8
    }
    return 0
}
