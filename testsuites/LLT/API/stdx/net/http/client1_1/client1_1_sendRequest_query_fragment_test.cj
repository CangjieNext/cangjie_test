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
class TestConnNodeSendRequestQueryFragment {
    let serverSocket = TcpServerSocket(bindAt: 0)
    @TestCase
    func ConnNodeSendRequestQueryFragment(): Unit {
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.millisecond * 100)
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a?a#22")
        let r = HttpRequestBuilder().url(u).build()

        client.send(r)
        //
        let u2 = URL.parse("http://127.0.0.1:${port}/a?a#")
        let r2 = HttpRequestBuilder().url(u2).build()

        client.send(r2)
        //
        let u3 = URL.parse("http://127.0.0.1:${port}/a?#a")
        let r3 = HttpRequestBuilder().url(u3).build()

        client.send(r3)

        client.close()
        fut.get()
        println("send_request_query_fragment_test")
        asanGC()
    }
    func serverPacketCapture() {
        serverSocket.bind()
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let buf = Array<UInt8>(500, repeat: 0)
        // server1
        let server = serverSocket.accept()

        sleep(Duration.millisecond * 100)
        var i = server.read(buf)
        var read = String.fromUtf8(buf[0..i])
        @Expect(read.contains("GET /a?a#22 HTTP/1.1\r\nhost: 127.0.0.1:${port}\r\n"))
        @Expect(read.contains("user-agent: CANGJIEUSERAGENT_1_1\r\n"))
        @Expect(read.contains("content-length: 0\r\n"))
        @Expect(read.contains("connection: keep-alive\r\n"))
        server.write("HTTP/1.1 204 no content\r\nconnection: close\r\n\r\n".toArray())
        server.close()

        // server2
        let server2 = serverSocket.accept()
        sleep(Duration.millisecond * 100)
        i = server2.read(buf)
        read = String.fromUtf8(buf[0..i])
        @Expect(read.contains("GET /a?a# HTTP/1.1\r\nhost: 127.0.0.1:${port}\r\n"))
        server2.write("HTTP/1.1 204 no content\r\nconnection: close\r\n\r\n".toArray())
        server2.close()

        // server3
        let server3 = serverSocket.accept()
        sleep(Duration.millisecond * 100)
        i = server3.read(buf)
        read = String.fromUtf8(buf[0..i])
        @Expect(read.contains("GET /a?#a HTTP/1.1\r\nhost: 127.0.0.1:${port}\r\n"))
        server3.write("HTTP/1.1 204 no content\r\nconnection: close\r\n\r\n".toArray())
        server3.close()
        serverSocket.close()
    }
}

/* SCAN-IN
send_request_query_fragment_test
 */
