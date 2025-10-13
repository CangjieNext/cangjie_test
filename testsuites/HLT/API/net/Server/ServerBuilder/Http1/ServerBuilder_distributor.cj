/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 
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

let request: HttpRequestHandler = myHttpRequestHandler()
let dis: HttpRequestDistributor = myDistributor()
var str = ""

class myDistributor <: HttpRequestDistributor {
    public func register(path: String, handler: HttpRequestHandler): Unit {
        str = "this is register with path and HttpRequestHandler"
    }

    public func register(path: String, handler: (HttpContext) -> Unit): Unit {
        str = "this is register with path and (HttpContext) -> Unit"
    }

    public func distribute(path: String): HttpRequestHandler {
        request
    }
}

class myHttpRequestHandler <: HttpRequestHandler {
    public func handle(ctx: HttpContext): Unit {
        return
    }
}

@Test
public class Test_distributor {
    public override func beforeEach(): Unit {
        str = ""
    }

    @TestCase
    func path_and_HttpRequestHandler(): Unit {
        dis.register("/ss", request)
        let server = ServerBuilder().addr("127.0.0.1").port(0).distributor(dis).build()

        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let r = HttpRequestBuilder().url("http://127.0.0.1:${server.port}/ss").build()

        let c = ClientBuilder().build()

        let res = c.send(r)
        server.close()
        @Expect(str, "this is register with path and HttpRequestHandler")
    }

    @TestCase
    func path_and_handler(): Unit {
        dis.register("/ss", {ctx => ctx.responseBuilder.header("hello", "value")})
        let server = ServerBuilder().addr("127.0.0.1").port(0).distributor(dis).build()

        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let r = HttpRequestBuilder().url("http://127.0.0.1:${server.port}/ss").build()

        let c = ClientBuilder().build()

        let res = c.send(r)
        server.close()
        @Expect(str, "this is register with path and (HttpContext) -> Unit")
    }

    @TestCase
    func chinese_path(): Unit {
        dis.register("/中文路径", {ctx => ctx.responseBuilder.header("hello", "value")})
        let server = ServerBuilder().addr("127.0.0.1").port(0).distributor(dis).build()

        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let r = HttpRequestBuilder().url("http://127.0.0.1:${server.port}/中文路径").build()

        let c = ClientBuilder().build()

        let res = c.send(r)
        server.close()
        @Expect(str, "this is register with path and (HttpContext) -> Unit")
    }

    @TestCase
    func Special_characters_path(): Unit {
        dis.register("/!", {ctx => ctx.responseBuilder.header("hello", "value")})
        let server = ServerBuilder().addr("127.0.0.1").port(0).distributor(dis).build()

        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let r = HttpRequestBuilder().url("http://127.0.0.1:${server.port}/!").build()

        let c = ClientBuilder().build()

        let res = c.send(r)
        server.close()
        @Expect(str, "this is register with path and (HttpContext) -> Unit")
    }

    @TestCase
    func path_abc(): Unit {
        dis.register("abc", {ctx => ctx.responseBuilder.header("hello", "value")})
        let server = ServerBuilder().addr("127.0.0.1").port(0).distributor(dis).build()

        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let r = HttpRequestBuilder().url("http://127.0.0.1:${server.port}/abc").build()

        let c = ClientBuilder().build()

        let res = c.send(r)
        server.close()
        @Expect(str, "this is register with path and (HttpContext) -> Unit")
    }

    @TestCase
    func multi_register_path(): Unit {
        var flag = false
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()

        server.distributor.register("/ss", request)
        try {
            server.distributor.register("/ss", request)
        } catch (e: HttpException) {
            flag = true
            @Expect(e.message, "Path: /ss already registered.")
        }
        @Expect(flag, true)
    }
}
