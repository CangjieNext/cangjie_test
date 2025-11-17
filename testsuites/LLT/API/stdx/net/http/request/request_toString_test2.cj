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
 *       Test HttpRequest
 * Test API:
 *       public override func toString(): String
 */

package tests.request

import stdx.net.http.*
import stdx.encoding.url.*
import std.net.TcpSocket
import std.unittest.*
import std.unittest.testmacro.*
import stdx.log.*

@Test
class TestToString2 {
    var server = ServerBuilder().addr("127.0.0.1").port(0).build()

    @TestCase
    func testServerRequest1(): Unit {
        server.distributor.register("/hello", {
            ctx => @Expect(ctx.request.toString().contains("GET /hello HTTP/1.1"))
        })
        spawn {
            server.serve()
        }
        sleep(Duration.second)
        let client = ClientBuilder().build()
        let r = HttpRequestBuilder().url("http://127.0.0.1:${server.port}/hello").header("Connection", "close").build()
        let _ = client.send(r)
        sleep(Duration.second * 2)
        server.close()
        client.close()
    }

    @TestCase
    func testServerRequest2(): Unit {
        server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server
            .distributor
            .register("", {
                ctx => @Expect(ctx.request.toString().contains("CONNECT 127.0.0.1:${server.port} HTTP/1.1"))
            })
        spawn {
            server.serve()
        }
        sleep(Duration.second)
        let client = TcpSocket("127.0.0.1", server.port)
        client.connect()

        let request = "CONNECT 127.0.0.1:${server.port} HTTP/1.1\r\nHost: 127.0.0.1:${server.port}\r\nContent-Length: 15\r\nConnection: keep-alive\r\n\r\ntest blank line"
            .toArray()
        client.write(request)

        sleep(Duration.millisecond * 400)

        let arr = Array<UInt8>(1000, repeat: 0)
        let len = client.read(arr)
        let _ = String.fromUtf8(arr.slice(0, len))
        sleep(Duration.second * 2)
        server.close()
        client.close()
    }
}
