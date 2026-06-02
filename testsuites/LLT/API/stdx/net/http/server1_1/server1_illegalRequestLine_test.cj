/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

/*
 * Test description:
 *      Test class Server
 *          Test invalid characters are not allowed in the http message.
 * Test API:
 *       public func serve(): Unit
 */

package tests.server1_1

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
import stdx.log.*
import std.net.TcpSocket

@Test
class TestServer11IllegalRequestLine {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16

    @TestCase
    func chunkTest(): Unit {
        startServer()
        sleep(Duration.millisecond * 500)
        port = server.port
        sendRequest()
        sleep(Duration.millisecond * 100)
        server.close()
    }

    func startServer() {
        server.distributor.register("/requestLineTarget", {_ => ()})
        sleep(Duration.millisecond * 100)
        spawn {
            server.serve()
        }
    }

    func sendRequest() {
        let client1 = TcpSocket("127.0.0.1", port)
        client1.connect()

        let request1 = "GE@T /requestLineTarget HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nContent-Length: 15\r\nConnection: keep-alive\r\n\r\ntest blank line"
            .toArray()
        client1.write(request1)

        sleep(Duration.millisecond * 400)

        let arr1 = Array<UInt8>(1000, repeat: 0)
        let len1 = client1.read(arr1)
        let resp1 = String.fromUtf8(arr1.slice(0, len1))
        @Expect(resp1.contains("HTTP/1.1 405 Method Not Allowed\r\n"))
        client1.close()

        let client2 = TcpSocket("127.0.0.1", port)
        client2.connect()

        let request2 = "GET requestL\0ineTarget HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nContent-Length: 15\r\nConnection: keep-alive\r\n\r\ntest blank line"
            .toArray()
        client2.write(request2)

        sleep(Duration.millisecond * 400)

        let arr2 = Array<UInt8>(1000, repeat: 0)
        let len2 = client2.read(arr2)
        let resp2 = String.fromUtf8(arr2.slice(0, len2))
        @Expect(resp2.contains("HTTP/1.1 400 Bad Request\r\n"))
        client2.close()

        let client3 = TcpSocket("127.0.0.1", port)
        client3.connect()

        let request3 = "GET /requestLineTarget HTTP/10.0\r\nHost: 127.0.0.1:${port}\r\nContent-Length: 15\r\nConnection: keep-alive\r\n\r\ntest blank line"
            .toArray()
        client3.write(request3)

        sleep(Duration.millisecond * 400)

        let arr3 = Array<UInt8>(1000, repeat: 0)
        let len3 = client3.read(arr3)
        let resp3 = String.fromUtf8(arr3.slice(0, len3))
        @Expect(resp3.contains("HTTP/1.1 505 HTTP Version Not Supported\r\n"))
        client3.close()
    }
}

/* SCAN-IN
Invalid request method
 */

/* SCAN-IN
Invalid request target
 */

/* SCAN-IN
Incorrect version:
 */
