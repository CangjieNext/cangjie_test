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
 *      Test server HttpExpectBodyProvider
 * Test API:
 *      public func read(buf: Array<Byte>): Int64
 */
package tests.server1_1

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
import std.net.TcpSocket
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestExpectBodyProvider2 {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    @TestCase
    func testExpectBodyProvider(): Unit {
        spawn {startServer()}
        sleep(Duration.second)

        var clientSocket = TcpSocket("127.0.0.1", server.port)
        clientSocket.connect()
        // bad Expect
        clientSocket.write(
            "GET /w HTTP/1.1\r\nHost: 127.0.0.1:${server.port}\r\nExpect: 100-conti\r\nContent-Length: 5\r\n\r\nhello"
                .toArray())
        sleep(Duration.second * 1)
        let buf = Array<UInt8>(500, repeat: 0)
        let i = clientSocket.read(buf)
        // only one response
        println(String.fromUtf8(buf[..i]))
        @Expect(String.fromUtf8(buf[..i]).lastIndexOf("HTTP").getOrThrow(), 0)
        @Expect(String.fromUtf8(buf[..i]).contains("HTTP/1.1 417"))

        clientSocket.close()

        server.close()
    }

    func startServer() {
        server.distributor.register("/w", handler1)
        server.serve()
    }
    func handler1(_: HttpContext): Unit {
    }
}
