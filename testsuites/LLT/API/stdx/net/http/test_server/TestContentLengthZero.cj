/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *     tests that for both an HTTP/1.0 and HTTP/1.1 request (both keep-alive), when a Handler never writes any
 *     response, the net/http package adds a "Content-Length: 0" response header.
 */

package tests.go_serve

import stdx.net.http.*
import stdx.net.tls.*
import std.net.TcpSocket
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestContentLengthZero {
    var port: UInt16 = 0
    var server = ServerBuilder().addr("127.0.0.1").port(port).build()
    var reqnum = 0
    var req = [
        "GET / HTTP/1.0\r\nConnection:keep-alive\r\nHost: foo\r\n\r\n",
        "GET / HTTP/1.1\r\nConnection:keep-alive\r\nHost: foo\r\n\r\n"
    ]

    // func handler(ctx: HttpContext): Unit {}
    func handler(_: HttpContext): Unit {}

    func serve() {
        server.distributor.register("/", handler)
        spawn {
            server.serve()
        }
    }

    func expect(): Int64 {
        serve()
        sleep(Duration.second)
        port = server.port
        for (r in req) {
            var respbuff = Array<UInt8>(10000, repeat: 0)
            var client = TcpSocket("127.0.0.1", port)
            client.connect()

            client.write((r + "GET / HTTP/1.1\r\n\r\n").toArray())
            sleep(Duration.second)
            client.read(respbuff)
            var resp = String.fromUtf8(respbuff)
            if (resp.contains("transfer-encoding")) {
                return 1
            }
            if (!resp.contains("content-length: 0")) {
                return 2
            }
            client.close()
        }
        server.close()
        return 0
    }

    @TestCase
    func test(): Unit {
        @Expect(expect(), 0)
    }
}
