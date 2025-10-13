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
 * Test description: Test server will respond 413 to client when request body exceeds limit
 */

package tests.go_serve

import stdx.net.http.*
import stdx.net.tls.*
import std.net.TcpSocket
import std.unittest.*
import std.unittest.testmacro.*

@Test
class RequestBodyTimeoutClosesConnection {
    var port: UInt16 = 0
    var server = ServerBuilder().addr("127.0.0.1").port(port).readTimeout(Duration.nanosecond).build()

    func handler(ctx: HttpContext) {
        let request = ctx.request
        let reqBody = Array<UInt8>(10, repeat: 0)
        sleep(Duration.second)
        request.body.read(reqBody)
        sleep(Duration.millisecond)
        ()
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
        let req = "POST / HTTP/1.1\r\nHost: test\r\nContent-Length: 11\r\n\r\n" + "a" * 11
        let client = TcpSocket("127.0.0.1", port)
        client.connect()
        client.write(req.toArray())
        sleep(Duration.second)

        let arr = Array<UInt8>(1000, repeat: 0)
        let len = client.read(arr)
        let resp = String.fromUtf8(arr.slice(0, len))
        @Expect(resp.contains("408"))
        server.close()
        sleep(Duration.millisecond * 100)
        client.close()
    }
}
