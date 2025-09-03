/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ../test.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output test.cj
// RUN-EXEC: %run_stdx %output %run_args

import std.io.*
import stdx.net.http.*
import stdx.net.tls.common.*
import stdx.net.tls
import stdx.crypto.kit
import std.collection.*
import std.net.*
import stdx.encoding.url.*
import std.runtime.*
import std.argopt.*

main(): Int64 {
    let server = serve()
    var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)
    let ck: Cookie = Cookie("abc", "123456")
    var arr: ArrayList<Cookie> = ArrayList<Cookie>.of(ck)
    var str1 = "http://127.0.0.1:${server.port}/dd"
    let url = URL.parse(str1)
    cookiejar.storeCookies(url, arr)
    let client = ClientBuilder().cookieJar(cookiejar).build()
    var a = client.get("http://127.0.0.1:${server.port}/dd")
    if (a.status != 200) {
        return 1
    }
    var cookiesFromJar = cookiejar.getCookies(URL.parse("http://127.0.0.1:${server.port}/dd"))
    if (CookieJar.toCookieString(cookiesFromJar) != "abc=123456") {
        return 2
    }

    return 0
}

func serve() {
    let serverSocket = TcpServerSocket(bindAt: 0)
    let server = ServerBuilder().listener(serverSocket).build()
    server.distributor.register(
        "/dd",
        {
            ctx =>
            ctx.responseBuilder.header("a", "a")
            ctx.responseBuilder.header("b", "b")
        }
    )
    spawn {
        server.serve()
    }
    while (server.port == 0) {
        sleep(Duration.millisecond)
    }
    return server
}
