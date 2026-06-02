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
 *      Test Client1_1#The number of connections exceeds the limit.
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
import std.collection.*
import stdx.log.*

@Test
class TestClient1_1maxConn {
    let serverSocket = TcpServerSocket(bindAt: 0)

    @TestCase
    func client1_1maxConn(): Unit {
        let fut = spawn {serverPacketCapture1()}
        sleep(Duration.millisecond * 100)

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder().url(u).header("Host", "huawei.com").build()
        for (_ in 0..10) {
            client.send(r)
        }
        try {
            client.send(r)
        } catch (e: Exception) {
            @Expect(e.message, "Too many connections to the same server!")
        }
        serverSocket.close()
        client.close()
        fut.get()
        println("ok")
        asanGC()
    }

    func serverPacketCapture1() {
        serverSocket.bind()
        let serverList = ArrayList<TcpSocket>()
        while (true) {
            try {
                var server = serverSocket.accept()
                var buf = Array<UInt8>(500, repeat: 0)
                var _ = server.read(buf)
                server.write("HTTP/1.1 200 ok\r\n\r\n".toArray())
                serverList.add(server)
            } catch (e: SocketException) {
                break
            }
        }
        for (server in serverList) {
            server.close()
        }
    }
}

/* SCAN-IN
ok
 */
