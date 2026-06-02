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
 *      Test class Server
 *          Test Server parses requests in content-length format and requests sent in chunk format.
 * Test API:
 *       public func serve(): Unit
 */

package tests.server1_1

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
import stdx.net.tls

import std.collection.ArrayList
import std.net.TcpSocket

@Test
class TestServer11ParseRequest {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16
    let contentLengthBody = "test prase request"
    let chunkedBody = "test for chunked"

    @TestCase
    func messageTest(): Unit {
        startServer()
        sleep(Duration.second)
        port = server.port
        spawn {sendContentRequest()}
        sleep(Duration.millisecond * 400)
        spawn {sendChunkedRequest()}
        sleep(Duration.millisecond * 400)
        server.close()
    }

    func startServer() {
        server.distributor.register("/contentTest", handler1)
        server.distributor.register("/chunkedTest", handler2)
        spawn {
            server.serve()
        }
    }

    func handler1(ctx: HttpContext): Unit {
        let bodyBuf = Array<UInt8>(10, repeat: 0)
        let allBody = ArrayList<UInt8>()
        var readLen = ctx.request.body.read(bodyBuf)
        while (readLen > 0) {
            allBody.add(all: bodyBuf[..readLen])
            readLen = ctx.request.body.read(bodyBuf)
        }
        @Expect(String.fromUtf8(allBody.toArray()), contentLengthBody)
    }

    func handler2(ctx: HttpContext): Unit {
        let bodyBuf = Array<UInt8>(16, repeat: 0)
        let allBody = ArrayList<UInt8>()
        var readLen = ctx.request.body.read(bodyBuf)
        while (readLen > 0) {
            allBody.add(all: bodyBuf[..readLen])
            println(String.fromUtf8(allBody.toArray()))
            readLen = ctx.request.body.read(bodyBuf)
        }
        @Expect(String.fromUtf8(allBody.toArray()), chunkedBody)
    }

    func sendContentRequest() {
        // connect
        var client = TcpSocket("127.0.0.1", port)
        client.connect()

        // write preface and initial settings
        let preface = "GET /contentTest HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nContent-Length: 18\r\nConnection: keep-alive\r\n\r\ntest prase request"
            .toArray()
        client.write(preface)

        sleep(Duration.millisecond * 400)

        client.close()
    }

    func sendChunkedRequest() {
        // connect
        var client = TcpSocket("127.0.0.1", port)
        client.connect()

        // write preface and initial settings
        let preface = "GET /chunkedTest HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nTransfer-encoding: chunked\r\nConnection: keep-alive\r\n\r\n10\r\ntest for chunked\r\n0\r\n\r\n"
            .toArray()
        client.write(preface)

        sleep(Duration.millisecond * 300)

        client.close()
    }
}
