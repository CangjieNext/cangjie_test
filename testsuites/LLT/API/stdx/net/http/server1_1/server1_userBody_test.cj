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
 *          Test when responsewrote body size less than declared content-length, logger will records the exception.
 * Test API:
 *       public func serve(): Unit
 */

package tests.server1_1

import stdx.net.http.*

import std.net.TcpSocket
import std.io.InputStream

@Test
class TestServer11userBody {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16

    @TestCase
    func moreTest(): Unit {
        startServer()
        sleep(Duration.millisecond * 500)
        port = server.port
        sendRequest()
        sleep(Duration.millisecond * 100)
        server.close()
    }

    func startServer() {
        server
            .distributor
            .register("/userbodytest",
                {
                    httpContext => httpContext.responseBuilder.header("content-length", "45").body(HttpBodyImpl())
                })
        server
            .distributor
            .register("/userchunktest",
                {
                    httpContext => httpContext
                        .responseBuilder
                        .header("transfer-encoding", "chunked") // 设置response头
                        .header("Trailer", "bond")
                        .body(HttpBodyImpl())
                        .trailer("bond", "GG BOND")
                })
        server
            .distributor
            .register("/emptybodytest",
                {
                    httpContext => httpContext
                        .responseBuilder
                        .header("transfer-encoding", "chunked") // 设置response头
                        .header("Trailer", "bond")
                        .trailer("bond", "GG BOND")
                })
        sleep(Duration.millisecond * 100)
        spawn {
            server.serve()
        }
    }

    func sendRequest() {
        // connect
        var socket = TcpSocket("127.0.0.1", port)
        socket.connect()

        let request1 = "GET /userbodytest HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nTransfer-encoding: chunked\r\nConnection: keep-alive\r\n\r\n10\r\ntest for chunked\r\n0\r\n\r\n"
            .toArray()
        socket.write(request1)

        sleep(Duration.millisecond * 300)

        let arr1 = Array<UInt8>(1000, repeat: 0)
        let len1 = socket.read(arr1)
        let resp1 = String.fromUtf8(arr1.slice(0, len1))

        @Expect(resp1.contains("012345678"*5))
        sleep(Duration.millisecond * 500)

        let request2 = "GET /userchunktest HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nTransfer-encoding: chunked\r\nConnection: keep-alive\r\n\r\n10\r\ntest for chunked\r\n0\r\n\r\n"
            .toArray()
        socket.write(request2)

        sleep(Duration.millisecond * 300)

        let arr2 = Array<UInt8>(1000, repeat: 0)
        let len2 = socket.read(arr2)
        let resp2 = String.fromUtf8(arr2.slice(0, len2))

        @Expect(resp2.contains("012345678"*5))
        @Expect(resp2.contains("bond: GG BOND"))

        let request3 = "GET /emptybodytest HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nTransfer-encoding: chunked\r\nConnection: keep-alive\r\n\r\n10\r\ntest for chunked\r\n0\r\n\r\n"
            .toArray()
        socket.write(request3)

        sleep(Duration.millisecond * 300)

        let arr3 = Array<UInt8>(1000, repeat: 0)
        let len3 = socket.read(arr3)
        let resp3 = String.fromUtf8(arr3.slice(0, len3))
        @Expect(resp3.contains("0\r\n"))
        @Expect(resp3.contains("bond: GG BOND"))

        socket.close()
    }
}

class HttpBodyImpl <: InputStream {
    let buffer: Array<Byte>
    init() {
        let builder = StringBuilder()
        for (_ in 0..5) {
            builder.append("012345678")
        }
        let size = builder.size
        buffer = unsafe { builder.toString().rawData().slice(0, size) }
    }

    var point = 0
    public func read(buf: Array<Byte>): Int64 {
        if (point == buffer.size) {
            return 0
        }
        if ((point + buf.size) > buffer.size) {
            buf[0..(buffer.size - point)] = buffer[point..buffer.size]
            var last = (buffer.size - point)
            point += last
            return last
        }
        buf[0..buf.size] = buffer[point..point + buf.size]
        point += buf.size
        return buf.size
    }
}
