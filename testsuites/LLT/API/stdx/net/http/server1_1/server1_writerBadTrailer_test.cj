/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

/*
 * Test description:
 *      Test class HttpResponseWriter
 *          If the value of the trailer set by the user in the handler is invalid, an HttpException is thrown.
 * Test API:
 *       public func write(buf: Array<Byte>): Unit
 */

package tests.server1_1

import stdx.net.http.*
import std.net.TcpSocket

@Test
class TestServer11WriterTrailer {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16
    let message = "hello world"

    @TestCase
    func chunkTest(): Unit {
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
                    httpContext.responseBuilder.header("trailer", "content-length") // 设置response头
                        .header("language", "English")
                    httpContext.responseBuilder.header("transfer-encoding", "chunked")
                    let writer = HttpResponseWriter(httpContext)
                    try {
                        writer.write("hello world".toArray())
                    } catch (e: HttpException) {
                        println(e.message)
                    }
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

        // write preface and initial settings
        let preface = "GET /hello HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nTransfer-encoding: chunked\r\nConnection: close\r\n\r\n10\r\ntest for chunked\r\n0\r\n\r\n"
            .toArray()
        socket.write(preface)

        sleep(Duration.millisecond * 300)

        let arr = Array<UInt8>(1000, repeat: 0)
        let len = socket.read(arr)
        let resp = String.fromUtf8(arr.slice(0, len))
        println(resp)

        socket.close()
    }
}

/* SCAN-IN
Malformed trailer field in header.
 */
