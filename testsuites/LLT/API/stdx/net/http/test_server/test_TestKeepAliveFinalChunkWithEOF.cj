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
 * A response in JSON format is returned. Check whether the client can parse the response correctly.
 */

package tests.go_server

import stdx.net.http.*
import stdx.net.tls.*
import stdx.encoding.json.*
import std.unittest.*
import std.unittest.testmacro.*

var js = JsonString("JSON_STRING")

@Test
class TestConsumingBodyOnNextConn {
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
        ctx.responseBuilder.body(js.toJsonString().toArray())
    }

    func sendContentRequest() {
        let client = ClientBuilder().build()
        let resp = client.send(HttpRequestBuilder().get().url("http://127.0.0.1:${port}/contentTest").build())
        let buf = Array<UInt8>(2000, repeat: 0)
        let ii = resp.body.read(buf)
        @Expect(String.fromUtf8(buf.slice(0, ii)), js.toJsonString())
        client.close()
    }
}
