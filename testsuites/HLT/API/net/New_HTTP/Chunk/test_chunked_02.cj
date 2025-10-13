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
import std.io.*
import std.net.*

var port = UInt16(0)
var server = ServerBuilder().addr("127.0.0.1").port(0).build()

// server 向 client 发 chunked body, body 部分以 8 * 1024 分开发送
@Test
class Test_Chunk_02 {
    func startserve(): Unit {
        var a: HttpRequestHandler = FuncHandler(
            {
                httpContext =>
                var ins = ByteBuffer(100000)
                ins.write(Array<Byte>(5 * 8 * 1024, repeat: 30))
                httpContext.responseBuilder.body(ins)
                httpContext.responseBuilder.header("transfer-encoding", "chunked")
                httpContext.responseBuilder.header("Trailer", "12345")
                httpContext.responseBuilder.header("Trailer", "abcde")
                httpContext.responseBuilder.trailer("12345", "ssdlh")
                httpContext.responseBuilder.trailer("abcde", "wxyz")
            }
        )
        var b: HttpRequestHandler = FuncHandler(
            {
                httpContext =>
                let arr_16 = Array<UInt8>(5 * 8 * 1024, repeat: 31)
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
                let str = String(Array<Rune>(5 * 8 * 1024, repeat: r'b'))
                httpContext.responseBuilder.body(str)
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
        server.serve()
    }

    // server发给client chunked body
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
        var str1 = "GET /test/a HTTP/1.1\r\nhost: 127.0.0.1:${port}\r\n\r\n"
        var buf = Array<Byte>(6 * 8 * 1024, repeat: 0)

        var client = TcpSocket("127.0.0.1", port)
        client.connect()
        client.write(str1.toArray())
        var readsum = 0
        var count = 0
        while (readsum < 5 * 8 * 1024 + 5) {
            var readlen1 = client.read(buf)
            var readbuf = String.fromUtf8(buf[0..readlen1])
            readsum += readlen1
            count += 1
        }
        @Expect(readsum >= 5 * 8 * 1024)
        @Expect(count >= 1, true)
        client.close()
    }

    // server发给client chunked body
    @TestCase
    func test_02(): Unit {
        var str1 = "GET /test/b HTTP/1.1\r\nhost: 127.0.0.1:${port}\r\n\r\n"
        var buf = Array<Byte>(6 * 8 * 1024, repeat: 0)
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        var client = TcpSocket("127.0.0.1", port)
        client.connect()
        client.write(str1.toArray())
        var readsum = 0
        var count = 0
        while (readsum < 5 * 8 * 1024 + 5) {
            var readlen1 = client.read(buf)
            var readbuf = String.fromUtf8(buf[0..readlen1])
            readsum += readlen1
            count += 1
        }
        @Expect(readsum >= 5 * 8 * 1024)
        @Expect(count >= 1, true)
        client.close()
    }

    // server发给client chunked body
    @TestCase
    func test_03(): Unit {
        var str1 = "GET /test/c HTTP/1.1\r\nhost: 127.0.0.1:${port}\r\n\r\n"
        var buf = Array<Byte>(6 * 8 * 1024, repeat: 0)
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        var client = TcpSocket("127.0.0.1", port)
        client.connect()
        client.write(str1.toArray())
        var readsum = 0
        var count = 0
        while (readsum < 5 * 8 * 1024 + 5) {
            var readlen1 = client.read(buf)
            var readbuf = String.fromUtf8(buf[0..readlen1])
            readsum += readlen1
            count += 1
        }
        @Expect(readsum >= 5 * 8 * 1024)
        @Expect(count >= 1, true)
        client.close()
        server.close()
    }
}
