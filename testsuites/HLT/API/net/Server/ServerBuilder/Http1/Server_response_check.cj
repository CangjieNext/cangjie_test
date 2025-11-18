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
//import stdx.net.tls.common.*
import stdx.net.tls
//import stdx.crypto.kit

@Test
public class Test_response_check {
    @TestCase
    func request_response_rule_2(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server.distributor.register("/dd", {ctx => ctx.responseBuilder.body("hello")})

        let client = ClientBuilder().build()

        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let request1 = HttpRequestBuilder()
            .header("connection", "close")
            .url("http://127.0.0.1:${server.port}/dd")
            .build()

        let response1 = client.send(request1)
        @Expect(response1.toString().contains("connection: close"), true)
    }

    @TestCase
    func request_response_rule_4(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server.distributor.register(
            "/dd",
            {ctx => ctx.responseBuilder.header("date", " Mon, 19 Jun 2023 08:58:19 GMT")}
        )

        let client = ClientBuilder().build()

        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let request1 = HttpRequestBuilder()
            .header("connection", "close")
            .url("http://127.0.0.1:${server.port}/dd")
            .build()

        let response1 = client.send(request1)
        @Expect(!response1.toString().contains("date: Mon, 19 Jun 2023 08:58:19 GMT"))
    }

    @TestCase
    func request_response_rule_5(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server.distributor.register("/dd", {ctx => ctx.responseBuilder.body("hello")})

        let client = ClientBuilder().build()

        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let request1 = HttpRequestBuilder().method("HEAD").url("http://127.0.0.1:${server.port}/dd").build()

        let response1 = client.send(request1)
        let buf = Array<UInt8>(15, repeat: 0)
        let len = response1.body.read(buf)
        @Expect(!String.fromUtf8(buf).contains("hello"))
    }
}
