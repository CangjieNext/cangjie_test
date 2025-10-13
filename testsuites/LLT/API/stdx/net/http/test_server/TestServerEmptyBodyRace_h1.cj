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
 *       Test client recieve empty response body will reuse connection and do not cause race condition
 */

package tests.go_serve

import stdx.net.http.*
import stdx.net.tls.*
import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestServerEmptyBodyRace_h1 {
    var port: UInt16 = 0
    var server = ServerBuilder().addr("127.0.0.1").port(port).build()
    let count: AtomicInt64 = AtomicInt64(0)

    func handler(_: HttpContext): Unit {
        count.fetchAdd(1)
    }

    func serve() {
        server.distributor.register("/index", handler)
        spawn {
            server.serve()
        }
    }

    @TestCase
    func test(): Unit {
        serve()
        sleep(Duration.second)
        port = server.port
        let client = ClientBuilder().build()
        for (_ in 0..20) {
            let buf = Array<UInt8>(10, repeat: 0)
            try {
                client.get("http://127.0.0.1:${port}/index").body.read(buf)
            } catch (e: HttpException) {
                sleep(10 * Duration.millisecond)
                client.get("http://127.0.0.1:${port}/index").body.read(buf)
            }
        }
        @Expect(count.load() == 20)
        server.close()
        sleep(Duration.millisecond * 100)
        client.close()
    }
}
