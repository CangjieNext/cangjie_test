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
 *          Test when request has big trailers, server will send 400 response wo the client.
 * Test API:
 *       public func serve(): Unit
 */

package tests.server1_1

import stdx.net.http.*
import stdx.net.tls.*
import std.net.TcpSocket

@Test
class TestServer11BigTrailers {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16

    @TestCase
    func bigTrailersTest(): Unit {
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
            .register("/hello",
                {
                    httpContext => httpContext.responseBuilder.header("content-length", "11").body("hello world")
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

        // write preface and initial settings
        let preface = "GET /hello HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nTransfer-encoding: chunked\r\nConnection: close\r\n\r\n9\r\ntest for \r\n7\r\nchunked\r\n0\r\n"
            .toArray()
        socket.write(preface)
        socket.write(Array<UInt8>(8 * 1024 * 1000, repeat: 0))
        socket.write("\r\n".toArray())

        sleep(Duration.millisecond * 300)

        let arr = Array<UInt8>(1000, repeat: 0)
        let len = socket.read(arr)
        let resp = String.fromUtf8(arr.slice(0, len))
        @Expect(resp.contains("Invalid line"))

        socket.close()
    }
}
