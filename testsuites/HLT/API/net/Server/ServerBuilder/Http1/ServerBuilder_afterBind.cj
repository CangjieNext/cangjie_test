/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not Windows) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.net.*
import std.collection.*
import stdx.net.http.*
import stdx.net.tls.common.*
import stdx.net.tls
import stdx.crypto.kit
import std.math.*

var sum = 0

@Test
public class Test_serverbuilder_afterbind {
    @TestCase
    func test_serverbuilder_afterbind_01(): Unit {
        let on = SyncCounter(1)
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server.distributor.register("/ss", {ctx => ctx.responseBuilder.header("hello", "value")})
        server.afterBind({=> on.dec()})
        spawn {
            server.serve()
        }
        on.waitUntilZero()
        let request1 = HttpRequestBuilder().url("http://127.0.0.1:${server.port}/ss").body("0").build()
        let client = ClientBuilder().build()
        let response1 = client.send(request1)
        @Expect(response1.status, 200)
        server.close()
        client.close()
    }
    @TestCase
    func test_serverbuilder_afterbind_02(): Unit {
        let on = SyncCounter(1)
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server.distributor.register("/ss", {ctx => ctx.responseBuilder.header("hello", "value")})
        server.afterBind({=> on.dec()})
        server.afterBind({=> on.dec()})
        spawn {
            server.serve()
        }
        on.waitUntilZero()
        let request1 = HttpRequestBuilder().url("http://127.0.0.1:${server.port}/ss").body("0").build()
        let client = ClientBuilder().build()
        let response1 = client.send(request1)
        @Expect(response1.status, 200)
        server.close()
        client.close()
    }

    @TestCase
    func test_serverbuilder_afterbind_03(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server.distributor.register("/ss", {ctx => ctx.responseBuilder.header("hello", "value")})
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        server.afterBind({=> throw Exception("test_serverbuilder_afterbind_03 testcase is fail")})
        let request1 = HttpRequestBuilder().url("http://127.0.0.1:${server.port}/ss").body("0").build()
        let client = ClientBuilder().build()
        let response1 = client.send(request1)
        @Expect(response1.status, 200)
        server.close()
        client.close()
    }

    @TestCase
    func test_serverbuilder_afterbind_04(): Unit {
        let on = SyncCounter(1)
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server.distributor.register("/ss", {ctx => ctx.responseBuilder.header("hello", "value")})
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        let server1 = ServerBuilder().addr("127.0.0.1").port(server.port).build()
        server1.distributor.register("/ss", {ctx => ctx.responseBuilder.header("hello", "value")})
        server1.afterBind({=> throw Exception("test_serverbuilder_afterbind_04 testcase is fail")})
        try {
            server1.serve()
            @Expect(1, 2)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Address already in use") || e.message.contains("Address in use"), true)
        }
        server.close()
    }
}
