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
 *      Test ConnNode#readHeaders
 * Test API:
 *      private func readHeaders(): HttpHeaders
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
class TestConnNodeReadHeaders {
    let serverSocket = TcpServerSocket(bindAt: 0)
    let monitor = Monitor()

    @TestCase
    func connNodeReadHeaders(): Unit {
        let fut = spawn {serverPacketCapture1()}
        sleep(Duration.millisecond * 100)

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder().url(u).build()
        try {
            client.send(r)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message.contains("Invalid field line"))
        }
        try {
            client.send(r)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message.contains("Invalid field line"))
        }

        client.close()
        fut.get()
        println("read_headers_test")
        asanGC()
    }

    func serverPacketCapture1() {
        serverSocket.bind()
        let server = serverSocket.accept()
        let buf = Array<UInt8>(500, repeat: 0)
        server.read(buf)
        server.write("HTTP/1.1 200\r\nConnectionkeep-alive\r\n\r\n".toArray())
        server.close()

        let server2 = serverSocket.accept()
        server2.read(buf)
        server2.write("HTTP/1.1 200\r\nConn;ection: keep-alive\r\n\r\n".toArray())
        server2.close()

        serverSocket.close()
    }
}

/* SCAN-IN
read_headers_test
 */
