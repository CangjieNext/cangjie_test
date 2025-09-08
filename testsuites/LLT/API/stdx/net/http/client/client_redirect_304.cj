/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
import stdx.encoding.url.*
import std.net.*
import stdx.log.*
import std.sync.*
import std.time.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestClientRedirect {
    var client: Client = ClientBuilder().build()
    var server = ServerBuilder().addr("127.0.0.1").port(0).build()

    @TestCase
    func test304(): Unit {
        startServer()
        let rsp = client.get("http://127.0.0.1:${server.port}/")
        @Assert(rsp.status, 304)
        let buf = Array<UInt8>(5, repeat: 0)
        @Assert(0, rsp.body.read(buf))
        client.close()
        server.close()
    }

    func startServer(): Unit {
        server.distributor.register(
            "/",
            {
                ctx =>
                ctx.responseBuilder.status(304)
                ctx.responseBuilder.body("hello")
            }
        )
        spawn {
            server.serve()
        }
        sleep(Duration.second)
    }
}
