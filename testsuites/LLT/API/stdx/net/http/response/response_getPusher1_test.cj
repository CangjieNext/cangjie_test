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
 *       Test HttpRequestBuilder
 * Test API:
 */

package tests.request

import std.net.TcpSocket
import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit

@Test
class TestMethod {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16
    @TestCase
    func getPushH1(): Unit {
        startServer()
        sleep(Duration.second)
        port = server.port
        sendRequest()
        sleep(Duration.millisecond * 400)
        server.close()
    }

    func startServer(): Unit {
        server.distributor.register("/hello", handler)
        sleep(Duration.millisecond * 100)
        spawn {
            server.serve()
        }
    }

    func handler(ctx: HttpContext): Unit {
        println("ok")
        let _ = HttpResponsePusher.getPusher(ctx).getOrThrow()
        @Expect(1, 2)
    }

    func sendRequest(): Unit {
        // connect
        var socket = TcpSocket("127.0.0.1", port)
        socket.connect()

        // write request and initial settings
        let request = "GET /hello HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nTransfer-encoding: chunked\r\n\r\n10\r\ntest for chunked\r\n0\r\n\r\n"
            .toArray()
        socket.write(request)

        sleep(Duration.millisecond * 100)
        socket.close()
    }
}
