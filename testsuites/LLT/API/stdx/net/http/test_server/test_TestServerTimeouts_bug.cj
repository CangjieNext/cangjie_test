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
 * Check whether the timeout on the server takes effect.
 */

package tests.go_serve

import stdx.net.http.*
import stdx.net.tls.*
import std.net.TcpSocket
import std.unittest.*
import std.unittest.testmacro.*

@Test
class ServerTimeouts {
    var count = 0
    let server = ServerBuilder().addr("127.0.0.1").port(0).httpKeepAliveTimeout(Duration.second).build()
    var port = 0u16

    @TestCase
    func messageTest(): Unit {
        startServer()
        sleep(Duration.second)
        port = server.port
        sendContentRequest()
        sleep(Duration.millisecond * 100)
        server.close()
    }

    func startServer() {
        server.distributor.register("/contentTest", handler1)
        spawn {
            server.serve()
        }
    }

    func handler1(ctx: HttpContext): Unit {
        ctx.responseBuilder.body("aaaa")
    }

    func sendContentRequest() {
        var client = TcpSocket("127.0.0.1", port)
        client.connect()
        let preface = "GET /contentTest HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nContent-Length: 18\r\nConnection: keep-alive\r\n\r\ntest prase request"
            .toArray()
        client.write(preface)
        let buf = Array<UInt8>(2000, repeat: 0)
        let len = client.read(buf)
        // body is not read
        if (len < 103) {
            client.read(buf)
        }
        sleep(Duration.second * 2)
        client.write(preface)
        let buf1 = Array<UInt8>(2000, repeat: 0)
        let i1 = client.read(buf1)
        @Expect(i1, 0)
        client.close()
    }
}
