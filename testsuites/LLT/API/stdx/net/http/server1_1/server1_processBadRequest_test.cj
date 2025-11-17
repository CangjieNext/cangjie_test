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
 *          Test whether the server returns a 431 response after receiving a request whose headers size exceeds the value of maxRequestHeaderSize.
 * Test API:
 *       public func serve(): Unit
 */

package tests.server1_1

import stdx.net.http.*
import stdx.encoding.url.URL
import stdx.log.*
import std.net.TcpSocket

@Test
class ProcessBadRequest {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16

    @TestCase
    func badRequest1(): Unit {
        startServer()
        server.logger.level = LogLevel.WARN
        server.distributor.register("/hello", {_ => ()})
        port = server.port
        let client = TcpSocket("127.0.0.1", port)
        client.connect()
        client.write("GET /hello HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nContent-Length: -1\r\n\r\n".toArray())
        let arr = Array<UInt8>(1000, repeat: 0)
        let len = client.read(arr)
        let resp = String.fromUtf8(arr.slice(0, len))
        @Expect(resp.contains("400 Bad Request"))
        client.close()
    }

    @TestCase
    func badRequest2(): Unit {
        port = server.port
        let client = TcpSocket("127.0.0.1", port)
        client.connect()
        client.write("GET /hello HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nExpect: unknown\r\n\r\n".toArray())
        let arr = Array<UInt8>(1000, repeat: 0)
        let len = client.read(arr)
        let resp = String.fromUtf8(arr.slice(0, len))
        //@Expect(resp.contains("417 Expectation Failed"))
        client.close()
    }

    @TestCase
    func badRequest3(): Unit {
        port = server.port
        let client = TcpSocket("127.0.0.1", port)
        client.connect()
        client.write(
            "GET /hello HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nTransfer-Encoding: chunked\r\nTrailer:content-length\r\n\r\n0\r\ncontent-length: 10\r\n\r\n"
                .toArray())
        let arr = Array<UInt8>(1000, repeat: 0)
        let len = client.read(arr)
        let resp = String.fromUtf8(arr.slice(0, len))
        @Expect(resp.contains("400 Bad Request"))
        client.close()
    }

    @TestCase
    func badRequest4(): Unit {
        port = server.port
        let client = TcpSocket("127.0.0.1", port)
        client.connect()
        client.write("GET http://127.0.0.1:${port}/hello HTTP/1.1\r\nHost: 12#7.0.0.1:${port}\r\n\r\n".toArray())
        let arr = Array<UInt8>(1000, repeat: 0)
        let len = client.read(arr)
        let resp = String.fromUtf8(arr.slice(0, len))
        @Expect(resp.contains("400 Bad Request"))
        client.close()
        server.close()
    }

    func startServer(): Unit {
        spawn {
            server.serve()
        }
        sleep(Duration.second)
    }
}

/* SCAN-IN
The logic of content-length and transfer-encoding is incorrect.
 */

/* SCAN-IN
Invalid value for expect
 */

/* SCAN-IN
Malformed trailer field
 */

/* SCAN-IN
Malformed host header
 */
