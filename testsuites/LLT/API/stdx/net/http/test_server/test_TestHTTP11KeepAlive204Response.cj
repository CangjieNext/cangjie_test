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
 * Indicates whether the default value is persistent connection in HTTP/1.1.
 * Response status code 204
 */

package tests.go_server

import stdx.net.http.*
import stdx.net.tls.*
import std.net.TcpSocket
import std.unittest.*
import std.unittest.testmacro.*

@Test
class HTTP11KeepAlive204Response {
    var count = 0
    let server = ServerBuilder()
        .addr("127.0.0.1")
        .port(0)
        .readHeaderTimeout(Duration.second * 10)
        .writeTimeout(Duration.second * 10)
        .readTimeout(Duration.second * 10)
        .build()
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
        ctx.responseBuilder.status(204)
    }

    func sendContentRequest() {
        // connect
        var ok = 0
        var client = TcpSocket("127.0.0.1", port)
        client.connect()
        let preface = "GET /contentTest HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nContent-Length: 18\r\nConnection: keep-alive\r\n\r\ntest prase request"
            .toArray()
        client.write(preface)
        let buf = Array<UInt8>(2000, repeat: 0)
        client.read(buf)
        if (String.fromUtf8(buf.slice(0, 23)) != "HTTP/1.1 204 No Content") {
            ok++
        }
        client.write(preface)
        let buf1 = Array<UInt8>(2000, repeat: 0)
        client.read(buf1)
        if (String.fromUtf8(buf1.slice(9, 3)) != "204") {
            ok++
        }
        @Expect(ok, 0)
        client.close()
    }
}
