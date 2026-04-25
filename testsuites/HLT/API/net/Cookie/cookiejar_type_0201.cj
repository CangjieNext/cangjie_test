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
import stdx.encoding.url.*

var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)

main(): Int64 {
    let ck: Cookie = Cookie("abc", "123456", path: "a1/b")
    var arr: ArrayList<Cookie> = ArrayList<Cookie>([ck])
    var str = "http://example.cn/search/?vt=4"
    let url = URL.parse(str)
    cookiejar.storeCookies(url, arr)
    let arr1: ArrayList<Cookie> = cookiejar.getCookies(url)
    if (arr1.size != 1) {
        return 1
    }
    if (CookieJar.toCookieString(arr) != "abc=123456") {
        return 2
    }
    return 0
}
