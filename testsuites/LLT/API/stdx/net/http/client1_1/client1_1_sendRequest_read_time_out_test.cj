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
class TestConnNodeSendRequestReadTimeout {
    let serverSocket = TcpServerSocket(bindAt: 0)
    @TestCase
    func requestSetTimeOut(): Unit {
        let u = URL.parse("http://127.0.0.1:88/a")
        let r = HttpRequestBuilder()
            .readTimeout(Duration.second * (-1))
            .writeTimeout(Duration.second * (-1))
            .url(u)
            .build()
        @Expect(r.readTimeout.toString(), "Some(0s)")
        @Expect(r.writeTimeout.toString(), "Some(0s)")
    }

    @TestCase
    func ConnNodeSendRequestReadTimeOut(): Unit {
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.millisecond * 100)
        let client = ClientBuilder().readTimeout(Duration.millisecond * 500).build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder().url(u).build()

        let resp1 = client.send(r)
        let buf = Array<UInt8>(500, repeat: 0)
        var i = resp1.body.read(buf)
        var read = String.fromUtf8(buf[..i])
        @Expect(read, "hello")
        // request2 reuse conn
        sleep(Duration.millisecond * 600)
        let resp2 = client.send(r)
        @Expect(resp2.toString(), "HTTP/1.1 200 OK\r\ncontent-length: 6\r\n\r\nbody size: 6\r\n")
        sleep(Duration.millisecond * 600)
        try {
            resp2.body.read(buf)
            @Expect(false)
        } catch (e: HttpTimeoutException) {
            @Expect(e.message, "Read body timeout and the connection is closed.")
        }

        // request3
        sleep(Duration.millisecond * 1000)
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
        server.write("HTTP/1.1 200 ok\r\ncontent-length: 5\r\n\r\nhello".toArray())
        server.read(buf)
        server.write("HTTP/1.1 200 ok\r\ncontent-length: 6\r\n\r\n".toArray())
        sleep(Duration.millisecond * 500)
        server.close()
        // server 2
        let server2 = serverSocket.accept()
        sleep(Duration.millisecond * 100)
        server2.read(buf)
        sleep(Duration.millisecond * 500)
        server2.close()
        serverSocket.close()
    }
}

/* SCAN-IN
send_request_read_time_out_test
 */
