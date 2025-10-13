/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.net.http.*
import stdx.net.tls.common.*
import stdx.net.tls
import stdx.crypto.kit
import std.time.*
import std.sync.*
import std.collection.*

var port = UInt16(0)
var server = ServerBuilder().addr("127.0.0.1").port(0).build()
var server1 = ServerBuilder().addr("127.0.0.1").port(0).build()
var server2 = ServerBuilder().addr("127.0.0.1").port(0).build()
var server3 = ServerBuilder().addr("127.0.0.1").port(0).build()

@Test
class Test_Content_Length_Conflict_01 {
    func startserve(): Unit {
        server.distributor.register("/test1000", {
            httpContext => httpContext.request.body.read(Array<Byte>())
        })
        server.serve()
    }

    func startserve1(): Unit {
        server1
            .distributor
            .register(
                "/illegal01",
                {
                    httpContext =>
                    httpContext.responseBuilder.header("transfer-encoding", "chunked")
                    httpContext.responseBuilder.header("content-length", "10")
                    httpContext.responseBuilder.body("abcdefgIII")
                }
            )
        server1.serve()
    }

    func startserve2(): Unit {
        server2
            .distributor
            .register(
                "/illegal02",
                {
                    httpContext =>
                    httpContext.responseBuilder.header("content-length", "a")
                    httpContext.responseBuilder.body("abcdefgIII")
                }
            )
        server2.serve()
    }

    func startserve3(): Unit {
        server3
            .distributor
            .register(
                "/illegal03",
                {
                    httpContext =>
                    httpContext.responseBuilder.header("content-length", "8")
                    httpContext.responseBuilder.header("content-length", "10")
                    httpContext.responseBuilder.body("abcdefgIII")
                }
            )
        server3.serve()
    }

    // h1：客户端发非法content-length
    @TestCase
    func test_01(): Unit {
        spawn {
            startserve()
        }

        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        port = server.port

        var header = HttpHeaders()
        header.set("Content-Length", "1000")
        header.set("Content-Length", "2000")
        var req1 = HttpRequestBuilder()
            .url("https://127.0.0.1:${port}/test1000")
            .header("Content-Length", "1000")
            .header("Content-Length", "123abc")
            .body(Array<UInt8>(1000, repeat: UInt8(10)))
            .build()
        var req2 = HttpRequestBuilder()
            .addHeaders(header)
            .url("https://127.0.0.1:${port}/test1000")
            .body(String(Array<Rune>(1000, repeat: r'b')))
            .build()
        var req3 = HttpRequestBuilder()
            .url("https://127.0.0.1:${port}/test1000")
            .header("Content-Length", "abc")
            .body(Array<UInt8>(1000, repeat: UInt8(10)))
            .build()
        var req4 = HttpRequestBuilder()
            .url("https://127.0.0.1:${port}/test1000")
            .header("Content-Length", "1000")
            .header("Transfer-Encoding", "chunked")
            .body(Array<UInt8>(1000, repeat: UInt8(10)))
            .build()
        var client = ClientBuilder().build()
        try {
            client.send(req1)
            @Expect(1, 2)
        } catch (e: HttpException) {
        }
        try {
            client.send(req2)
            @Expect(1, 2)
        } catch (e: HttpException) {
        }
        try {
            client.send(req3)
            @Expect(1, 2)
        } catch (e: HttpException) {
        }
        try {
            client.send(req4)
            @Expect(1, 2)
        } catch (e: HttpException) {
        }
        client.close()
        server.close()
    }

    // h1：服务端发非法content-length
    @TestCase
    func test_02(): Unit {
        spawn {
            startserve1()
        }

        while (server1.port == 0) {
            sleep(Duration.millisecond)
        }
        port = server1.port
        var req1 = HttpRequestBuilder().url("http://127.0.0.1:${port}/illegal01").build()
        var client = ClientBuilder().build()
        try {
            client.send(req1)
        } catch (e: Exception) {}
        client.close()
        server1.close()
    }

    // h1：服务端发非法content-length
    @TestCase
    func test_03(): Unit {
        spawn {
            startserve2()
        }

        while (server2.port == 0) {
            sleep(Duration.millisecond)
        }
        port = server2.port
        var req1 = HttpRequestBuilder().url("http://127.0.0.1:${port}/illegal02").build()
        var client = ClientBuilder().build()
        try {
            client.send(req1)
        } catch (e: Exception) {}
        client.close()
        server2.close()
    }

    // h1：服务端发非法content-length
    @TestCase
    func test_04(): Unit {
        spawn {
            startserve3()
        }

        while (server3.port == 0) {
            sleep(Duration.millisecond)
        }
        port = server3.port
        var req1 = HttpRequestBuilder().url("http://127.0.0.1:${port}/illegal03").build()
        var client = ClientBuilder().build()
        try {
            client.send(req1)
        } catch (e: Exception) {}
        client.close()
        server3.close()
    }
}
