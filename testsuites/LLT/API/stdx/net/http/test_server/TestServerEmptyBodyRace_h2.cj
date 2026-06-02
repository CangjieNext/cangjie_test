/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../tls/files
// DEPENDENCE: ../../../../asan
// DEPENDENCE: ../config
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt config/tlsconfig.cj -o tlsconfig.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle tlsconfig.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *       Test client recieve empty response body will reuse connection and do not cause race condition
 */

package tests.go_serve

import stdx.net.http.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import stdx.crypto.common.*
import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*
import {asan.*, tlsconfig.*}

@Test
class TestServerEmptyBodyRace_h2 {
    var port: UInt16 = 0
    var server = ServerBuilder().addr("127.0.0.1").port(port).tlsConfig(serverConfig()).build()
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
        let client = ClientBuilder().tlsConfig(clientConfig()).build()
        let req = HttpRequestBuilder().version(HTTP2_0).url("https://127.0.0.1:${port}/index").build()
        for (_ in 0..20) {
            spawn {
                let buf = Array<UInt8>(10, repeat: 0)
                try {
                    client.send(req).body.read(buf)
                } catch (e: HttpException) {
                    sleep(10 * Duration.millisecond)
                    client.send(req).body.read(buf)
                }
            }
        }
        while (count.load() != 20) {}
        @Expect(count.load() == 20)
        server.close()
        sleep(Duration.millisecond * 100)
        client.close()
        asanGC()
    }
}
