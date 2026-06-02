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
 *      Test Client1_1#reuseConn
 * Test API:
 *      public func request(request: HttpRequest): HttpResponse
 */
package tests.client1_1

import stdx.net.http.*
import asan.*
import stdx.encoding.url.*
import std.net.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*
import std.sync.*
import std.time.*
import stdx.log.*
import std.io.*

@Test
class TestClient1_1ReuseConn {
    let serverSocket = TcpServerSocket(bindAt: 0)
    let client = ClientBuilder().build()

    @TestCase
    func client1_1TestClient1_1ReuseConn(): Unit {
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.second)
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let u = URL.parse("http://127.0.0.1:${port}/a")

        let r = HttpRequestBuilder().url(u).build()

        client.send(r)
        client.send(r)
        let resp = client.send(r)
        @Expect(resp.toString().contains("connection: close\r\n"))
        client.close()
        serverSocket.close()
        fut.get()
        println("ok")
        asanGC()
    }
    func serverPacketCapture(): Bool {
        serverSocket.bind()
        let server = serverSocket.accept()
        sleep(Duration.millisecond * 500)

        server.write("HTTP/1.1 200 ok\r\nContent-Length: 0\r\n\r\n".toArray())
        server.write("HTTP/1.1 204 ok\r\nContent-Length: 100\r\n\r\n".toArray())
        server.write("HTTP/1.1 200 ok\r\nContent-Length: 0\r\nConnection: close\r\n\r\n".toArray())
        sleep(Duration.second)
        server.close()
        return true
    }
}

/* SCAN-IN
ok
 */
