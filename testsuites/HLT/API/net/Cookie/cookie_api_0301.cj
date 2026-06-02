/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %f -o %output
// RUN-EXEC: %run_stdx %output %run_args

import stdx.net.http.*
import std.time.*
import std.collection.*

var time1 = DateTime.ofUTC(year: 2022, month: January, dayOfMonth: 19)
var cookie = Cookie("hjA12", "", path: "/a1/", domain: ".examplenet.com", expires: time1, maxAge: 1, secure: true,
    httpOnly: true)

main(): Int64 {
    var a = cookie.toSetCookieString()
    println(a)
    if (a.contains("hjA12=; Expires=Wed, 19 Jan 2022 00:00:00 UTC;") != true) {
        return 1
    }
    if (a.contains("Max-Age=1; Domain=examplenet.com; Path=/a1/; Secure; HttpOnly") != true) {
        return 2
    }
    return 0
}
