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
var cookie = Cookie("0123456789", "0123456789", path: "/0123456789", domain: "examplenet.com", expires: time1, maxAge: 1,
    secure: true, httpOnly: true)
var cookie1 = Cookie("ABCDEFGHIJKLMNOPQRSTUVWXYZ", "ABCDEFGHIJKLMNOPQRSTUVWXYZ", path: "/ABCDEFGHIJKLMNOPQRSTUVWXYZ/",
    domain: "1examplenet.com", expires: time1, maxAge: 1, secure: true, httpOnly: true)
var cookie2 = Cookie("abcdefghijklmnopqrstuvwxyz", "abcdefghijklmnopqrstuvwxyz", path: "abcdefghijklmnopqrstuvwxyz",
    domain: ".goo-gle.com", expires: time1, maxAge: 1, secure: true, httpOnly: true)
var cookie3 = Cookie("!#$%&*+-.^_`|~", "!#$%&*+-.^_`|~'", path: "/!#$%&*+-.^_`|~'/", domain: "examplenet.com",
    expires: time1, maxAge: 1, secure: true, httpOnly: true)
var cookie4 = Cookie("!#$%&*+-.^_`|~", "()<>@:/[]?={}", path: "/\\()<>@:/[]?={}/", domain: ".goo-gle1.com",
    expires: time1, maxAge: 1, secure: true, httpOnly: true)

main(): Int64 {
    var a = cookie.toSetCookieString()
    var a1 = cookie1.toSetCookieString()
    var a2 = cookie2.toSetCookieString()
    var a3 = cookie3.toSetCookieString()
    var a4 = cookie4.toSetCookieString()

    if (a.contains(
        "0123456789=0123456789; Expires=Wed, 19 Jan 2022 00:00:00 UTC; Max-Age=1; Domain=examplenet.com; Path=/0123456789; Secure; HttpOnly") !=
        true) {
        return 1
    }

    if (a1.contains(
        "ABCDEFGHIJKLMNOPQRSTUVWXYZ=ABCDEFGHIJKLMNOPQRSTUVWXYZ; Expires=Wed, 19 Jan 2022 00:00:00 UTC; Max-Age=1; Domain=1examplenet.com; Path=/ABCDEFGHIJKLMNOPQRSTUVWXYZ/; Secure; HttpOnly") !=
        true) {
        return 2
    }

    if (a2.contains(
        "abcdefghijklmnopqrstuvwxyz=abcdefghijklmnopqrstuvwxyz; Expires=Wed, 19 Jan 2022 00:00:00 UTC; Max-Age=1; Domain=goo-gle.com; Path=abcdefghijklmnopqrstuvwxyz; Secure; HttpOnly") !=
        true) {
        return 3
    }

    if (a3.contains(
        "!#$%&*+-.^_`|~=!#$%&*+-.^_`|~'; Expires=Wed, 19 Jan 2022 00:00:00 UTC; Max-Age=1; Domain=examplenet.com; Path=/!#$%&*+-.^_`|~'/; Secure; HttpOnly") !=
        true) {
        return 4
    }

    if (a4.contains(
        "!#$%&*+-.^_`|~=()<>@:/[]?={}; Expires=Wed, 19 Jan 2022 00:00:00 UTC; Max-Age=1; Domain=goo-gle1.com; Path=/\\()<>@:/[]?={}/; Secure; HttpOnly") !=
        true) {
        return 5
    }
    return 0
}
