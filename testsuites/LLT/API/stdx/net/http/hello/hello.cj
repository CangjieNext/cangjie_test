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
 *       test server start
 * Test API:
 *       serve()
 */

package tests.hello

import stdx.net.http.*
import stdx.log.*
import std.time.*
import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestHelloWorld {
    @TestCase
    func helloWorldTest(): Unit {
        let on = SyncCounter(1)
        // initiate server
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server.distributor.register("/hello", {
            ctx => ctx.responseBuilder.body("Hello World!")
        })
        server.logger.level = LogLevel.TRACE
        server.afterBind({=> on.dec()})
        // initiate client
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.TRACE
        // run server
        spawn {server.serve()}
        // wait until server bind
        on.waitUntilZero()
        //run client
        println("get: http://127.0.0.1:${server.port}/hello")
        let rsp = client.get("http://127.0.0.1:${server.port}/hello")
        let buf = Array<Byte>(1024, repeat: 0)
        while (rsp.body.read(buf) != 0) {
            let body = unsafe { String.fromUtf8Unchecked(buf) }
            println("body: ${body}")
        }
        server.close()
        client.close()
    }
}
