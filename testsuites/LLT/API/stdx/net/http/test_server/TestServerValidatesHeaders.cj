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
 * Test description: test that server validates headers
 *
 * Expect: statuscode is same with what is in the Array
 */

package tests.go_serve

import stdx.net.http.*
import stdx.net.tls.*
import std.net.TcpSocket
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestServerValidatesHeaders {
    var port: UInt16 = 0
    var server = ServerBuilder().addr("127.0.0.1").port(port).build()

    var headerandstatus: Array<(String, String, Int64)> = [
        ("", "200 OK", 1),
        ("Foo: bar\r\n", "200 OK", 2),
        ("X-Foo: bar\r\n", "200 OK", 3),
        ("Foo: a space\r\n", "200 OK", 4),
        ("A space: foo\r\n", "400 Bad Request", 5), // space in header
        ("foo\u{00ff}bar: foo\r\n", "400 Bad Request", 6), // binary in header
        ("foo\u{0000}bar: foo\r\n", "400 Bad Request", 7), // binary in header
        // ("Foo: " + "x".repeat(1<<21) + "\r\n", "431 Request Header Fields Too Large", 8), // header too large
        // Spaces between the header key and colon are not allowed.
        // See RFC 7230, Section 3.2.4.
        ("Foo : bar\r\n", "400 Bad Request", 9),
        ("Foo\t: bar\r\n", "400 Bad Request", 10),
        ("foo: foo foo\r\n", "200 OK", 11), // LWS space is okay
        ("foo: foo\tfoo\r\n", "200 OK", 12), // LWS tab is okay
        ("foo: foo\u{0000}foo\r\n", "400 Bad Request", 13), // CTL 0x00 in value is bad
        ("foo: foo\u{007f}foo\r\n", "400 Bad Request", 14), // CTL 0x7f in value is bad
        ("foo: foo\u{00ff}foo\r\n", "200 OK", 15) // non-ASCII high octets in value are fine
    ]

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
        for ((header, status, _) in headerandstatus) {
            var respbuff = Array<UInt8>(10000, repeat: 0)
            var client = TcpSocket("127.0.0.1", port)
            client.connect()
            var req = "GET / HTTP/1.1\r\nHost: foo\r\n" + header + "\r\n"
            client.write(req.toArray())
            client.read(respbuff)
            var resp = String.fromUtf8(respbuff)
            @Expect(resp.contains(status), true)
            client.close()
        }
        sleep(Duration.millisecond * 100)
        server.close()
    }
}
