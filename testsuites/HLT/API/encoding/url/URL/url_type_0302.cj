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
    var i = "http://[fe80::1%25en0]:8080"
    var i1 = "http://[fe80::1%25%65%6e%301-._~]"
    var i2 = "http://[fe80::1]"
    var i3 = "http://[2001:DB8:0:23:8:800:200C:417A]:8080/foo"
    let s = URL.parse(i)
    let s1 = URL.parse(i1)
    let s2 = URL.parse(i2)
    let s3 = URL.parse(i3)
    var d = s.toString()
    var d1 = s1.toString()
    var d2 = s2.toString()
    var d3 = s3.toString()
    println(d)
    println(d1)
    println(d2)
    println(d3)
    if (d != "http://[fe80::1%25en0]:8080") {
        return 1
    }
    if (d1 != "http://[fe80::1%25en01-._~]") {
        return 2
    }
    if (d2 != "http://[fe80::1]") {
        return 3
    }
    if (d3 != "http://[2001:DB8:0:23:8:800:200C:417A]:8080/foo".toAsciiLower()) {
        return 4
    }
    return 0
}
