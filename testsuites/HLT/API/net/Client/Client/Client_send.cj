/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package  %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run_stdx %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan The content-length and transfer-encoding can not be set together.
// ASSERT: scan Wrote body size less than declared content-length.
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
import stdx.crypto.kit
import stdx.encoding.url.*

@Test
public class Test_send {
    @TestCase
    func send_success(): Unit {
        let serve = ServerBuilder().addr("127.0.0.1").port(0).build()
        serve
            .distributor
            .register(
                "/dd",
                {
                    ctx =>
                    @Expect(ctx.request.method, "GET")
                    ctx.responseBuilder.header("hello", "value").body("body").status(200)
                }
            )

        spawn {
            serve.serve()
        }
        while (serve.port == 0) {
            sleep(Duration.millisecond)
        }
        let request = HttpRequestBuilder().url("http://127.0.0.1:${serve.port}/dd").build()

        let client = ClientBuilder().build()

        let res = client.send(request)
        let buf = Array<UInt8>(15, repeat: 0)
        var len = res.body.read(buf)
        @Expect(res.status, 200)
        @Expect(res.toString().contains("HTTP/1.1 200 OK"), true)
        @Expect(res.toString().contains("hello: value"), true)
        @Expect(String.fromUtf8(buf[..len]), "body")
        serve.close()
        client.close()
    }

    @TestCase
    func wrong_url(): Unit {
        var flag = false
        let serve = ServerBuilder().addr("127.0.0.1").port(0).build()
        serve.distributor.register(
            "/dd",
            {ctx => ctx.responseBuilder.header("hello", "value").body("body").status(200)}
        )
        spawn {
            serve.serve()
        }
        while (serve.port == 0) {
            sleep(Duration.millisecond)
        }

        let request = HttpRequestBuilder().url("127.0.0.1").build()

        let client = ClientBuilder().build()

        try {
            let res = client.send(request)
        } catch (e: HttpException) {
            flag = true
            @Expect(e.message.contains("Not HTTP protocol scheme:"), true)
        }
        @Expect(flag, true)
    }

    @TestCase
    func send_body_with_ContentLength_and_TransferEncoding(): Unit {
        var flag = false
        let serve = ServerBuilder().addr("127.0.0.1").port(0).build()
        serve
            .distributor
            .register("/dd",
                {
                    ctx => ctx
                        .responseBuilder
                        .header("Transfer-Encoding", "chunked")
                        .header("Content-Length", "4")
                        .body("body")
                })
        spawn {
            serve.serve()
        }
        while (serve.port == 0) {
            sleep(Duration.millisecond)
        }

        let request = HttpRequestBuilder().url("http://127.0.0.1:${serve.port}/dd").build()

        let client = ClientBuilder().build()

        let res = client.send(request)
        @Expect(res.status == 500)
    }

    @TestCase
    func send_body_with_default_header(): Unit {
        let serve = ServerBuilder().addr("127.0.0.1").port(0).build()
        serve.distributor.register("/dd", {ctx => ctx.responseBuilder.body("body")})
        spawn {
            serve.serve()
        }
        while (serve.port == 0) {
            sleep(Duration.millisecond)
        }

        let request = HttpRequestBuilder().url("http://127.0.0.1:${serve.port}/dd").build()

        let client = ClientBuilder().build()

        let res = client.send(request)
        @Expect(res.toString().contains("content-length: 4"),true)
    }

    @TestCase
    func send_body_with_ContentLength_shorter(): Unit {
        let serve = ServerBuilder().addr("127.0.0.1").port(0).build()
        serve.distributor.register("/dd", {ctx => ctx.responseBuilder.header("content-length", "4").body("bodysize")})
        spawn {
            serve.serve()
        }
        while (serve.port == 0) {
            sleep(Duration.millisecond)
        }

        let request = HttpRequestBuilder().url("http://127.0.0.1:${serve.port}/dd").build()

        let client = ClientBuilder().build()

        let res = client.send(request)
        let buf = Array<UInt8>(15, repeat: 0)
        var len = res.body.read(buf)
        @Expect(res.status, 200)
        @Expect(res.toString().contains("HTTP/1.1 200 OK"), true)
        @Expect(res.toString().contains("content-length: 4"), true)
        @Expect(String.fromUtf8(buf[..len]), "body")
    }

    @TestCase
    func send_body_with_ContentLength_longger(): Unit {
        var flag = false
        let serve = ServerBuilder().addr("127.0.0.1").port(0).build()
        serve.distributor.register("/dd", {ctx => ctx.responseBuilder.header("content-length", "8").body("body")})
        spawn {
            serve.serve()
        }
        while (serve.port == 0) {
            sleep(Duration.millisecond)
        }

        let request = HttpRequestBuilder().url("http://127.0.0.1:${serve.port}/dd").build()

        let client = ClientBuilder().build()

        let res = client.send(request)
        @Expect(res.status == 500)
    }

    @TestCase
    func trace_with_body(): Unit {
        var flag = false
        let serve = ServerBuilder().addr("127.0.0.1").port(0).build()
        serve.distributor.register("/dd", {ctx => ctx.responseBuilder.body("body")})
        spawn {
            serve.serve()
        }
        while (serve.port == 0) {
            sleep(Duration.millisecond)
        }

        let request = HttpRequestBuilder()
            .url("http://127.0.0.1:${serve.port}/dd")
            .method("TRACE")
            .body("requestBody")
            .build()

        let client = ClientBuilder().build()

        try {
            let res = client.send(request)
        } catch (e: HttpException) {
            flag = true
            @Expect(e.message, "TRACE request can not contain content.")
        }
        @Expect(flag, true)
    }
}
