/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../../../asan
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *
 * Test API:
 *
 */

package tests.client

import stdx.net.http.*
import stdx.log.*
import std.time.*
import std.sync.*
import stdx.encoding.url.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*
import asan.*

@Test
class TestClientCookie {
    var server = ServerBuilder().addr("127.0.0.1").port(0).build()

    @TestCase
    func testJar(): Unit {
        let client = ClientBuilder().cookieJar(MyCookieJar()).build()
        let jar = client.cookieJar.getOrThrow()
        @Expect(jar is MyCookieJar)
        client.close()
    }

    @TestCase
    func testCookie(): Unit {
        startServer()
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.OFF
        sleep(Duration.second)
        var resp = client.get("http://127.0.0.1:${server.port}/")
        @Expect(resp.status, 200)
        let url = URL.parse("http://127.0.0.1:${server.port}")
        let cookies = client.cookieJar?.getCookies(url) ?? ArrayList<Cookie>()
        @Assert(CookieJar.toCookieString(cookies), "a=b; c=d")
        resp = client.get("http://127.0.0.1:${server.port}/c")
        @Expect(resp.status, 200)
        client.close()
        server.close()
        asanGC()
    }

    func startServer() {
        server.logger.level = LogLevel.OFF
        server
            .distributor
            .register("/", {
                ctx => ctx.responseBuilder.header("Set-Cookie", "a=b").header("Set-Cookie", "c=d")
            })
        server
            .distributor
            .register("/c",
                {
                    ctx => if (let Some(v) <- ctx.request.headers.getFirst("cookie")) {
                        @Assert(v, "a=b; c=d")
                    } else {
                        throw Exception("")
                    }
                })
        spawn {
            server.serve()
        }
    }
}

class MyCookieJar <: CookieJar {
    public prop rejectPublicSuffixes: ArrayList<String> {
        get() {
            ArrayList<String>()
        }
    }
    public prop isHttp: Bool {
        get() {
            return true
        }
    }
    public func storeCookies(url: URL, cookies: ArrayList<Cookie>): Unit {
        ()
    }
    public func getCookies(url: URL): ArrayList<Cookie> {
        ArrayList<Cookie>()
    }
    public func removeCookies(domain: String): Unit {
        ()
    }
    public func clear(): Unit {
        ()
    }
}
