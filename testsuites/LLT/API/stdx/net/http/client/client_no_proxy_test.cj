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
 * Test description: test no proxy
 *
 * Test API:
 *
 */

package tests.client

import stdx.net.http.*
import stdx.log.*
import std.sync.*
import std.time.*
import std.unittest.*
import std.unittest.testmacro.*
import std.process.*

@Test
class TestClientProxy {
    var server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var client: Client = ClientBuilder().httpProxy("http://www.example.com:8080").build()

    @TestCase
    func noProxy1(): Unit {
        startServer()
        Process.current.setEnv("no_proxy", "127.0.0.1")
        let rsp = client.get("http://127.0.0.1:${server.port}/")
        @Assert(rsp.status, 200)
        Process.current.setEnv("no_proxy", "")
    }

    @TestCase
    func httpProxy2(): Unit {
        Process.current.setEnv("no_proxy", "*")
        let rsp = client.get("http://127.0.0.1:${server.port}/")
        @Assert(rsp.status, 200)
        Process.current.setEnv("no_proxy", "")
    }

    @TestCase
    func httpProxy3(): Unit {
        Process.current.setEnv("no_proxy", "127.0.0.1:${server.port}")
        let rsp = client.get("http://127.0.0.1:${server.port}/")
        @Assert(rsp.status, 200)
        Process.current.setEnv("no_proxy", "")
        client.close()
        server.close()
    }

    func startServer(): Unit {
        server.distributor.register("/", {
            ctx => ctx.responseBuilder.body("hello")
        })
        spawn {
            server.serve()
        }
        sleep(Duration.second)
    }
}
