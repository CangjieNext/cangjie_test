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
 * Test description: test that server validates host headers
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
class TestServerValidatesHostHeader {
    var port: UInt16 = 0
    var server = ServerBuilder().addr("127.0.0.1").port(port).build()

    var testArray: Array<(String, String, String, Int64)> = [
        ("GET / HTTP/0.9", "", "505 HTTP Version Not Supported", 1),
        ("GET / HTTP/1.1", "", "400 Bad Request", 2),
        // ("GET / HTTP/1.1", "Host: \r\n", "200 OK", 3),
        ("GET / HTTP/1.1", "Host: 1.2.3.4\r\n", "200 OK", 4),
        ("GET / HTTP/1.1", "Host: foo.com\r\n", "200 OK", 5),
        ("GET / HTTP/1.1", "Host: foo-bar_baz.com\r\n", "200 OK", 6),
        ("GET / HTTP/1.1", "Host: foo.com:80\r\n", "200 OK", 7),
        ("GET / HTTP/1.1", "Host: ::1\r\n", "200 OK", 8),
        ("GET / HTTP/1.1", "Host: [::1]\r\n", "200 OK", 9), // questionable without port, but accept it
        ("GET / HTTP/1.1", "Host: [::1]:80\r\n", "200 OK", 10),
        ("GET / HTTP/1.1", "Host: [::1%25en0]:80\r\n", "200 OK", 11),
        ("GET / HTTP/1.1", "Host: 1.2.3.4\r\n", "200 OK", 12),
        ("GET / HTTP/1.1", "Host: \u{0006}\r\n", "400 Bad Request", 13),
        // ("GET / HTTP/1.1", "Host: \u{00ff}\r\n", "400 Bad Request", 14),
        // ("GET / HTTP/1.1", "Host: (\r\n", "400 Bad Request", 15),
        // ("GET / HTTP/1.1", "Host: )\r\n", "400 Bad Request", 16),
        ("GET / HTTP/1.1", "Host: first\r\nHost: second\r\n", "400 Bad Request", 17),

        // HTTP/1.0 can lack a host header, but if present
        // must play by the rules too:
        // ("GET / HTTP/1.0", "", "200 OK", 18),
        ("GET / HTTP/1.0", "Host: first\r\nHost: second\r\n", "400 Bad Request", 19),
        // ("GET / HTTP/1.0", "Host: \u{00ff}\r\n", "400 Bad Request", 20),

        // Make an exception for HTTP upgrade requests:
        // ("PRI * HTTP/2.0", "", "200 OK", 21),

        // Also an exception for CONNECT requests:
        // ("CONNECT golang.org:443 HTTP/1.1", "", "200 OK", 22),

        // But not other HTTP/2 stuff:
        ("PRI / HTTP/2.0", "", "505 HTTP Version Not Supported", 23),
        ("GET / HTTP/2.0", "", "505 HTTP Version Not Supported", 24),
        ("GET / HTTP/3.0", "", "505 HTTP Version Not Supported", 25)
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

        for ((method, host, status, _) in testArray) {
            var respbuff = Array<UInt8>(10000, repeat: 0)
            var client = TcpSocket("127.0.0.1", port)
            client.connect()
            var req = method + "\r\n" + host + "\r\n"
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
