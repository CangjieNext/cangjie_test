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
 *      Test ConnNode#getTrailer
 * Test API:
 *      private func getTrailer(headers: HttpHeaders): HttpHeaders
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

@Test
class TestConnNodeGetTrailer {
    let serverSocket = TcpServerSocket(bindAt: 0)
    let monitor = Monitor()

    @TestCase
    func connNodeGetTrailer(): Unit {
        let fut = spawn {serverPacketCapture1()}
        sleep(Duration.millisecond * 100)

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder().url(u).build()

        let resp = client.send(r)

        let buf = Array<UInt8>(500, repeat: 0)
        let i = resp.body.read(buf)
        @Expect(String.fromUtf8(buf[..i]), "hello")

        let resp2 = client.send(r)
        let i2 = resp2.body.read(buf)
        @Expect(String.fromUtf8(buf[..i2]), "hello")
        @Expect(resp2.toString().contains("cc: 5\r\n"))

        try {
            client.send(r)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message, "Malformed trailer field in header.")
        }

        client.close()
        fut.get()
        println("get_trailer_test")
        asanGC()
    }

    func serverPacketCapture1() {
        serverSocket.bind()
        let server = serverSocket.accept()
        let buf = Array<UInt8>(500, repeat: 0)
        server.read(buf)
        server.write(
            "HTTP/1.1 200\r\nTransfer-Encoding: chunked\r\n\r\n5\r\nhello\r\n0\r\nContent-Length: 5\r\n\r\n".toArray())
        server.read(buf)
        server.write(
            "HTTP/1.1 200\r\nTrailer: cc\r\nTransfer-Encoding: chunked\r\n\r\n5\r\nhello\r\n0\r\nCC: 5\r\n\r\n"
                .toArray())
        server.read(buf)
        server.write(
            "HTTP/1.1 200\r\nTrailer: Content-Length\r\nConnection: close\r\nTransfer-Encoding: chunked\r\n\r\n5\r\nhello\r\n0\r\nContent-Length: 5\r\n\r\n"
                .toArray())
        server.close()
        serverSocket.close()
    }
}

/* SCAN-IN
get_trailer_test
 */
