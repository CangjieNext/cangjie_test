/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../../../asan
// DEPENDENCE: ./../bodyReadUtil
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt bodyReadUtil/read.cj -o read.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle read.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

/*
 * Test description:
 *      Test Client1_1#receiveChunkedBody
 * Test API:
 *      public func request(request: HttpRequest): HttpResponse
 */
package tests.client1_1

import stdx.net.http.*
import {asan.*, bodyReadUtil.*}
import stdx.encoding.url.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import stdx.log.*

@Test
class TestClient1_1ReceiveChunkedBodyClearHeader {
    let serverSocket = TcpServerSocket(bindAt: 0)

    @TestCase
    func client1_1ReceiveChunkedBodyClearHeader(): Unit {
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.second)

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder().url(u).build()
        let response = client.send(r)
        @Expect(response.toString().contains("HTTP/1.1 200 OK\r\n"))
        @Expect(response.toString().contains("transfer-encoding: foo,chunked\r\n"))
        // read response body
        readAll(500, response)
        println(response.toString())
        @Expect(response.toString().contains("transfer-encoding: foo\r\n"))
        @Expect(response.toString().contains("content-length: 18\r\n"))

        let response2 = client.send(r)
        println(response2)
        try {
            readAll(500, response2)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message, "Trailer section can not contain raw CR.")
        }

        client.close()
        fut.get()
        serverSocket.close()
        println("ok")
        asanGC()
    }

    func serverPacketCapture() {
        serverSocket.bind()
        let server = serverSocket.accept()
        let buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 10)
        server.read(buf)
        server.write(
            "HTTP/1.1 200 ok\r\ntrailer: A, b\r\ntransfer-encoding: foo\r\ntransfer-encoding: chunked\r\n\r\n10\r\n1234567890123456\r\n2\r\n12\r\n0\r\na: 2\r\nb: 3\r\nc: 4\r\n\r\nHTTP/1.1 200 ok\r\nTrailer: A, b\r\nTransfer-Encoding: chunked\r\nconnection: close\r\n\r\n0\r\na: 2\r\nb: 3\r\r\nc: 4\r\n\r\n"
                .toArray())
        sleep(Duration.millisecond * 100)
        server.close()
    }
}

/* SCAN-IN
ok
 */
