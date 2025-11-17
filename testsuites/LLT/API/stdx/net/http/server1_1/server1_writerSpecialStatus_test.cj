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
 *          Test invokes the write method of HttpResponseWriter for multiple times,
 *          the response is generated as multiple chunks.
 * Test API:
 *       public func write(buf: Array<Byte>): Unit
 */

package tests.server1_1

import stdx.net.http.*
import std.net.TcpSocket

@Test
class TestServer11WriterStatus {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16
    let message = "hello world"

    @TestCase
    func chunkTest(): Unit {
        startServer()
        sleep(Duration.millisecond * 500)
        port = server.port
        sendRequest1()
        sleep(Duration.millisecond * 100)
        sendRequest2()
        sleep(Duration.millisecond * 100)
        sendRequest3()
        sleep(Duration.millisecond * 100)
        server.close()
    }

    func startServer() {
        server
            .distributor
            .register(
                "/status1",
                {
                    httpContext =>
                    httpContext
                        .responseBuilder
                        .status(HttpStatusCode.STATUS_PROCESSING)
                        .header("transfer-encoding", "chunked")
                    let writer = HttpResponseWriter(httpContext)
                    try {
                        writer.write("hello".toArray())
                        @Expect(1, 2)
                    } catch (e: HttpException) {
                        @Expect(e.message, "The body is not allowed in this scenario.")
                    }
                }
            )
        server
            .distributor
            .register(
                "/status2",
                {
                    httpContext =>
                    httpContext
                        .responseBuilder
                        .status(HttpStatusCode.STATUS_NO_CONTENT)
                        .header("transfer-encoding", "chunked")
                    let writer = HttpResponseWriter(httpContext)
                    try {
                        writer.write("hello".toArray())
                        @Expect(1, 2)
                    } catch (e: HttpException) {
                        @Expect(e.message, "The body is not allowed in this scenario.")
                    }
                }
            )
        server
            .distributor
            .register(
                "/status3",
                {
                    httpContext =>
                    httpContext
                        .responseBuilder
                        .status(HttpStatusCode.STATUS_NOT_MODIFIED)
                        .header("transfer-encoding", "chunked")
                    let writer = HttpResponseWriter(httpContext)
                    try {
                        writer.write("hello".toArray())
                        @Expect(1, 2)
                    } catch (e: HttpException) {
                        @Expect(e.message, "The body is not allowed in this scenario.")
                    }
                }
            )
        sleep(Duration.millisecond * 100)
        spawn {
            server.serve()
        }
    }

    func sendRequest1() {
        // connect
        var socket = TcpSocket("127.0.0.1", port)
        socket.connect()

        // write preface and initial settings
        let preface = "GET /status1 HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nTransfer-encoding: chunked\r\nConnection: close\r\n\r\n10\r\ntest for chunked\r\n0\r\n\r\n"
            .toArray()
        socket.write(preface)

        sleep(Duration.millisecond * 300)

        socket.close()
    }

    func sendRequest2() {
        // connect
        var socket = TcpSocket("127.0.0.1", port)
        socket.connect()

        // write preface and initial settings
        let preface = "GET /status2 HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nTransfer-encoding: chunked\r\nConnection: close\r\n\r\n10\r\ntest for chunked\r\n0\r\n\r\n"
            .toArray()
        socket.write(preface)

        sleep(Duration.millisecond * 300)

        socket.close()
    }

    func sendRequest3() {
        // connect
        var socket = TcpSocket("127.0.0.1", port)
        socket.connect()

        // write preface and initial settings
        let preface = "GET /status3 HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nTransfer-encoding: chunked\r\nConnection: close\r\n\r\n10\r\ntest for chunked\r\n0\r\n\r\n"
            .toArray()
        socket.write(preface)

        sleep(Duration.millisecond * 300)

        socket.close()
    }
}
