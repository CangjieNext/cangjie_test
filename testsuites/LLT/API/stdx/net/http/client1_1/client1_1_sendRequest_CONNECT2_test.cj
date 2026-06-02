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
 *      Test ConnNode#sendRequest
 * Test API:
 *      func sendRequest(request: HttpRequest): HttpResponse
 */
package tests.client1_1

import stdx.net.http.*
import stdx.encoding.url.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import stdx.log.*
import std.io.*

@Test
class TestConnNodeSendRequestCONNECT2 {
    let serverSocket = TcpServerSocket(bindAt: 0)
    @TestCase
    func ConnNodeSendRequestCONNECT2(): Unit {
        // start server
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.millisecond * 100)

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = "http://127.0.0.1:${port}/a"
        let r = HttpRequestBuilder().connect().url(u).build()
        try {
            client.send(r)
        } catch (e: HttpException) {
            @Expect(e.message, "Please use connect method to send a CONNECT request.")
        }
        let u2 = "ws://127.0.0.1:${port}/a"
        try {
            client.connect(u2)
        } catch (e: HttpException) {
            @Expect(e.message.contains("Not HTTP protocol scheme: ws"))
        }
        let (resp, socket) = client.connect(u)
        @Expect(resp.toString(), "HTTP/1.1 200 OK\r\nconnection: close\r\n\r\n")
        // test socket
        client.close()
        socket?.write("hello, server".toArray())
        let buf = Array<UInt8>(500, repeat: 0)
        var i = socket?.read(buf) ?? 0
        println(String.fromUtf8(buf[..i]))
        @Expect(String.fromUtf8(buf[..i]), "hello, client")
        socket?.close()
        fut.get()
        println("send_request_CONNECT_body_test")
        client.close()
    }
    func serverPacketCapture() {
        serverSocket.bind()
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let server = serverSocket.accept()
        let buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 100)
        var i = server.read(buf)
        let read = String.fromUtf8(buf[..i])
        @Expect(read.contains("CONNECT 127.0.0.1:${port} HTTP/1.1\r\nhost: 127.0.0.1:${port}\r\n"))
        @Expect(read.contains("user-agent: CANGJIEUSERAGENT_1_1\r\n"))
        @Expect(read.contains("connection: keep-alive\r\n"))
        // response
        server.write(
            "HTTP/1.1 200 content\r\nconnection: close\r\ncontent-length: 5\r\ntransfer-encoding: chunked\r\n\r\n"
                .toArray())

        // test socket
        i = server.read(buf)
        println(String.fromUtf8(buf[..i]))
        @Expect(String.fromUtf8(buf[..i]), "hello, server")
        server.write("hello, client".toArray())

        server.close()
        serverSocket.close()
    }
}

/* SCAN-IN
send_request_CONNECT_body_test
 */
