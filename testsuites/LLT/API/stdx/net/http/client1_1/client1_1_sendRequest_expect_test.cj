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
class TestConnNodeSendRequestExpect {
    let serverSocket = TcpServerSocket(bindAt: 0)
    @TestCase
    func ConnNodeSendRequestExpect(): Unit {
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.millisecond * 100)
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder().url(u).header("expect", "100-continue,100-continue").build()
        try {
            client.send(r)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message, "Must not generate a 100-continue expectation in a request that does not include content.")
        }
        let r2 = HttpRequestBuilder().url(u).header("expect", "continue,100-continue").build()
        try {
            client.send(r2)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message, "The only expectation supported yet is 100-continue.")
        }
        // to server 1
        let r3 = HttpRequestBuilder().url(u).header("expect", "100-continue").body("hello".toArray()).build()
        try {
            client.send(r3)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message, "Too many 1xx responses.")
        }
        // to server 2
        client.send(r3)
        // to server 3
        let resp3 = client.send(r3)
        @Expect(resp3.toString(), "HTTP/1.1 204 No Content\r\nconnection: close\r\n\r\n")
        // to server 4
        client.send(r3)

        client.close()
        fut.get()
        println("send_request_expect_test")
        asanGC()
    }
    func serverPacketCapture() {
        serverSocket.bind()
        let buf = Array<UInt8>(500, repeat: 0)
        // server 1
        let server = serverSocket.accept()
        sleep(Duration.millisecond * 5)
        var i = server.read(buf)
        var read = String.fromUtf8(buf[0..i])
        @Expect(read.contains("hello"), false)
        server.write("HTTP/1.1 100 continue\r\n\r\n".toArray())
        // read body
        i = server.read(buf)
        read = String.fromUtf8(buf[0..i])
        @Expect(read, "hello")
        server.write("HTTP/1.1 100 continue\r\n\r\n".toArray())
        server.write("HTTP/1.1 100 continue\r\n\r\n".toArray())
        server.write("HTTP/1.1 100 continue\r\n\r\n".toArray())
        server.write("HTTP/1.1 100 continue\r\n\r\n".toArray())
        server.write("HTTP/1.1 100 continue\r\n\r\n".toArray())
        server.close()
        // server 2
        let server2 = serverSocket.accept()
        sleep(Duration.millisecond * 20)
        i = server2.read(buf)
        read = String.fromUtf8(buf[0..i])
        @Expect(read.contains("hello"), false)
        server2.write("HTTP/1.1 204 no content\r\nConnection: close\r\n\r\n".toArray())
        sleep(Duration.millisecond * 20)
        i = server2.read(buf)
        @Expect(i, 0)
        server2.close()
        // server 3
        let server3 = serverSocket.accept()
        sleep(Duration.millisecond * 20)
        i = server3.read(buf)
        read = String.fromUtf8(buf[0..i])
        @Expect(read.contains("hello"), false)
        server3.write("HTTP/1.1 100 continue\r\nconnection: close\r\n\r\n".toArray())
        sleep(Duration.millisecond * 20)
        i = server3.read(buf)
        read = String.fromUtf8(buf[0..i])
        @Expect(read, "hello")
        server3.write("HTTP/1.1 204 no content\r\nconnection: close\r\n\r\n".toArray())
        server3.close()
        // server 4
        let server4 = serverSocket.accept()
        sleep(Duration.millisecond * 20)
        i = server4.read(buf)
        read = String.fromUtf8(buf[0..i])
        @Expect(read.contains("hello"), false)
        // waiting for client to send body
        sleep(Duration.second)
        i = server4.read(buf)
        read = String.fromUtf8(buf[0..i])
        @Expect(read, "hello")
        server4.write("HTTP/1.1 204 no content\r\nconnection: close\r\n\r\n".toArray())
        server4.close()
        serverSocket.close()
    }
}

/* SCAN-IN
send_request_expect_test
 */
