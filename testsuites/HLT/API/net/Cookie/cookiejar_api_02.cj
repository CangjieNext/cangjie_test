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
    let ck: Cookie = Cookie("name", "value")
    var arr: ArrayList<Cookie> = ArrayList<Cookie>([ck])
    var str = "http://example.cn/search/?vt=4"
    var str1 = "http://1example.cn/search/?vt=4"
    let url = URL.parse(str)
    let url1 = URL.parse(str1)
    cookiejar.storeCookies(url, arr)
    cookiejar.storeCookies(url1, arr)
    var cookiesFromJar = cookiejar.getCookies(URL.parse("http://example.cn/search/?vt=4"))
    if (CookieJar.toCookieString(cookiesFromJar) != "name=value") {
        return 1
    }
    return 0
}
