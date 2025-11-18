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
import stdx.net.http.*
//import stdx.net.tls.common.*
import stdx.net.tls
//import stdx.crypto.kit
import std.math.*
import stdx.log.*
import stdx.logger.*
import std.console.Console

@Test
public class Test_maxRequestHeaderSize {
    @TestCase
    func default(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        @Expect(server.maxRequestHeaderSize, 8192)
        server.close()
    }

    @TestCase
    func max(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).maxRequestHeaderSize(Int64.Max).build()
        @Expect(server.maxRequestHeaderSize, Int64.Max)
        server.close()
    }

    @TestCase
    func zero(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).maxRequestHeaderSize(0).build()
        @Expect(server.maxRequestHeaderSize, 0)
        server.close()
    }

    @TestCase
    func negative(): Unit {
        var flag = false
        try {
            let _ = ServerBuilder().addr("127.0.0.1").port(0).maxRequestHeaderSize(-1).build()
        } catch (e: Exception) {
            flag = true
            @Expect(e.message.contains("Headers size shouldn't be negative"))
        }
        @Expect(flag, true)
    }

    @TestCase
    func oversize_http1(): Unit {
        var size = 92
        let server = ServerBuilder().addr("127.0.0.1").port(0).maxRequestHeaderSize(size).build()
        server.logger.level = LogLevel.TRACE

        server.distributor.register("/ss", {ctx => ctx.responseBuilder.header("hello", "value")})

        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let request1 = HttpRequestBuilder().url("http://127.0.0.1:${server.port}/ss").header("0", "0").build()

        let request2 = HttpRequestBuilder().url("http://127.0.0.1:${server.port}/ss").header("000000", "0").build()

        let client = ClientBuilder().build()

        let response1 = client.send(request1)
        let response2 = client.send(request2)
        @Expect(server.maxRequestHeaderSize, size)
        @Expect(response1.status, 200)
        @Expect(response2.status, 431)
        server.close()
    }
}
