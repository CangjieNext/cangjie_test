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
 *          Test Server read request  when used transfer-encoding and read size bigger than chunk size.
 * Test API:
 *       public func serve(): Unit
 */

package tests.server1_1

import stdx.net.http.*
import stdx.log.*
import std.collection.ArrayList
import std.net.TcpSocket
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestServer11ParseChunkedRequest {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16
    let Body = "test for chunked"

    @TestCase
    func chunkTest(): Unit {
        startServer()
        sleep(Duration.second)
        port = server.port
        sendRequest()
        sleep(Duration.millisecond * 100)
        server.close()
    }

    func startServer() {
        server.logger.level = LogLevel.DEBUG // set log level

        server.distributor.register("/hello", handler)
        spawn {
            server.serve()
        }
    }

    func handler(ctx: HttpContext): Unit {
        let bodyBuf = Array<UInt8>(20, repeat: 0)
        let allBody = ArrayList<UInt8>()
        server.logger.debug("-----ready-----")
        var readLen = ctx.request.body.read(bodyBuf)
        server.logger.debug("while :---------------")
        server.logger.debug("while :readLen${readLen}")
        while (readLen > 0) {
            allBody.add(all: bodyBuf[..readLen])
            println(String.fromUtf8(allBody.toArray()))
            server.logger.debug("before read :---------------")
            readLen = ctx.request.body.read(bodyBuf)
            server.logger.debug("after read :---------------")
        }
        print(String.fromUtf8(allBody.toArray()))
        @Expect(String.fromUtf8(allBody.toArray()), Body)
    }

    func sendRequest() {
        // connect
        var client = TcpSocket("127.0.0.1", port)
        client.connect()

        // write preface and initial settings
        let preface = "GET /hello HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nTransfer-encoding: chunked\r\nConnection: close\r\n\r\n9\r\ntest for \r\n7\r\nchunked\r\n0\r\n\r\n"
            .toArray()
        client.write(preface)

        sleep(Duration.millisecond * 100)

        client.close()
    }
}
