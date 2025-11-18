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
 * Test API: public func body(body: Array<UInt8>): HttpResponseBuilder
 *           public func body(body: String): HttpResponseBuilder
 *           public func body(body: InputStream): HttpResponseBuilder
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
class Test_HttpResponseBuilder_Body_02 {
    func startserve(): Unit {
        // content-length = body.size
        var a: HttpRequestHandler = FuncHandler(
            {
                httpContext =>
                httpContext.responseBuilder.header("Content-Length", "1000")
                httpContext.responseBuilder.body(Array<UInt8>(1000, repeat: UInt8(10)))
            }
        )
        // content-length = body.size
        var b: HttpRequestHandler = FuncHandler(
            {
                httpContext =>
                httpContext.responseBuilder.header("Content-Length", "1000")
                httpContext.responseBuilder.body(String(Array<Rune>(1000, repeat: r'b')))
            }
        )
        // bodysize未知:content-length等于stream中字节数
        var c: HttpRequestHandler = FuncHandler(
            {
                httpContext =>
                var ins = ByteBuffer(10000)
                ins.write(Array<Byte>(2000, repeat: UInt8(2)))
                httpContext.responseBuilder.body(ins)
                httpContext.responseBuilder.header("Content-Length", "2000")
            }
        )
        server.distributor.register("/test/a", a)
        server.distributor.register("/test/b", b)
        server.distributor.register("/test/c", c)
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
        var req1 = HttpRequestBuilder().url("http://127.0.0.1:${port}/test/a").build()
        var req2 = HttpRequestBuilder().url("http://127.0.0.1:${port}/test/b").build()
        var req3 = HttpRequestBuilder().url("http://127.0.0.1:${port}/test/c").build()

        var client = ClientBuilder().build()
        var response1 = client.send(req1)
        var response2 = client.send(req2)
        var response3 = client.send(req3)
        @Expect(response1.status, UInt16(200))
        @Expect(response2.status, UInt16(200))
        @Expect(response3.status, UInt16(200))

        var buf1 = Array<UInt8>(10000, repeat: 0)
        var readlen1 = response1.body.read(buf1)
        @Expect(buf1[0..readlen1], Array<UInt8>(1000, repeat: 10))

        var buf2 = Array<UInt8>(10000, repeat: 0)
        var readlen2 = response2.body.read(buf2)
        @Expect(buf2[0..readlen2], Array<UInt8>(1000, repeat: 98))

        var buf3 = Array<UInt8>(10000, repeat: 0)
        var readlen3 = response3.body.read(buf3)
        @Expect(buf3[0..readlen3], Array<UInt8>(2000, repeat: 2))
        client.close()
        server.close()
    }
}
