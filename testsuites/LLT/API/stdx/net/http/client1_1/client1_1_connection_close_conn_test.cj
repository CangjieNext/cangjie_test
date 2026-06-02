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
 *      Test Client1_1#Connection: close and close the connection
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
class TestClient1_1closeConn {
    let serverSocket1 = TcpServerSocket(bindAt: 0)

    let serverSocket2 = TcpServerSocket(bindAt: 0)

    @TestCase
    // request.close
    func client1_1closeConn(): Unit {
        let fut = spawn {serverPacketCapture1()}
        sleep(Duration.millisecond * 100)

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port1 = (serverSocket1.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port1}/a")
        let r = HttpRequestBuilder().url(u).header("connection", "close").build()

        for (_ in 0..30) {
            client.send(r)
        }

        serverSocket1.close()
        client.close()
        fut.get()
    }

    @TestCase
    // response.close
    func client1_1closeConn2(): Unit {
        let fut = spawn {serverPacketCapture2()}
        sleep(Duration.millisecond * 100)

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port2 = (serverSocket2.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port2}/a")
        let r = HttpRequestBuilder().url(u)
            .build()

        for (_ in 0..30) {
            let response = client.send(r)
            @Expect(response.toString().contains("connection: close\r\n"))
        }

        serverSocket2.close()
        client.close()
        fut.get()
        println("ok")
        asanGC()
    }

    func serverPacketCapture1() {
        let serverList = ArrayList<TcpSocket>()
        serverSocket1.bind()
        while (true) {
            try {
                // one connection only write once
                var server = serverSocket1.accept()
                var buf = Array<UInt8>(500, repeat: 0)
                let i = server.read(buf)
                @Expect(String.fromUtf8(buf[..i]).contains("connection: close\r\n"))
                @Expect(String.fromUtf8(buf[..i]).contains("keep-alive"), false)
                server.write("HTTP/1.1 204 ok\r\n\r\n".toArray())
                serverList.add(server)
            } catch (e: SocketException) {
                break
            }
        }
        for (server in serverList) {
            server.close()
        }
    }

    func serverPacketCapture2() {
        let serverList = ArrayList<TcpSocket>()
        serverSocket2.bind()
        while (true) {
            try {
                // one connection only write once
                var server = serverSocket2.accept()
                var buf = Array<UInt8>(500, repeat: 0)
                server.read(buf)
                server.write("HTTP/1.1 204 ok\r\nconnection: close\r\n\r\n".toArray())
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
