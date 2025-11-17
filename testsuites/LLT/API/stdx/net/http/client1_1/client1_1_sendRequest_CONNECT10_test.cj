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
 *      Test ConnNode#sendRequest
 * Test API:
 *      func sendRequest(request: HttpRequest): HttpResponse
 */
package tests.client1_1

import stdx.net.http.*
import stdx.encoding.url.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import stdx.log.*
import std.io.*

@Test
class TestConnNodeSendRequestCONNECT10 {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()

    @TestCase
    func ConnNodeSendRequestCONNECT10(): Unit {
        // start server
        let fut = spawn {startServer()}
        sleep(Duration.millisecond * 100)

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = server.port
        let u = "http://127.0.0.1:${port}"
        let (resp, socket) = client.connect(u)
        @Expect(resp.toString(), "HTTP/1.1 200 OK\r\n\r\n")
        // test socket
        client.close()
        socket?.write("hello, server".toArray())
        let buf = Array<UInt8>(500, repeat: 0)
        var i = socket?.read(buf) ?? 0
        println(String.fromUtf8(buf[..i]))
        @Expect(String.fromUtf8(buf[..i]), "hello, client")
        socket?.close()
        fut.get()
        client.close()
        server.close()
    }

    func startServer() {
        server.distributor.register("", connectHandler)
        spawn {
            server.serve()
        }
        sleep(Duration.millisecond * 200)
    }

    func connectHandler(ctx: HttpContext): Unit {
        println(ctx.request)
        let conn = upgrade(ctx)
        let buf = Array<UInt8>(500, repeat: 0)
        let len = conn.read(buf)
        @Assert(String.fromUtf8(buf[..len]), "hello, server")

        conn.write("hello, client".toArray())
        conn.close()
    }
}
