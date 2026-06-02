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
 * Test description: test that response contains Transfer-Encoding: chunked set in handler
 */

package tests.go_serve

import stdx.net.http.*
import stdx.net.tls.*
import std.net.TcpSocket
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestHandlerSetTransferEncodingChunked {
    var port: UInt16 = 0
    var server = ServerBuilder().addr("127.0.0.1").port(port).build()

    func handler(ctx: HttpContext): Unit {
        ctx.responseBuilder.header("transfer-encoding", "chunked").body("hello")
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
        let socket = TcpSocket("127.0.0.1", port)
        socket.connect()
        socket.write("GET / HTTP/1.1\r\nHost: cangjie\r\n\r\n".toArray())
        sleep(Duration.second)
        let buf = Array<UInt8>(2000, repeat: 0)
        let i = socket.read(buf)
        let resp = String.fromUtf8(buf.slice(0, i))
        @Expect(resp.contains("transfer-encoding: chunked"), true)
        server.close()
        sleep(Duration.millisecond * 100)
        socket.close()
    }
}
