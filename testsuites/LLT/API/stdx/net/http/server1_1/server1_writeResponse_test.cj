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
 *          Test the response configured by the user can be sent accurately.
 * Test API:
 *       public func serve(): Unit
 */

package tests.server1_1

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit

import std.collection.ArrayList
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestServer11WriteResponse {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16
    let message = "hello world"

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
        server.distributor.register("/hello", writeHandler)
        spawn {
            server.serve()
        }
    }

    func writeHandler(ctx: HttpContext): Unit {
        let bodyBuf = Array<UInt8>(20, repeat: 0)
        let allBody = ArrayList<UInt8>()
        var readLen = ctx.request.body.read(bodyBuf)
        while (readLen > 0) {
            allBody.add(all: bodyBuf[..readLen])
            println(String.fromUtf8(allBody.toArray()))
            readLen = ctx.request.body.read(bodyBuf)
        }
        let responseBuilder = ctx.responseBuilder
        let header = HttpHeaders()
        header.add("Connection", "close")
        responseBuilder.status(200).addHeaders(header).body(message)
    }

    func sendRequest() {
        let client = ClientBuilder().build()
        let bodyBuf = Array<UInt8>(11, repeat: 0)
        let r = HttpRequestBuilder().url("http://127.0.0.1:${port}/hello").header("Connection", "close").build()
        let real = client.send(r)

        real.body.read(bodyBuf)

        sleep(Duration.millisecond * 100)
        let contentLength = real.headers.getFirst("content-length") ?? ""

        @Expect(contentLength, "11")
        @Expect(bodyBuf, message.toArray())
        client.close()
    }
}
