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
 *      Test ConnNode#getTrailer
 * Test API:
 *      private func getTrailer(headers: HttpHeaders): HttpHeaders
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
class TestConnNodeGetTrailer2 {
    let serverSocket = TcpServerSocket(bindAt: 0)
    let monitor = Monitor()

    @TestCase
    func connNodeGetTrailer2(): Unit {
        let fut = spawn {serverPacketCapture1()}
        sleep(Duration.millisecond * 100)

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder().url(u).build()

        let buf = Array<UInt8>(2, repeat: 0)
        var resp = client.send(r)
        var i = resp.body.read(buf)
        @Expect(String.fromUtf8(buf[..i]), "he")
        try {
            readAll(1, resp)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message.contains("Invalid field line"))
        }

        resp = client.send(r)
        try {
            readAll(5, resp)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message.contains("Invalid field line"))
        }

        resp = client.send(r)
        try {
            readAll(5, resp)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message.contains("Invalid field line"))
        }

        client.close()
        fut.get()
        println("get_trailer2_test")
        asanGC()
    }

    func serverPacketCapture1() {
        serverSocket.bind()
        let server = serverSocket.accept()
        let buf = Array<UInt8>(500, repeat: 0)
        server.read(buf)
        server.write("HTTP/1.1 200\r\nTransfer-Encoding: chunked\r\n\r\n5\r\nhello\r\n0\r\ntrailer\r\n\r\n".toArray())

        let server2 = serverSocket.accept()
        server2.read(buf)
        server2.write(
            "HTTP/1.1 200\r\nTransfer-Encoding: chunked\r\n\r\n5\r\nhello\r\n0\r\ntra;iler: 4\r\n\r\n".toArray())

        let server3 = serverSocket.accept()
        server3.read(buf)
        server3.write(
            "HTTP/1.1 200\r\nTransfer-Encoding: chunked\r\n\r\n5\r\nhello\r\n0\r\ntrailer: 4\04\r\n\r\n".toArray())
        serverSocket.close()
    }
}

/* SCAN-IN
get_trailer2_test
 */
