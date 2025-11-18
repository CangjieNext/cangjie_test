/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
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
import std.io.*

var port = UInt16(0)
var server = ServerBuilder().addr("127.0.0.1").port(0).build()

@Test
class Test_HttpRequestBuilder_Body_03 {
    func startserve(): Unit {
        server
            .distributor
            .register(
                "/test1000",
                {
                    httpContext =>
                    var bodyBuf = Array<UInt8>(30000, repeat: 0)
                    var ins1 = httpContext.request.body.read(bodyBuf)
                    // 读取到全部的数据流
                    @Expect(ins1, 2000)
                }
            )
        server.serve()
    }

    // 同时设置chunked 和 Content-Length
    @TestCase
    func test_body_01(): Unit {
        spawn {
            startserve()
        }

        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        var ins = ByteBuffer(10000)
        ins.write(Array<Byte>(2000, repeat: UInt8(2)))
        port = server.port
        var req1 = HttpRequestBuilder()
            .url("http://127.0.0.1:${port}/test1000")
            .header("content-length", "1000")
            .header("transfer-encoding", "chunked")
            .body(ins)
            .build()
        var req2 = HttpRequestBuilder()
            .url("http://127.0.0.1:${port}/test1000")
            .header("content-length", "1000")
            .header("transfer-encoding", "chunked")
            .body(Array<UInt8>(10, repeat: UInt8(10)))
            .build()
        var req3 = HttpRequestBuilder()
            .url("http://127.0.0.1:${port}/test1000")
            .header("content-length", "1000")
            .header("transfer-encoding", "chunked")
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
        try {
            client.send(req3)
            @Expect(1, 2)
        } catch (e: HttpException) {
        }
        client.close()
        server.close()
    }
}
