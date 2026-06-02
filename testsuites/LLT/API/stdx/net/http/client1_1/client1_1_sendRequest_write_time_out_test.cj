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
class TestConnNodeSendRequestWriteTimeout {
    let serverSocket = TcpServerSocket(bindAt: 0)
    @TestCase
    func ConnNodeSendRequestWriteTimeOut(): Unit {
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.millisecond * 100)
        let client = ClientBuilder().writeTimeout(Duration.millisecond * 500).build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder().url(u).header("expect", "100-continue").body("hello".toArray()).build()
        // request1 time out and close the connection
        // conn will not be returned
        try {
            client.send(r)
            @Expect(false)
        } catch (e: HttpTimeoutException) {
            @Expect(e.message, "Client1.1 write request timeout and the connection is closed.")
        }

        // request2
        client.send(r)
        sleep(Duration.millisecond * 600)
        // request3 reuse the conn
        client.send(r)
        client.close()
        fut.get()
    }
    func serverPacketCapture() {
        serverSocket.bind()
        let buf = Array<UInt8>(500, repeat: 0)
        // server 1
        let server = serverSocket.accept()
        sleep(Duration.millisecond * 100)
        var i = server.read(buf)
        var read = String.fromUtf8(buf[0..i])
        sleep(Duration.millisecond * 500)
        server.write("HTTP/1.1 204 continue\r\n\r\n".toArray())
        server.close()
        // server 2
        let server2 = serverSocket.accept()
        sleep(Duration.millisecond * 100)
        i = server2.read(buf)
        read = String.fromUtf8(buf[0..i])
        server2.write("HTTP/1.1 100 continue\r\n\r\n".toArray())
        server2.write("HTTP/1.1 204 no content\r\n\r\n".toArray())
        // reuse conn
        server2.write("HTTP/1.1 204 no content\r\nconnection: close\r\n\r\n".toArray())
        sleep(Duration.millisecond * 1600)
        server2.close()
    }

    @TestCase
    func ConnNodeSendRequestWriteTimeOut2(): Unit {
        let fut = spawn {serverPacketCapture2()}
        sleep(Duration.millisecond * 100)
        let client = ClientBuilder().writeTimeout(Duration.millisecond * 500).build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        var r = HttpRequestBuilder()
            .url(u)
            .header("expect", "100-continue")
            .writeTimeout(Duration.millisecond * 100)
            .body("hello".toArray())
            .build()
        // request1 time out and close the connection
        // conn will not be returned
        try {
            client.send(r)
            @Expect(false)
        } catch (e: HttpTimeoutException) {
            @Expect(e.message, "Client1.1 write request timeout and the connection is closed.")
        }
        // request2
        r = HttpRequestBuilder().url(u).header("expect", "100-continue").body("hello".toArray()).build()
        client.send(r)
        // request3 reuse the conn
        try {
            client.send(r)
            @Expect(false)
        } catch (e: HttpTimeoutException) {
            @Expect(e.message, "Client1.1 write request timeout and the connection is closed.")
        }
        client.close()
        fut.get()
        println("send_request_write_time_out_test")
        asanGC()
    }
    func serverPacketCapture2() {
        let buf = Array<UInt8>(500, repeat: 0)
        // server 1
        let server = serverSocket.accept()
        sleep(Duration.millisecond * 100)
        var i = server.read(buf)
        var read = String.fromUtf8(buf[0..i])
        sleep(Duration.millisecond * 150)
        server.write("HTTP/1.1 204 continue\r\n\r\n".toArray())
        server.close()
        // server 2
        let server2 = serverSocket.accept()
        sleep(Duration.millisecond * 100)
        i = server2.read(buf)
        read = String.fromUtf8(buf[0..i])
        sleep(Duration.millisecond * 150)
        server2.write("HTTP/1.1 204 no content\r\n\r\n".toArray())
        // reuse conn
        sleep(Duration.millisecond * 550)
        server2.write("HTTP/1.1 204 no content\r\nconnection: close\r\n\r\n".toArray())
        server2.close()
        serverSocket.close()
    }
}

/* SCAN-IN
send_request_write_time_out_test
 */
