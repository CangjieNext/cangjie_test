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
 *          Test user sends a response in chunked mode, the body and trailer are correct.
 * Test API:
 *       public func serve(): Unit
 */

package tests.server1_1

import stdx.net.http.*

import std.net.TcpSocket
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestServer11WriteChunked {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16
    let message = "hello"

    @TestCase
    func chunkTest(): Unit {
        startServer()
        sleep(Duration.second)
        port = server.port
        sendRequest1()
        sleep(Duration.millisecond * 100)
        sendRequest2()
        sleep(Duration.millisecond * 100)
        sendRequest3()
        sleep(Duration.second)
        server.close()
    }

    func startServer() {
        server
            .distributor
            .register("/hello",
                {
                    httpContext => httpContext.responseBuilder.header("transfer-encoding", "chunked").body("hello")
                })
        server
            .distributor
            .register("/bigBody",
                {
                    httpContext => httpContext
                        .responseBuilder
                        .header("transfer-encoding", "chunked")
                        .body("abcdefgh" * (1025))
                })
        server
            .distributor
            .register("/emptyTE",
                {
                    httpContext => httpContext.responseBuilder.header("transfer-encoding", ",").body("hello")
                })
        sleep(Duration.millisecond * 100)
        spawn {
            server.serve()
        }
    }

    func sendRequest1() {
        let client = TcpSocket("127.0.0.1", port)
        client.connect()

        let request = "GET /hello HTTP/1.0\r\nHost: 127.0.0.1:${port}\r\nContent-Length: 16\r\nConnection: close\r\nkeep-alive: timeout=1, max=1000\r\n\r\ntest head method"
            .toArray()
        client.write(request)
        sleep(Duration.millisecond * 400)

        let arr = Array<UInt8>(1000, repeat: 0)
        let len = client.read(arr)
        let resp = String.fromUtf8(arr.slice(0, len))
        let expect = "5\r\nhello\r\n0\r\n\r\n"

        @Expect(resp.contains("transfer-encoding: chunked"))
        @Expect(resp.contains("connection: close,transfer-encoding"))
        @Expect(resp.contains(expect))
        client.close()
    }

    func sendRequest2() {
        let client = TcpSocket("127.0.0.1", port)
        client.connect()

        let request = "GET /bigBody HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nContent-Length: 16\r\nConnection: close\r\n\r\ntest head method"
            .toArray()
        client.write(request)
        sleep(Duration.second)

        let arr = Array<UInt8>(100000, repeat: 0)

        var len = client.read(arr)
        var resp = ""
        while (len > 0) {
            resp += String.fromUtf8(arr.slice(0, len))
            len = client.read(arr)
        }

        sleep(Duration.second)

        @Expect(resp.contains("transfer-encoding: chunked"))
        @Expect(resp.contains("connection: close,transfer-encoding"))
        @Expect(resp.contains("2000"))
        @Expect(resp.contains("abcdefgh"*(1024)))
        @Expect(resp.contains("8"))
        client.close()
    }

    func sendRequest3() {
        let client = TcpSocket("127.0.0.1", port)
        client.connect()

        let request = "GET /emptyTE HTTP/1.0\r\nHost: 127.0.0.1:${port}\r\nContent-Length: 16\r\nConnection: close\r\nkeep-alive: timeout=1, max=1000\r\n\r\ntest head method"
            .toArray()
        client.write(request)
        sleep(Duration.millisecond * 400)

        let arr = Array<UInt8>(1000, repeat: 0)
        let len = client.read(arr)
        let resp = String.fromUtf8(arr.slice(0, len))

        @Expect(resp.contains("500 Internal Server Error"))
        client.close()
    }
}
