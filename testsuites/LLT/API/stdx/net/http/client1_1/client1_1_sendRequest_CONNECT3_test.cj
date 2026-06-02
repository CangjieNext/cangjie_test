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
class TestConnNodeSendRequestCONNECT3 {
    let serverSocket = TcpServerSocket(bindAt: 0)
    @TestCase
    func ConnNodeSendRequestCONNECT3(): Unit {
        // start server
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.millisecond * 100)

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = "http://127.0.0.1:${port}/a"
        let buf = Array<UInt8>(500, repeat: 0)
        // connect but not 2xx
        let (resp, socket) = client.connect(u)
        @Expect(resp.toString().contains("HTTP/1.1 400 Bad Request"))
        if (let Some(_) <- socket) {
            @Expect(1, 2)
        }
        // another connect but 3xx
        let (resp2, socket2) = client.connect(u)
        @Expect(resp2.toString().contains("HTTP/1.1 308 Permanent Redirect"))
        if (let Some(_) <- socket2) {
            @Expect(1, 2)
        }
        // another connet 2xx
        let (resp3, socket3) = client.connect(u)
        var i = resp.body.read(buf)
        println(String.fromUtf8(buf[..i]))
        @Expect(String.fromUtf8(buf[..i]), "BAD")
        i = resp2.body.read(buf)
        println(String.fromUtf8(buf[..i]))
        @Expect(String.fromUtf8(buf[..i]), "REDIRECT")
        i = resp3.body.read(buf)
        @Expect(i, 0)
        // test socket
        client.close()
        socket3?.write("hello, server".toArray())

        i = socket3?.read(buf) ?? 0
        println(String.fromUtf8(buf[..i]))
        @Expect(String.fromUtf8(buf[..i]), "hello, client")
        socket3?.close()

        fut.get()
        println("send_request_CONNECT3_body_test")
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
        server.write("HTTP/1.1 400 content\r\nconnection: close\r\ncontent-length: 3\r\n\r\nBAD".toArray())

        // anther connection
        let server2 = serverSocket.accept()
        server2.read(buf)
        server2.write("HTTP/1.1 308 content\r\nconnection: close\r\ncontent-length: 8\r\n\r\nREDIRECT".toArray())

        // anther connection
        let server3 = serverSocket.accept()
        server3.read(buf)
        server3.write(
            "HTTP/1.1 200 content\r\nconnection: close\r\ncontent-length: 5\r\ntransfer-encoding: chunked\r\n\r\nhello, client"
                .toArray())
        // test socket
        i = server3.read(buf)
        println(String.fromUtf8(buf[..i]))
        @Expect(String.fromUtf8(buf[..i]), "hello, server")

        server.close()
        server2.close()
        server3.close()

        serverSocket.close()
    }
}

/* SCAN-IN
send_request_CONNECT3_body_test
 */
