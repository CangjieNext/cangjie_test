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
import std.collection.*
import std.time.*
import stdx.encoding.url.*

var time1 = DateTime.of(year: 2022, month: January, dayOfMonth: 19)
var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)

main(): Int64 {
    let ck: Cookie = Cookie("0123456789", "0123456789")
    let ck1: Cookie = Cookie("q0123456789", "abc")
    var arr: ArrayList<Cookie> = ArrayList<Cookie>([ck])
    var arr1: ArrayList<Cookie> = ArrayList<Cookie>([ck1])
    var str = "http://example.cn/search/?vt=4"
    let url = URL.parse(str)
    var str1 = "http://example.cn/search/?vt=4"
    let url1 = URL.parse(str1)
    cookiejar.storeCookies(url, arr)
    cookiejar.storeCookies(url1, arr1)
    let arr2: ArrayList<Cookie> = cookiejar.getCookies(url)
    let arr3: ArrayList<Cookie> = cookiejar.getCookies(url1)
    if (CookieJar.toCookieString(arr2) != "0123456789=0123456789; q0123456789=abc") {
        return 1
    }
    if (CookieJar.toCookieString(arr3) != "0123456789=0123456789; q0123456789=abc") {
        return 2
    }
    return 0
}
