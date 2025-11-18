/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.net.*
import std.collection.*
import stdx.net.http.*
import stdx.net.tls
//import stdx.crypto.kit
import stdx.encoding.url.*

@Test
public class Test_CookieJar {
    @TestCase
    func default(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server.distributor.register("/dd", {ctx => ctx.responseBuilder.header("a", "a")})
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)

        let client = ClientBuilder().cookieJar(cookiejar).build()
        var a = client.get("http://127.0.0.1:${server.port}/dd")
        @Expect(a.status,200)
        var cookiesFromJar = cookiejar.getCookies(URL.parse("http://127.0.0.1:${server.port}/dd"))
        @Expect(CookieJar.toCookieString(cookiesFromJar), "")
    }

    @TestCase
    func set_cookiejar(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server.distributor.register("/dd", {ctx => ctx.responseBuilder.header("a", "a")})
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)
        let ck: Cookie = Cookie("abc", "123456")
        var arr: ArrayList<Cookie> = ArrayList<Cookie>.of(ck)
        var str1 = "http://127.0.0.1:${server.port}/dd"
        let url = URL.parse(str1)
        cookiejar.storeCookies(url, arr)

        let client = ClientBuilder().cookieJar(cookiejar).build()
        var a = client.get("http://127.0.0.1:${server.port}/dd")
        @Expect(a.status,200)
        var cookiesFromJar = cookiejar.getCookies(URL.parse("http://127.0.0.1:${server.port}/dd"))
        @Expect(CookieJar.toCookieString(cookiesFromJar), "abc=123456")
    }
}
