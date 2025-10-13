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
    let buf = Array<UInt8>(500, repeat: 0)

    @TestCase
    func connect2XX(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server.distributor.register("", connect2XXHd)
        spawn {
            server.serve()
        }
        sleep(Duration.millisecond * 200)
        let socket = TcpSocket("127.0.0.1", server.port)
        socket.connect()
        socket.write("CONNECT 127.0.0.1:${server.port} HTTP/1.1\r\nHost: 127.0.0.1:${server.port}\r\n\r\n".toArray())

        let len = socket.read(buf)
        @Assert(String.fromUtf8(buf[..len]).startsWith("HTTP/1.1 2"))

        socket.close()
        server.close()
    }

    @TestCase
    func connectAuto200(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server.distributor.register("", connectAuto200Hd)
        spawn {
            server.serve()
        }
        sleep(Duration.millisecond * 200)
        let socket = TcpSocket("127.0.0.1", server.port)
        socket.connect()
        socket.write("CONNECT 127.0.0.1:${server.port} HTTP/1.1\r\nHost: 127.0.0.1:${server.port}\r\n\r\n".toArray())

        let len = socket.read(buf)
        @Assert(String.fromUtf8(buf[..len]).startsWith("HTTP/1.1 200"))

        socket.close()
        server.close()
    }

    @TestCase
    func connectNo2XX(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server.distributor.register("", connectNo2XXHd)
        spawn {
            server.serve()
        }
        sleep(Duration.millisecond * 200)
        let socket = TcpSocket("127.0.0.1", server.port)
        socket.connect()
        socket.write("CONNECT 127.0.0.1:${server.port} HTTP/1.1\r\nHost: 127.0.0.1:${server.port}\r\n\r\n".toArray())
        sleep(Duration.millisecond * 100)
        socket.close()
        server.close()
    }

    @TestCase
    func connectTrCl(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server.distributor.register("", connectTrClHd)
        spawn {
            server.serve()
        }
        sleep(Duration.millisecond * 200)
        let socket = TcpSocket("127.0.0.1", server.port)
        socket.connect()
        socket.write("CONNECT 127.0.0.1:${server.port} HTTP/1.1\r\nHost: 127.0.0.1:${server.port}\r\n\r\n".toArray())

        let len = socket.read(buf)
        let response = String.fromUtf8(buf[..len])
        @Assert(!response.contains("transfer-encoding") && !response.contains("content-length"))

        socket.close()
        server.close()
    }

    @TestCase
    func get101(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server.distributor.register("/get101", get101Hd)
        spawn {
            server.serve()
        }
        sleep(Duration.millisecond * 200)
        let socket = TcpSocket("127.0.0.1", server.port)
        socket.connect()
        socket.write("GET /get101 HTTP/1.1\r\nHost: 127.0.0.1:${server.port}\r\n\r\n".toArray())

        let len = socket.read(buf)
        @Assert(String.fromUtf8(buf[..len]).startsWith("HTTP/1.1 101"))

        socket.close()
        server.close()
    }

    @TestCase
    func getNo101(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server.distributor.register("/getNo101", getNo101Hd)
        spawn {
            server.serve()
        }
        sleep(Duration.millisecond * 200)
        let socket = TcpSocket("127.0.0.1", server.port)
        socket.connect()
        socket.write("GET /getNo101 HTTP/1.1\r\nHost: 127.0.0.1:${server.port}\r\n\r\n".toArray())
        sleep(Duration.millisecond * 100)
        socket.close()
        server.close()
    }

    @TestCase
    func getAuto101(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server.distributor.register("/getAuto101", getAuto101Hd)
        spawn {
            server.serve()
        }
        sleep(Duration.millisecond * 200)
        let socket = TcpSocket("127.0.0.1", server.port)
        socket.connect()
        socket.write("GET /getAuto101 HTTP/1.1\r\nHost: 127.0.0.1:${server.port}\r\n\r\n".toArray())

        let buf = Array<UInt8>(500, repeat: 0)
        var len = socket.read(buf)
        @Assert(String.fromUtf8(buf[..len]).startsWith("HTTP/1.1 101"))

        socket.close()
        server.close()
        asanGC()
    }

    func connect2XXHd(ctx: HttpContext): Unit {
        ctx.responseBuilder.status(299)
        upgrade(ctx)
    }

    func connectAuto200Hd(ctx: HttpContext): Unit {
        upgrade(ctx)
    }

    func connectNo2XXHd(ctx: HttpContext): Unit {
        ctx.responseBuilder.status(399)
        try {
            upgrade(ctx)
            @Assert(1, 2)
        } catch (e: HttpException) {
            println(e)
        }
    }

    func connectTrClHd(ctx: HttpContext): Unit {
        ctx.responseBuilder.header("Transfer-Encoding", "aaa")
        ctx.responseBuilder.header("content-length", "bbb")
        upgrade(ctx)
    }

    func get101Hd(ctx: HttpContext): Unit {
        ctx.responseBuilder.status(101)
        upgrade(ctx)
    }

    func getAuto101Hd(ctx: HttpContext): Unit {
        upgrade(ctx)
    }

    func getNo101Hd(ctx: HttpContext): Unit {
        ctx.responseBuilder.status(200)
        try {
            upgrade(ctx)
            @Assert(1, 2)
        } catch (e: HttpException) {
            println(e)
        }
    }
}

//ASSERT: scan HttpException: Status of response to CONNECT request must be 2XX
//ASSERT: scan HttpException: Status of response to upgrade request must be 101
