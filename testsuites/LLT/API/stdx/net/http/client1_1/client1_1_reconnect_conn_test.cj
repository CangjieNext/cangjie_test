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
 *      Test Client1_1#reconnect connection when server close it.
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
class TestClient1_1reconnectConn {
    let serverSocket = TcpServerSocket(bindAt: 0)
    let monitor = Monitor()

    @TestCase
    func client1_1reconnectConn(): Unit {
        let fut = spawn {serverPacketCapture1()}
        sleep(Duration.millisecond * 100)

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.OFF
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        for (i in 0..=20) {
            sleep(Duration.millisecond * 100)
            println(i)
            @Expect(client.get("http://127.0.0.1:${port}/a").toString().contains("HTTP/1.1 204 No Content\r\n"))
        }
        serverSocket.close()
        client.close()
        fut.get()
        asanGC()
    }

    func serverPacketCapture1() {
        serverSocket.bind()
        while (true) {
            try {
                let server = serverSocket.accept()
                let buf = Array<UInt8>(500, repeat: 0)
                let i = server.read(buf)
                let req = String.fromUtf8(buf[0..i])
                @Expect(req.contains("GET /a HTTP/1.1\r\n"))
                @Expect(req.contains("connection: keep-alive\r\n"))
                server.write("HTTP/1.1 204 ok\r\n\r\n".toArray())
                server.close()
                println("closed")
            } catch (e: SocketException) {
                println("caught")
                break
            }
        }
    }
}

/* SCAN-IN
0
closed
1
closed
2
closed
3
closed
4
closed
5
closed
6
closed
7
closed
8
closed
9
closed
10
closed
11
closed
12
closed
13
closed
14
closed
15
closed
16
closed
17
closed
18
closed
19
closed
20
closed
caught
 */
