/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package  %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.net.*
import std.collection.*
import stdx.log.*
import stdx.logger.*
import std.console.Console
import stdx.net.http.*
import stdx.net.tls
import stdx.encoding.url.*

@Test
public class Test_connect {
    @TestCase
    func connect_success(): Unit {
        let s = ServerBuilder().addr("127.0.0.1").port(0).build()
        s
            .distributor
            .register(
                "",
                {
                    ctx =>
                    @Expect(ctx.request.method, "CONNECT")
                    ctx.responseBuilder.header("hello", "value")
                }
            )
        spawn {s.serve()}
        while (s.port == 0) {
            sleep(Duration.millisecond)
        }
        let client = ClientBuilder().build()
        let (res, conn) = client.connect("http://127.0.0.1:${s.port}/dd")
        @Expect(res.status, 200)
        @Expect(res.toString().contains("HTTP/1.1 200 OK"), true)
        @Expect(res.toString().contains("hello: value"), true)
        @Expect(res.toString().contains("connection: keep-alive"), true)
        conn?.close()

        let (res1, conn1) = client.connect("http://127.0.0.1:${s.port}/")
        @Expect(res1.status, 200)
        @Expect(res1.toString().contains("HTTP/1.1 200 OK"), true)
        @Expect(res1.toString().contains("hello: value"), true)
        @Expect(res1.toString().contains("connection: keep-alive"), true)
        conn1?.close()

        let (res2, conn2) = client.connect("http://127.0.0.1:${s.port}")
        @Expect(res2.status, 200)
        @Expect(res2.toString().contains("HTTP/1.1 200 OK"), true)
        @Expect(res2.toString().contains("hello: value"), true)
        @Expect(res2.toString().contains("connection: keep-alive"), true)
        conn2?.close()
        client.close()
        s.close()
    }

    @TestCase
    func connect_fail(): Unit {
        let s = ServerBuilder().addr("127.0.0.1").port(0).build()
        s.distributor.register("/dd", {ctx => ctx.responseBuilder.header("hello", "value")})
        spawn {s.serve()}
        while (s.port == 0) {
            sleep(Duration.millisecond)
        }
        let client = ClientBuilder().build()
        let (res, _) = client.connect("http://127.0.0.1:${s.port}/dd")
        @Expect(res.status, 404)
        @Expect(res.toString().contains("HTTP/1.1 404 Not Found"), true)
        client.close()
        s.close()
    }

    @TestCase
    func empty_url(): Unit {
        let client = ClientBuilder().build()
        try {
            client.connect("")
        } catch (e: Exception) {
            @Expect(e.message.contains("Not HTTP protocol scheme:"), true)
        }
        client.close()
    }

    @TestCase
    func wrong_url(): Unit {
        let s = ServerBuilder().addr("127.0.0.1").port(0).build()
        s.distributor.register("/dd", {ctx => ctx.responseBuilder.header("hello", "value")})
        spawn {s.serve()}
        while (s.port == 0) {
            sleep(Duration.millisecond)
        }
        let client = ClientBuilder().build()
        try {
            client.connect("http://127.0.0.1:${s.port}/wrong")
        } catch (e: Exception) {
            @Expect(e.message.contains("Not HTTP protocol scheme:"), true)
        }

        try {
            client.connect("\0")
            @Expect(1, 2)
        } catch (e: UrlSyntaxException) {
        }
        client.close()
        s.close()
    }
}
