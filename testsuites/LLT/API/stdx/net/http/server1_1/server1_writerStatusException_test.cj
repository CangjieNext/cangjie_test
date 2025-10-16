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
 *      Test class Server
 *          If HttpStatusException is thrown in the handler when responseWriter is invoked, the response can be sent accurately.
 * Test API:
 *       public func serve(): Unit
 */

package tests.server1_1

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit

import std.net.TcpSocket

@Test
class TestServer1_1UserWriteException {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()

    func startHttpServer() {
        server.distributor.register("/a", handler1)
        server.serve()
    }
    func handler1(ctx: HttpContext): Unit {
        ctx.responseBuilder.header("transfer-encoding", "chunked")
        let writer = HttpResponseWriter(ctx)
        writer.write("hello".toArray())
        let buf = Array<UInt8>(500, repeat: 0)
        ctx.request.body.read(buf)
    }
    @TestCase
    func testServer1_1UserWriteException(): Unit {
        // http
        spawn {
            startHttpServer()
        }
        sleep(Duration.second)

        let port = server.port
        let client = TcpSocket("127.0.0.1", port)
        client.connect()
        client.write("GET /a HTTP/1.1\r\nhost: 127.0.0.1:${port}\r\ntransfer-encoding: chunked\r\n\r\n".toArray())
        client.write("10\r\n1234567890123456\r\n2\r\n12\r\n0\r\n".toArray())
        client.write("a\rc: 22\r\n".toArray())
        client.write("\r\n".toArray())
        sleep(Duration.second)
        let arr = Array<UInt8>(500, repeat: 0)
        let len = client.read(arr)
        let resp = String.fromUtf8(arr.slice(0, len))
        @Expect(resp.contains("hello"))
        @Expect(!resp.contains("400 Bad Request"))

        server.close()
        client.close()
    }
}
