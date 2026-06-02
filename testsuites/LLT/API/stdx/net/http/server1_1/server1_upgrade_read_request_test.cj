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
 *      test server upgrade
 * Test API:
 *      public func upgrade(ctx: HttpContext): StreamingSocket
 */

package tests.server1_1

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit

import std.net.TcpSocket
import asan.*

@Test
class TestServer11Upgrade {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16
    let buf = Array<UInt8>(500, repeat: 0)

    @TestCase
    func requestNotRead(): Unit {
        startServer()
        sendRequest("/requestNotRead")
    }

    @TestCase
    func requestReadHalf(): Unit {
        sendRequest("/requestReadHalf")
    }

    @TestCase
    func requestReadAll(): Unit {
        sendRequest("/requestReadAll")
        server.close()
        asanGC()
    }

    func sendRequest(path: String) {
        let socket = TcpSocket("127.0.0.1", port)
        socket.connect()

        socket.write(
            "GET ${path} HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nContent-Length: 12\r\n\r\nrequest body".toArray())

        let buf = Array<UInt8>(500, repeat: 0)
        var len = socket.read(buf)
        @Assert(String.fromUtf8(buf[..len]).startsWith("HTTP/1.1 101 Switching Protocols"))

        sleep(Duration.millisecond * 100)
        socket.write("client write message".toArray())

        len = socket.read(buf)
        @Assert(String.fromUtf8(buf[..len]), "server write message")

        socket.close()
    }

    func startServer() {
        server.distributor.register("/requestNotRead", requestNotReadHd)
        server.distributor.register("/requestReadHalf", requestReadHalfHd)
        server.distributor.register("/requestReadAll", requestReadAllHd)
        spawn {
            server.serve()
        }
        sleep(Duration.millisecond * 200)
        port = server.port
    }

    func requestNotReadHd(ctx: HttpContext): Unit {
        let conn = upgrade(ctx)

        var len = conn.read(buf)
        @Assert(String.fromUtf8(buf[..len]), "request body")

        len = conn.read(buf)
        @Assert(String.fromUtf8(buf[..len]), "client write message")

        conn.write("server write message".toArray())
        println("handler ok")
        conn.close()
    }

    func requestReadHalfHd(ctx: HttpContext): Unit {
        ctx.request.body.read(buf[..8])
        let conn = upgrade(ctx)

        var len = conn.read(buf)
        @Assert(String.fromUtf8(buf[..len]), "body")

        len = conn.read(buf)
        @Assert(String.fromUtf8(buf[..len]), "client write message")

        conn.write("server write message".toArray())
        println("handler ok")
        conn.close()
    }

    func requestReadAllHd(ctx: HttpContext): Unit {
        ctx.request.body.read(buf)
        let conn = upgrade(ctx)

        sleep(Duration.millisecond * 100)
        let len = conn.read(buf)
        @Assert(String.fromUtf8(buf[..len]), "client write message")

        conn.write("server write message".toArray())
        println("handler ok")
        conn.close()
    }
}

//ASSERT: scan-3 handler ok
