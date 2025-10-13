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
 * Test description: test path in distributor
 * Test API:
 */
package tests.handler

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
import stdx.net.tls
import stdx.encoding.url.*
import std.net.*
import std.sync.*
import stdx.log.*
import std.time.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestPath {
    @TestCase
    func testDistributor(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()

        let handle: HttpRequestHandler = FuncHandler({
            httpContext => httpContext.responseBuilder.body("ok")
        })

        try {
            server
                .distributor
                .register(
                    "/b",
                    {
                        ctx =>
                        ctx.responseBuilder.header("content-type", "text/plain; charset=utf-8")
                        ctx.responseBuilder.header("connection", "close")
                        ctx.responseBuilder.body("redirect complete")
                    }
                )
            server.distributor.register("*", handle)
        } catch (e: HttpException) {
            @Assert(e.message, "Invalid path.")
        }

        try {
            server.distributor.register("", handle)
        } catch (e: HttpException) {
            @Assert(e.message, "Invalid path.")
        }

        server.distributor.register("/a/b/../../", handle)
        var handler = server.distributor.distribute("/")
        @Expect(handler is FuncHandler)

        server.distributor.register("/abc/def", handle)
        handler = server.distributor.distribute("/////abc/./././aaa/../def")
        @Expect(handler is FuncHandler)

        server.distributor.register(".../abc/def", handle)
        handler = server.distributor.distribute(".../////abc/./././aaa/../def")
        @Expect(handler is FuncHandler)

        server.distributor.register("/aaa/def", handle)
        handler = server.distributor.distribute("..../////aaa/./././aaa/../def")
        @Expect(handler is NotFoundHandler)

        server.distributor.register("//////test/a/////////b//c////", handle)
        handler = server.distributor.distribute("/test/a/b/c/")
        @Expect(handler is FuncHandler)
    }
}
