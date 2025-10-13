/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

/*
 * Test description: Test body function
 * Test API: public func body(body: Array<UInt8>): HttpResponseBuilder
 *           public func body(body: String): HttpResponseBuilder
 *           public func body(body: InputStream): HttpResponseBuilder
 */

import stdx.net.http.*
import stdx.net.tls.common.*
import stdx.net.tls
import stdx.crypto.kit
import std.time.*
import std.sync.*
import std.collection.*
import std.io.*

var port = UInt16(0)
var server1 = ServerBuilder().addr("127.0.0.1").port(0).build()
var server2 = ServerBuilder().addr("127.0.0.1").port(0).build()
var server3 = ServerBuilder().addr("127.0.0.1").port(0).build()

@Test
class Test_HttpResponseBuilder_Body_04 {
    func startserve1(): Unit {
        // 同时设置chunked 和 Content-Length
        var a: HttpRequestHandler = FuncHandler(
            {
                httpContext =>
                httpContext.responseBuilder.header("Content-Length", "1000")
                httpContext.responseBuilder.header("transfer-encoding", "chunked")
                var ins = ByteBuffer(10000)
                ins.write(Array<Byte>(2000, repeat: UInt8(2)))
                httpContext.responseBuilder.body(ins)
            }
        )
        server1.distributor.register("/test/a", a)
        server1.serve()
    }

    func startserve2(): Unit {
        // 多个冲突的content-length
        var b: HttpRequestHandler = FuncHandler(
            {
                httpContext =>
                httpContext.responseBuilder.header("Content-Length", "1000")
                httpContext.responseBuilder.header("Content-Length", "100")
                var ins = ByteBuffer(10000)
                ins.write(Array<Byte>(2000, repeat: UInt8(2)))
                httpContext.responseBuilder.body(ins)
            }
        )
        server2.distributor.register("/test/b", b)
        server2.serve()
    }

    func startserve3(): Unit {
        // 不合法的content-length
        var c: HttpRequestHandler = FuncHandler(
            {
                httpContext =>
                var ins = ByteBuffer(10000)
                ins.write(Array<Byte>(2000, repeat: UInt8(2)))
                httpContext.responseBuilder.body(ins)
                httpContext.responseBuilder.header("Content-Length", "abc")
            }
        )
        var d: HttpRequestHandler = FuncHandler({
            ctx =>
        })
        server3.distributor.register("/test/c", c)
        server3.distributor.register("/test/d", d)
        server3.serve()
    }

    @TestCase
    func test_body_01(): Unit {
        spawn {
            startserve1()
        }

        while (server1.port == 0) {
            sleep(Duration.millisecond)
        }
        port = server1.port
        var client = ClientBuilder().build()
        @Expect(client.get("http://127.0.0.1:${port}/test/a").status, 500)
        client.close()
        server1.close()
    }

    @TestCase
    func test_body_02(): Unit {
        spawn {
            startserve2()
        }

        while (server2.port == 0) {
            sleep(Duration.millisecond)
        }
        port = server2.port
        var client = ClientBuilder().build()
        @Expect(client.get("http://127.0.0.1:${port}/test/b").status, 500)
        client.close()
        server2.close()
    }

    @TestCase
    func test_body_03(): Unit {
        spawn {
            startserve3()
        }

        while (server3.port == 0) {
            sleep(Duration.millisecond)
        }
        port = server3.port
        var client = ClientBuilder().build()
        @Expect(client.get("http://127.0.0.1:${port}/test/c").status, 500)
        @Expect(client.get("http://127.0.0.1:${port}/test/d").status, 200)
        client.close()
        server3.close()
    }
}
