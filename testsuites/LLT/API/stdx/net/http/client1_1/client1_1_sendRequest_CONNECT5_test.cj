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
class TestConnNodeSendRequestCONNECT5 {
    let serverSocket = TcpServerSocket(bindAt: 0)
    @TestCase
    func ConnNodeSendRequestCONNECT5(): Unit {
        // start server
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.millisecond * 100)

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = "http://127.0.0.1:${port}/a"
        let buf = Array<UInt8>(500, repeat: 0)
        // connect
        let (resp, socket) = client.connect(u)

        var i = resp.body.read(buf)
        @Expect(i, 0)

        // another connection
        let resp2 = client.get(u)
        @Expect(resp2.toString().contains("HTTP/1.1 204 No Content"))
        // test socket
        client.close()
        socket?.write("hello, server".toArray())

        i = socket?.read(buf) ?? 0
        println(String.fromUtf8(buf[..i]))
        @Expect(String.fromUtf8(buf[..i]), "hello, client")
        socket?.close()

        fut.get()
        println("send_request_CONNECT4_body_test")
        client.close()
    }
    func serverPacketCapture() {
        serverSocket.bind()
        let server = serverSocket.accept()
        let buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 100)

        server.read(buf)
        server.write(
            "HTTP/1.1 200 content\r\nconnection: close\r\ncontent-length: 5\r\ntransfer-encoding: chunked\r\n\r\nhello, client"
                .toArray())

        // another connection
        let server2 = serverSocket.accept()
        server2.read(buf)
        server2.write("HTTP/1.1 204 content\r\nconnection: close\r\n\r\n".toArray())

        // test socket
        var i = server.read(buf)
        println(String.fromUtf8(buf[..i]))
        @Expect(String.fromUtf8(buf[..i]), "hello, server")

        server.close()
        server2.close()
        serverSocket.close()
    }
}

/* SCAN-IN
send_request_CONNECT4_body_test
 */
