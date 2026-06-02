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
 *      Test Client1_1#Reuse connection.
 * Test API:
 *      public func request(request: HttpRequest): HttpResponse
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
class TestClient1_1returnConn {
    let serverSocket = TcpServerSocket(bindAt: 0)

    @TestCase
    func client1_1returnConn(): Unit {
        let fut = spawn {serverPacketCapture1()}
        sleep(Duration.millisecond * 100)

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder().url(u).header("host", "huawei.com").build()
        for (_ in 0..10) {
            client.send(r)
        }
        // close the connection
        let rClose = HttpRequestBuilder().url(u).header("connection", "close").build()
        client.send(rClose)
        sleep(Duration.millisecond * 100)
        serverSocket.close()
        client.close()
        fut.get()
        println("ok")
        asanGC()
    }

    func serverPacketCapture1() {
        serverSocket.bind()
        try {
            var server = serverSocket.accept()
            var buf = Array<UInt8>(500, repeat: 0)
            var i = 0
            var req = ""
            do {
                i = server.read(buf)
                req = String.fromUtf8(buf[0..i])
                server.write("HTTP/1.1 204 ok\r\n\r\n".toArray())
            } while (!req.contains("connection: close\r\n"))
            server.close()
        } catch (e: SocketException) {
            @Expect(e.message, "Socket is already closed")
        }
    }
}

/* SCAN-IN
ok
 */
