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
 * Test description: test that server tolerate CRLF between requests
 *
 * Expect: nums == 2
 */

package tests.go_serve

import stdx.net.http.*
import stdx.net.tls.*
import std.net.TcpSocket
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestTolerateCRLFBeforeRequestLine {
    var port: UInt16 = 0
    var server = ServerBuilder().addr("127.0.0.1").port(port).build()
    var reqnum = 0
    var req = "POST / HTTP/1.1\r\nHost: 127.0.0.1:9000\r\nContent-Length: 3\r\n\r\nABC" + "\r\n\r\n" + // between two requests, so only the first request can pass
        "GET / HTTP/1.1\r\nHost: 127.0.0.1:9000\r\n\r\n"

    func handler(_: HttpContext): Unit {
        reqnum++
    }

    func serve() {
        server.distributor.register("/", handler)
        spawn {
            server.serve()
        }
    }

    @TestCase
    func test(): Unit {
        serve()
        sleep(Duration.second)
        port = server.port
        var respbuff = Array<UInt8>(10000, repeat: 0)
        var client = TcpSocket("127.0.0.1", port)
        client.connect()
        client.write(req.toArray())
        sleep(Duration.second)
        let len = client.read(respbuff)
        var resp = String.fromUtf8(respbuff.slice(0, len))
        @Expect(reqnum, 1)
        @Expect(resp.contains("400 Bad Request"), true)
        server.close()
        sleep(Duration.millisecond * 100)
        client.close()
    }
}
