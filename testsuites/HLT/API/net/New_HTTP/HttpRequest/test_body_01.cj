/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

/*
 * Test description: Test body function
 * Test API: public func body(body: Array<UInt8>): HttpRequestBuilder
 *           public func body(body: String): HttpRequestBuilder
 *           public func body(body: InputStream): HttpRequestBuilder
 */

import stdx.net.http.*
//import stdx.net.tls.common.*
import stdx.net.tls
//import stdx.crypto.kit
import std.time.*
import std.sync.*
import std.collection.*

var port = UInt16(0)
var server = ServerBuilder().addr("127.0.0.1").port(0).build()

@Test
class Test_HttpRequestBuilder_Body_01 {
    func startserve(): Unit {
        server
            .distributor
            .register(
                "/test1000",
                {
                    httpContext =>
                    let bodyBuf = Array<UInt8>(10, repeat: 0)
                    let allBody = ArrayList<UInt8>()
                    var readLen = httpContext.request.body.read(bodyBuf)
                    while (readLen > 0) {
                        allBody.add(all: bodyBuf[..readLen])
                        readLen = httpContext.request.body.read(bodyBuf)
                    }
                    @Expect(allBody.toArray().size, 1000)
                }
            )
        server.serve()
    }

    // 长度关系：content-length = body长度
    @TestCase
    func test_body_01(): Unit {
        spawn {
            startserve()
        }

        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        port = server.port
        var req1 = HttpRequestBuilder()
            .url("http://127.0.0.1:${port}/test1000")
            .header("Content-Length", "1000")
            .body(Array<UInt8>(1000, repeat: UInt8(10)))
            .build()
        var req2 = HttpRequestBuilder()
            .url("http://127.0.0.1:${port}/test1000")
            .body(Array<UInt8>(1000, repeat: UInt8(10))) //不设置content-length
            .build()
        var req3 = HttpRequestBuilder()
            .header("Content-Length", "1000")
            .url("http://127.0.0.1:${port}/test1000")
            .body(String(Array<Rune>(1000, repeat: r'b')))
            .build()
        var req4 = HttpRequestBuilder()
            .url("http://127.0.0.1:${port}/test1000")
            .body(String(Array<Rune>(1000, repeat: r'b'))) //不设置content-length
            .build()
        var client = ClientBuilder().build()
        var response1 = client.send(req1)
        var response2 = client.send(req2)
        var response3 = client.send(req3)
        var response4 = client.send(req4)
        @Expect(response1.status, UInt16(200))
        @Expect(response2.status, UInt16(200))
        @Expect(response3.status, UInt16(200))
        @Expect(response4.status, UInt16(200))
        client.close()
    }

    // 长度关系：content-length > body长度
    @TestCase
    func test_body_02(): Unit {
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        var req1 = HttpRequestBuilder()
            .url("http://127.0.0.1:${port}/test000")
            .header("Content-Length", "2000")
            .body(Array<UInt8>(1000, repeat: UInt8(10)))
            .build()
        var req2 = HttpRequestBuilder()
            .header("Content-Length", "2000")
            .url("http://127.0.0.1:${port}/test1000")
            .body(String(Array<Rune>(1000, repeat: r'b')))
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
        client.close()
    }

    // 长度关系：content-length < body长度
    @TestCase
    func test_body_03(): Unit {
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        var req1 = HttpRequestBuilder()
            .url("http://127.0.0.1:${port}/test1000")
            .header("Content-Length", "1000")
            .body(Array<UInt8>(2000, repeat: UInt8(10)))
            .build()
        var req2 = HttpRequestBuilder()
            .header("Content-Length", "1000")
            .url("http://127.0.0.1:${port}/test1000")
            .body(String(Array<Rune>(10000, repeat: r'b')))
            .build()
        var client = ClientBuilder().build()
        var response1 = client.send(req1)
        var response2 = client.send(req2)
        @Expect(response1.status, UInt16(200))
        @Expect(response2.status, UInt16(200))
        client.close()
        server.close()
    }
}
