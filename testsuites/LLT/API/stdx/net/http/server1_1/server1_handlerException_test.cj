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
 *          Returns an internal server error response when an exception is thrown in the handler.
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
class TestServer11HandleException {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16

    @TestCase
    func receiveTest(): Unit {
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
            .register(
                "/hello",
                {
                    httpContext =>
                    httpContext.responseBuilder.header("content-length", "11").body("hello world")
                    throw Exception("this is a test Exception")
                }
            )
        sleep(Duration.millisecond * 100)
        spawn {
            server.serve()
        }
    }

    func sendRequest() {
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

        @Expect(resp.contains("HTTP/1.1 500 Internal Server Error\r\n"))
        @Expect(resp.contains("connection: close\r\n"))
        @Expect(resp.contains("date: "))
        @Expect(resp.contains("Internal Server Error"))

        socket.close()
    }
}
