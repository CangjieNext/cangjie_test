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
class Test_Chunk_01 {
    func startserve(): Unit {
        var a: HttpRequestHandler = FuncHandler(
            {
                httpContext =>
                let bodyBuf = Array<UInt8>(20000, repeat: 0)
                let allBody = ArrayList<UInt8>()
                var readLen = httpContext.request.body.read(bodyBuf)
                while (readLen > 0) {
                    allBody.add(all: bodyBuf[..readLen])
                    readLen = httpContext.request.body.read(bodyBuf)
                }
                @Expect(allBody.toArray().size, 16000)
            }
        )
        var b: HttpRequestHandler = FuncHandler(
            {
                httpContext =>
                let arr_16 = Array<UInt8>(16 * 1000, repeat: 13)
                httpContext.responseBuilder.body(arr_16)
                httpContext.responseBuilder.header("transfer-encoding", "chunked")
                httpContext.responseBuilder.header("Trailer", "12345")
                httpContext.responseBuilder.header("Trailer", "abcde")
                httpContext.responseBuilder.trailer("12345", "ssdlh")
                httpContext.responseBuilder.trailer("abcde", "wxyz")
            }
        )
        var c: HttpRequestHandler = FuncHandler(
            {
                httpContext =>
                let str = String(Array<Rune>(160000, repeat: r'b'))
                httpContext.responseBuilder.body(str)
                httpContext.responseBuilder.header("transfer-encoding", "chunked")
                httpContext.responseBuilder.header("Trailer", "12345")
                httpContext.responseBuilder.header("Trailer", "abcde")
                httpContext.responseBuilder.trailer("12345", "ssdlh")
                httpContext.responseBuilder.trailer("abcde", "wxyz")
            }
        )
        var d: HttpRequestHandler = FuncHandler(
            {
                httpContext =>
                var ins = ByteBuffer(100000)
                ins.write(Array<Byte>(20000, repeat: UInt8(2)))
                httpContext.responseBuilder.body(ins)
                httpContext.responseBuilder.header("transfer-encoding", "chunked")
                httpContext.responseBuilder.header("Trailer", "12345")
                httpContext.responseBuilder.header("Trailer", "abcde")
                httpContext.responseBuilder.trailer("12345", "ssdlh")
                httpContext.responseBuilder.trailer("abcde", "wxyz")
            }
        )
        server.distributor.register("/test/a", a)
        server.distributor.register("/test/b", b)
        server.distributor.register("/test/c", c)
        server.distributor.register("/test/d", d)
        server.serve()
    }

    // client发给server chunked body
    @TestCase
    func test_01(): Unit {
        // 此协程打开后一直开启
        spawn {
            startserve()
        }

        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        port = server.port
        var arr_16 = Array<UInt8>(16 * 1000, repeat: 14)
        var ins = ByteBuffer()
        ins.write(Array<Byte>(16000, repeat: 2))
        var req1 = HttpRequestBuilder()
            .url("http://127.0.0.1:${port}/test/a")
            .header("transfer-encoding", "chunked")
            .header("Trailer", "12345")
            .trailer("12345", "ssdlh")
            .body(arr_16)
            .build()
        var req2 = HttpRequestBuilder()
            .url("http://127.0.0.1:${port}/test/a")
            .header("transfer-encoding", "chunked")
            .header("Trailer", "12345")
            .trailer("12345", "444")
            .body(String(Array<Rune>(16000, repeat: r'a')))
            .build()
        var req3 = HttpRequestBuilder()
            .url("http://127.0.0.1:${port}/test/a")
            .header("transfer-encoding", "chunked")
            .header("Trailer", "12345")
            .trailer("12345", "333")
            .body(ins)
            .build()
        var client = ClientBuilder().build()
        var res1 = client.send(req1)
        @Expect(res1.status, 200)
        var res2 = client.send(req2)
        @Expect(res2.status, 200)
        var res3 = client.send(req3)
        @Expect(res3.status, 200)
        client.close()
    }

    // server发给client chunked body
    @TestCase
    func test_02(): Unit {
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        var req1 = HttpRequestBuilder().url("http://127.0.0.1:${port}/test/b").build()
        var req2 = HttpRequestBuilder().url("http://127.0.0.1:${port}/test/c").build()
        var req3 = HttpRequestBuilder().url("http://127.0.0.1:${port}/test/d").build()
        var arr_20 = Array<UInt8>(200000, repeat: 3)
        var client = ClientBuilder().build()
        var res1 = client.send(req1)
        @Expect(res1.status, 200)
        var readlen_1 = 0
        while (readlen_1 < 16000) {
            readlen_1 += res1.body.read(arr_20)
        }
        @Expect(readlen_1, 16000)

        var res2 = client.send(req2)
        @Expect(res2.status, 200)

        var readlen_2 = 0
        while (readlen_2 < 160000) {
            readlen_2 += res2.body.read(arr_20)
        }
        @Expect(readlen_2, 160000)

        var res3 = client.send(req3)
        @Expect(res3.status, 200)
        var readlen_3 = 0
        while (readlen_3 < 20000) {
            readlen_3 += res3.body.read(arr_20)
        }
        @Expect(readlen_3, 20000)
        client.close()
        server.close()
    }
}
