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
 * Test description: test that concurent Server Serve
 */

package tests.go_serve

import stdx.net.http.*
import stdx.net.tls.*
import std.net.TcpSocket
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestConcurrentServerServe {
    var port: UInt16 = 0
    var server = ServerBuilder().addr("127.0.0.1").port(port).build()

    func handler(_: HttpContext): Unit {}

    func serve() {
        server.distributor.register("/", handler)
        spawn {
            server.serve()
        }
    }

    @TestCase
    func test(): Unit {
        serve()
        sleep(Duration.second)
        port = server.port
        for (_ in 0..10) {
            var client1 = TcpSocket("127.0.0.1", port)
            client1.connect()
            client1.write(("GET / HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\n\r\n").toArray())
            sleep(Duration.millisecond * 100)
            client1.close()

            var client2 = TcpSocket("127.0.0.1", port)
            client2.connect()
            client2.write(("GET / HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\n\r\n").toArray())
            sleep(Duration.millisecond * 100)
            client2.close()
        }
        @Expect(1, 1)
        server.close()
    }
}
