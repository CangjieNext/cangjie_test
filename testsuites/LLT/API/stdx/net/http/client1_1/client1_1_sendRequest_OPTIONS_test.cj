/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../../../asan
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

/*
 * Test description:
 *      Test ConnNode#sendRequest
 * Test API:
 *      func sendRequest(request: HttpRequest): HttpResponse
 */
package tests.client1_1

import stdx.net.http.*
import asan.*
import stdx.encoding.url.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import stdx.log.*
import std.io.*

@Test
class TestConnNodeSendRequestOPTIONS {
    let serverSocket = TcpServerSocket(bindAt: 0)
    @TestCase
    func ConnNodeSendRequestOPTIONS(): Unit {
        // start server
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.millisecond * 100)

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder().options().url(u).build()
        client.send(r)
        fut.get()
    }
    func serverPacketCapture() {
        serverSocket.bind()
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let server = serverSocket.accept()
        let buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 100)
        let i = server.read(buf)
        let read = String.fromUtf8(buf[0..i])
        println(read)
        @Expect(read.contains("OPTIONS /a HTTP/1.1\r\nhost: 127.0.0.1:${port}\r\n"))
        @Expect(read.contains("user-agent: CANGJIEUSERAGENT_1_1\r\n"))
        @Expect(read.contains("content-length: 0\r\n"))
        @Expect(read.contains("connection: keep-alive\r\n"))
        //
        server.write("HTTP/1.1 204 no content\r\nconnection: close\r\n\r\n".toArray())
        server.close()
    }

    @TestCase
    func ConnNodeSendRequestOPTIONS2(): Unit {
        // start server
        let fut = spawn {serverPacketCapture2()}
        sleep(Duration.millisecond * 100)

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}")
        let r = HttpRequestBuilder().options().url(u).build()
        client.send(r)
        fut.get()
        println("send_request_OPTIONS_test")
        asanGC()
    }
    func serverPacketCapture2() {
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let server = serverSocket.accept()
        let buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 100)
        let i = server.read(buf)
        let read = String.fromUtf8(buf[0..i])
        println(read)
        @Expect(read.contains("OPTIONS * HTTP/1.1\r\nhost: 127.0.0.1:${port}\r\n"))
        @Expect(read.contains("user-agent: CANGJIEUSERAGENT_1_1\r\n"))
        @Expect(read.contains("content-length: 0\r\n"))
        @Expect(read.contains("connection: keep-alive\r\n"))
        //
        server.write("HTTP/1.1 204 no content\r\nconnection: close\r\n\r\n".toArray())
        server.close()
        serverSocket.close()
    }
}

/* SCAN-IN
send_request_OPTIONS_test
 */
