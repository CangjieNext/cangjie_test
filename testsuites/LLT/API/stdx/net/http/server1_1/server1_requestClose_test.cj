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
 *          Test When an HTTP 1.1 request is sent with a connection: closed, the persistent connection is no longer maintained.
 *          The HTTP 1.0 request is not keep-alive connection
 * Test API:
 *       public func serve(): Unit
 */

package tests.server1_1

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
import stdx.net.tls

import std.net.TcpSocket

@Test
class TestServer1011Close {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16

    @TestCase
    func maxBodyTest(): Unit {
        startServer()
        sleep(Duration.second)
        port = server.port
        sendH11CloseRequest()
        sleep(Duration.millisecond * 100)
        sendH10CloseRequest()
        sleep(Duration.millisecond * 100)
        server.close()
    }

    func startServer() {
        server
            .distributor
            .register("/hello",
                {
                    httpContext => httpContext
                        .responseBuilder
                        .header("content-length", "5")
                        .header("hero", "GGBond")
                        .body("hello")
                })
        spawn {
            server.serve()
        }
    }

    func sendH11CloseRequest() {
        // connect
        var socket = TcpSocket("127.0.0.1", port)
        socket.connect()

        // write request and initial settings
        let request = "GET /hello HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nTransfer-encoding: chunked\r\nConnection: close\r\n\r\n10\r\ntest for chunked\r\n0\r\n\r\n"
            .toArray()
        socket.write(request)

        sleep(Duration.millisecond * 100)

        let arr = Array<UInt8>(1000, repeat: 0)
        let len = socket.read(arr)
        let resp = String.fromUtf8(arr.slice(0, len))

        @Expect(resp.contains("HTTP/1.1 200 OK\r\n"))
        @Expect(resp.contains("connection: close\r\n"))

        socket.close()
    }

    func sendH10CloseRequest() {
        // connect
        var socket = TcpSocket("127.0.0.1", port)
        socket.connect()

        // write request and initial settings
        let request = "GET /hello HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nTransfer-encoding: chunked\r\n\r\n10\r\ntest for chunked\r\n0\r\n\r\n"
            .toArray()
        socket.write(request)

        sleep(Duration.millisecond * 100)

        let arr = Array<UInt8>(1000, repeat: 0)
        let len = socket.read(arr)
        let resp = String.fromUtf8(arr.slice(0, len))

        @Expect(resp.contains("connection: keep-alive\r\n"))

        socket.close()
    }
}
