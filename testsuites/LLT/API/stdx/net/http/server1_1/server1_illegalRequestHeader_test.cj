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
 *       Test Server
 * Test API:
 *       serve()
 */

package tests.server1_1

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
import stdx.net.tls
import stdx.log.*
import std.collection.ArrayList
import std.net.TcpSocket

@Test
class TestServer11IllegalHeader {
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
        server.logger.level = LogLevel.DEBUG
        server.distributor.register("/headerTest", {_ => ()})
        sleep(Duration.millisecond * 100)
        spawn {
            server.serve()
        }
    }

    func sendRequest() {
        let client1 = TcpSocket("127.0.0.1", port)
        client1.connect()

        let request1 = "\r\nGET /headerTest HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nContent-Length: 15\r\nConnection: keep-alive\r\n\r\ntest blank line"
            .toArray()
        client1.write(request1)

        sleep(Duration.millisecond * 400)

        let arr1 = Array<UInt8>(1000, repeat: 0)
        let len1 = client1.read(arr1)
        let resp1 = String.fromUtf8(arr1.slice(0, len1))
        @Expect(resp1.contains("HTTP/1.1 200 OK\r\n"))

        let request2 = "GET /headerTest HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nContent-Length: 19\r\nConnection\r\n\r\ntest illegal header"
            .toArray()
        client1.write(request2)

        sleep(Duration.millisecond * 400)

        let arr2 = Array<UInt8>(1000, repeat: 0)
        let len2 = client1.read(arr2)
        let resp2 = String.fromUtf8(arr2.slice(0, len2))
        @Expect(resp2.contains("HTTP/1.1 400 Bad Request\r\n"))
        client1.close()

        let client2 = TcpSocket("127.0.0.1", port)
        client2.connect()

        let request3 = "GET /headerTest HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nContent-Length: 24\r\nConne@ction: keep-alive\r\n\r\ntest illegal header name"
            .toArray()
        client2.write(request3)

        sleep(Duration.millisecond * 400)

        let arr3 = Array<UInt8>(1000, repeat: 0)
        let len3 = client2.read(arr3)
        let resp3 = String.fromUtf8(arr3.slice(0, len3))
        @Expect(resp3.contains("HTTP/1.1 400 Bad Request\r\n"))
        client2.close()

        let client3 = TcpSocket("127.0.0.1", port)
        client3.connect()

        let request4 = "GET /headerTest HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nContent-Length: 25\r\nConnection: keep-al\0ive\r\n\r\ntest illegal header value"
            .toArray()
        client3.write(request4)

        sleep(Duration.millisecond * 400)

        let arr4 = Array<UInt8>(1000, repeat: 0)
        let len4 = client3.read(arr4)
        let resp4 = String.fromUtf8(arr4.slice(0, len4))
        @Expect(resp4.contains("HTTP/1.1 400 Bad Request\r\n"))
        client3.close()

        let client4 = TcpSocket("127.0.0.1", port)
        client4.connect()

        let request5 = "GET /headerTest HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nContent-Length\r: 12\r\nConnection: keep-alive\r\n\r\ntest bare CR"
            .toArray()
        client4.write(request5)

        sleep(Duration.millisecond * 400)

        let arr5 = Array<UInt8>(1000, repeat: 0)
        let len5 = client4.read(arr5)
        let resp5 = String.fromUtf8(arr5.slice(0, len5))
        @Expect(resp5.contains("HTTP/1.1 400 Bad Request\r\n"))
        client4.close()
    }
}

// ASSERT:scan-3 Invalid field line
// ASSERT:scan Invalid line contains bare CR
