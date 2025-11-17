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
 *          Test the case that the chunkSize of the input request is invalid in chunked mode
 * Test API:
 *       public func serve(): Unit
 */

package tests.server1_1

import stdx.net.http.*
import stdx.log.*
import std.collection.ArrayList
import std.net.TcpSocket

@Test
class TestServer11IllegalChunkSize {
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
        println("ok")
    }

    func startServer() {
        server.logger.level = LogLevel.DEBUG
        server.distributor.register("/hello", handler)
        sleep(Duration.millisecond * 100)
        spawn {
            server.serve()
        }
    }

    func handler(ctx: HttpContext): Unit {
        let bodyBuf = Array<UInt8>(20, repeat: 0)
        let allBody = ArrayList<UInt8>()
        var readLen = ctx.request.body.read(bodyBuf)
        while (readLen > 0) {
            allBody.add(all: bodyBuf[..readLen])
            println(String.fromUtf8(allBody.toArray()))
            readLen = ctx.request.body.read(bodyBuf)
        }
    }

    func sendRequest() {
        let client1 = TcpSocket("127.0.0.1", port)
        client1.connect()

        let request1 = "GET /hello HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nTransfer-encoding: chunked\r\nConnection: close\r\n\r\ng4\r\ntest for chunkedSize\r\n0\r\n\r\n"
            .toArray()
        client1.write(request1)

        sleep(Duration.millisecond * 400)

        let arr1 = Array<UInt8>(1000, repeat: 0)
        let len1 = client1.read(arr1)
        let resp1 = String.fromUtf8(arr1.slice(0, len1))
        @Expect(resp1.contains("HTTP/1.1 400 Bad Request\r\n"))
        client1.close()

        let client2 = TcpSocket("127.0.0.1", port)
        client2.connect()

        let request2 = "GET /hello HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nTransfer-encoding: chunked\r\nConnection: close\r\n\r\n18\r\ntest for excessive chunk 123\r\n0\r\n\r\n"
            .toArray()
        client2.write(request2)

        sleep(Duration.millisecond * 400)

        let arr2 = Array<UInt8>(1000, repeat: 0)
        let len2 = client2.read(arr2)
        let resp2 = String.fromUtf8(arr2.slice(0, len2))
        @Expect(resp2.contains("HTTP/1.1 400 Bad Request\r\n"))
        client2.close()
    }
}

/* SCAN-IN
ok
 */
