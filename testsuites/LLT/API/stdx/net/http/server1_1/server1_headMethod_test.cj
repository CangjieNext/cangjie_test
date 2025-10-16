/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      Test class Server
 *          Test whether the response returned by the HEAD request meets the expectation.
 * Test API:
 *       public func serve(): Unit
 */

package tests.server1_1

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit

import std.net.TcpSocket
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestServer11HeadMethodTest {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16
    let message = "hello world"

    @TestCase
    func lessTest(): Unit {
        startServer()
        sleep(Duration.second)
        port = server.port
        sendRequest()
        sleep(Duration.millisecond * 100)
        server.close()
    }

    func startServer() {
        server
            .distributor
            .register("/hello", {
                httpContext => httpContext.responseBuilder.header("content-length", "11").body(message)
            })
        server.distributor.register("/empty", {_ => ()})
        server
            .distributor
            .register("/helloChunked",
                {
                    httpContext => httpContext
                        .responseBuilder
                        .header("transfer-encoding", "chunked")
                        .header("trailer", "bond")
                        .trailer("bond", "GG Bond")
                        .body(message)
                })
        server
            .distributor
            .register(
                "/helloWriter",
                {
                    httpContext =>
                    httpContext.responseBuilder.header("transfer-encoding", "chunked")
                    let writer = HttpResponseWriter(httpContext)
                    writer.write("hello world".toArray())
                }
            )
        sleep(Duration.millisecond * 100)
        spawn {
            server.serve()
        }
    }

    func sendRequest() {
        let client1 = TcpSocket("127.0.0.1", port)
        client1.connect()
        let request1 = "HEAD /hello HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nContent-Length: 16\r\nConnection: keep-alive\r\n\r\ntest head method"
            .toArray()
        client1.write(request1)
        sleep(Duration.millisecond * 300)

        let arr1 = Array<UInt8>(1000, repeat: 0)
        let len1 = client1.read(arr1)
        let resp1 = String.fromUtf8(arr1.slice(0, len1))
        @Expect(resp1.contains("content-length: 11"))
        @Expect(!resp1.contains("hello world"))

        let getRequest = "GET /hello HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nContent-Length: 16\r\nConnection: keep-alive\r\n\r\ntest head method"
            .toArray()
        client1.write(getRequest)
        sleep(Duration.millisecond * 300)

        let getArr = Array<UInt8>(1000, repeat: 0)
        let getLen = client1.read(getArr)
        let getResp = String.fromUtf8(getArr.slice(0, getLen))
        @Expect(getResp.contains("content-length: 11"))
        @Expect(getResp.contains("hello world"))
        client1.close()

        let client2 = TcpSocket("127.0.0.1", port)
        client2.connect()
        let request2 = "HEAD /empty HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nContent-Length: 16\r\nConnection: close\r\n\r\ntest head method"
            .toArray()
        client2.write(request2)
        sleep(Duration.millisecond * 300)
        let arr2 = Array<UInt8>(1000, repeat: 0)
        let len2 = client2.read(arr2)
        let resp2 = String.fromUtf8(arr2.slice(0, len2))
        @Expect(resp2.contains("content-length: 0"))
        client2.close()

        let client3 = TcpSocket("127.0.0.1", port)
        client3.connect()
        let request3 = "HEAD /helloChunked HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nContent-Length: 16\r\nConnection: keep-alive\r\n\r\ntest head method"
            .toArray()
        client3.write(request3)
        sleep(Duration.millisecond * 500)
        let arr3 = Array<UInt8>(1000, repeat: 0)
        let len3 = client3.read(arr3)
        let resp3 = String.fromUtf8(arr3.slice(0, len3))
        @Expect(resp3.contains("transfer-encoding: chunked"))
        @Expect(!resp3.contains("hello world"))
        @Expect(!resp3.contains("bond: GG Bond"))

        let getChunk = "GET /helloChunked HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nContent-Length: 16\r\nConnection: keep-alive\r\n\r\ntest head method"
            .toArray()
        client3.write(getChunk)
        sleep(Duration.millisecond * 300)
        let getChunkArr = Array<UInt8>(1000, repeat: 0)
        let getChunkLen = client3.read(getChunkArr)
        let getChunkResp = String.fromUtf8(getChunkArr.slice(0, getChunkLen))
        @Expect(getChunkResp.contains("transfer-encoding: chunked"))
        @Expect(getChunkResp.contains("hello world"))
        @Expect(getChunkResp.contains("bond: GG Bond"))
        client3.close()

        let client4 = TcpSocket("127.0.0.1", port)
        client4.connect()
        let request4 = "HEAD /helloWriter HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nContent-Length: 16\r\nConnection: keep-alive\r\n\r\ntest head method"
            .toArray()
        client4.write(request4)
        sleep(Duration.millisecond * 300)
        let arr4 = Array<UInt8>(1000, repeat: 0)
        let len4 = client4.read(arr4)
        let resp4 = String.fromUtf8(arr4.slice(0, len4))
        @Expect(resp4.contains("transfer-encoding: chunked"))
        @Expect(!resp4.contains("hello world"))
        @Expect(!resp4.contains("0\r\n"))

        let getWriter = "GET /helloWriter HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nContent-Length: 16\r\nConnection: keep-alive\r\n\r\ntest head method"
            .toArray()
        client4.write(getWriter)
        sleep(Duration.millisecond * 300)
        let getWriterArr = Array<UInt8>(1000, repeat: 0)
        let getWriterLen = client4.read(getWriterArr)
        let getWriterResp = String.fromUtf8(getWriterArr.slice(0, getWriterLen))
        @Expect(getWriterResp.contains("transfer-encoding: chunked"))
        @Expect(getWriterResp.contains("hello world"))
        client4.close()

        let client5 = TcpSocket("127.0.0.1", port)
        client5.connect()
        let request5 = "HEAD /not_find HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nContent-Length: 16\r\nConnection: close\r\n\r\ntest head method"
            .toArray()
        client5.write(request5)
        sleep(Duration.millisecond * 300)
        let arr5 = Array<UInt8>(1000, repeat: 0)
        let len5 = client5.read(arr5)
        let resp5 = String.fromUtf8(arr5.slice(0, len5))
        @Expect(resp5.contains("content-length: 13"))
        @Expect(resp5.contains("\r\n404 Not Found"))
        client5.close()
    }
}
