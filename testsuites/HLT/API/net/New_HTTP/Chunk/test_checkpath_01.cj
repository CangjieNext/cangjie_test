/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.net.http.*
//import stdx.net.tls.common.*
import stdx.net.tls
//import stdx.crypto.kit
import std.time.*
import std.sync.*

var port = UInt16(0)
var server = ServerBuilder().addr("127.0.0.1").port(0).build()

@Test
class Test_CheckPath_01 {
    func startserve(): Unit {
        var a: HttpRequestHandler = FuncHandler({
            httpContext => httpContext.responseBuilder.body("id")
        })
        server.distributor.register("//////test/a/////////b//c////", a)
        server.distributor.register("././test/a/././././b/d/./", a)
        server.distributor.register("../../../test/a", a)
        server.distributor.register(".../../../.../a/...", a)
        server.distributor.register(".././test/.../bb/../bb/././a", a)
        server.serve()
    }

    // 路径处理规则：多个 / 视作同一个处理; ./为当前目录； ../返回上级目录；...及以上视作文件（夹）
    @TestCase
    func test_01(): Unit {
        spawn {
            startserve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        port = server.port
        var req1 = HttpRequestBuilder().url("http://127.0.0.1:${port}/test/a/b/c/").build()
        var req2 = HttpRequestBuilder().url("http://127.0.0.1:${port}/test/a/b/d/").build()
        var req3 = HttpRequestBuilder().url("http://127.0.0.1:${port}/test/a").build()
        var req4 = HttpRequestBuilder().url("http://127.0.0.1:${port}/.../a/...").build()
        var req5 = HttpRequestBuilder().url("http://127.0.0.1:${port}/test/.../bb/a").build()
        var client = ClientBuilder().build()
        var response1 = client.send(req1)
        @Expect(response1.status, UInt16(200))
        var response2 = client.send(req2)
        @Expect(response2.status, UInt16(200))
        var response3 = client.send(req3)
        @Expect(response3.status, UInt16(200))
        var response4 = client.send(req4)
        @Expect(response4.status, UInt16(200))
        var response5 = client.send(req5)
        @Expect(response5.status, UInt16(200))
        client.close()
        server.close()
    }
}
