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
 *          Test process request expect: 100-cpntinue header logic is correct
 * Test API:
 *       public func serve(): Unit
 */

package tests.server1_1

import stdx.net.http.*

import std.collection.ArrayList

@Test
class TestServer11ExpectContinue {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16
    let expectBody = "test for 100-continue"

    @TestCase
    func expectBodyTest(): Unit {
        startServer()
        sleep(Duration.millisecond * 100)
        port = server.port
        sendExpectBodyRequest()
        sleep(Duration.millisecond * 100)
        server.close()
    }

    func startServer() {
        server.distributor.register("/hello", handler)
        spawn {
            server.serve()
        }
    }

    func handler(ctx: HttpContext): Unit {
        let bodyBuf = Array<UInt8>(21, repeat: 0)
        let allBody = ArrayList<UInt8>()
        var readLen = ctx.request.body.read(bodyBuf)
        while (readLen > 0) {
            allBody.add(all: bodyBuf[..readLen])
            readLen = ctx.request.body.read(bodyBuf)
        }

        @Expect(String.fromUtf8(allBody.toArray()), expectBody)
    }

    func sendExpectBodyRequest() {
        let client = ClientBuilder().build()
        let r = HttpRequestBuilder()
            .url("http://127.0.0.1:${port}/hello")
            .header("Connection", "close")
            .header("Expect", "100-continue")
            .header("Content-Length", "21")
            .body("test for 100-continue")
            .build()

        client.send(r)
        sleep(Duration.millisecond * 100)
        client.close()
    }
}
