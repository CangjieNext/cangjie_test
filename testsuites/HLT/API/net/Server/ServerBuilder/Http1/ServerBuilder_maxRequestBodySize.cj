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
import stdx.net.tls.common.*
import stdx.net.tls
import stdx.crypto.kit
import std.math.*

@Test
public class Test_maxRequestBodySize {
    @TestCase
    func default(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        @Expect(server.maxRequestBodySize, 2 ** 21)
        server.close()
    }

    @TestCase
    func max(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).maxRequestBodySize(Int64.Max).build()
        @Expect(server.maxRequestBodySize, Int64.Max)
        server.close()
    }

    @TestCase
    func zero(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).maxRequestBodySize(0).build()
        @Expect(server.maxRequestBodySize, 0)
        server.close()
    }

    @TestCase
    func negative(): Unit {
        var flag = false
        try {
            let server = ServerBuilder().addr("127.0.0.1").port(0).maxRequestBodySize(-1).build()
        } catch (e: Exception) {
            flag = true
            @Expect(e.message.contains("Body size shouldn't be negative"))
        }
        @Expect(flag, true)
    }

    @TestCase
    func oversize_http1(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).maxRequestBodySize(1).build()

        server.distributor.register("/ss", {ctx => ctx.responseBuilder.header("hello", "value")})

        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let request1 = HttpRequestBuilder().url("http://127.0.0.1:${server.port}/ss").body("0").build()

        let request2 = HttpRequestBuilder().url("http://127.0.0.1:${server.port}/ss").body("00").build()

        let client = ClientBuilder().build()

        let response1 = client.send(request1)
        let response2 = client.send(request2)
        @Expect(server.maxRequestBodySize, 1)
        @Expect(response1.status, 200)
        @Expect(response2.status, 413)
        server.close()
    }
}
