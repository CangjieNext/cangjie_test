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
import std.time.*
import std.sync.*
import stdx.log.*
import std.io.*

@Test
class TestConnNodeSendRequestReadTimeout2 {
    let serverSocket = TcpServerSocket(bindAt: 0)
    @TestCase
    func ConnNodeSendRequestReadTimeOut(): Unit {
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.millisecond * 100)
        let client = ClientBuilder().readTimeout(Duration.millisecond * 100).build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        var r = HttpRequestBuilder().url(u).readTimeout(Duration.millisecond * 500).build()

        let resp1 = client.send(r)
        let buf = Array<UInt8>(500, repeat: 0)
        var i = resp1.body.read(buf)
        var read = String.fromUtf8(buf[..i])
        @Expect(read, "hello")

        r = HttpRequestBuilder().url(u).build()

        let resp2 = client.send(r)
        try {
            resp2.body.read(buf)
            @Expect(false)
        } catch (e: HttpTimeoutException) {
            @Expect(e.message, "Read body timeout and the connection is closed.")
        }

        r = HttpRequestBuilder().url(u).readTimeout(Duration.millisecond * 500).build()
        client.send(r)

        r = HttpRequestBuilder().url(u).build()
        try {
            client.send(r)
            @Expect(false)
        } catch (e: HttpTimeoutException) {
            @Expect(e.message, "Client1.1 read response timeout and the connection is closed.")
        }

        client.close()
        fut.get()
        println("send_request_read_time_out_test")
        asanGC()
    }
    func serverPacketCapture() {
        serverSocket.bind()
        let buf = Array<UInt8>(500, repeat: 0)
        // server 1
        let server = serverSocket.accept()
        sleep(Duration.millisecond * 100)
        server.read(buf)
        server.write("HTTP/1.1 200 ok\r\nContent-Length: 5\r\n\r\n".toArray())
        sleep(Duration.millisecond * 150)
        server.write("hello".toArray())
        server.read(buf)
        server.write("HTTP/1.1 200 ok\r\nContent-Length: 5\r\n\r\n".toArray())
        sleep(Duration.millisecond * 150)
        server.write("hello".toArray())
        server.close()

        let server2 = serverSocket.accept()
        sleep(Duration.millisecond * 150)
        server2.write("HTTP/1.1 204 ok\r\nconnection:close\r\n\r\n".toArray())

        let server3 = serverSocket.accept()
        sleep(Duration.millisecond * 150)
        server3.write("HTTP/1.1 204 ok\r\nconnection:close\r\n\r\n".toArray())

        serverSocket.close()
    }
}

/* SCAN-IN
send_request_read_time_out_test
 */
