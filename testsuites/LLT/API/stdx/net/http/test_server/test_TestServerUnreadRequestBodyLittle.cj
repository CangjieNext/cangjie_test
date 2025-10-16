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
 * Whether the 10 KB request body in the request can be processed and read
 */

package tests.go_serve

import stdx.net.http.*
import stdx.net.tls.*
import std.net.TcpSocket
import std.unittest.*
import std.unittest.testmacro.*

@Test
class ServerUnreadRequestBodyLittle {
    var count = 0
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
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
        var count = 0
        var ok = 0
        do {
            let buf = Array<UInt8>(2000, repeat: 0)
            var i = ctx.request.body.read(buf)
            count += i
            ok = i
        } while (ok != 0)
        if (count != 100000) {
            ctx.responseBuilder.status(500)
        }
    }

    func sendContentRequest() {
        // connect
        var client = TcpSocket("127.0.0.1", port)
        client.connect()
        let sb = StringBuilder()
        sb.append(
            "GET /contentTest HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nContent-Length: 100000\r\nConnection: keep-alive\r\n\r\n")
        for (i in 0..10000) {
            if (i < 1000) {
                sb.append("thisisbody")
            } else {
                sb.append("test1000BT")
            }
        }
        client.write(sb.toString().toArray())
        let buf = Array<UInt8>(2000, repeat: 0)
        client.read(buf)
        @Expect(String.fromUtf8(buf.slice(9, 3)), "200")
        client.close()
    }
}
