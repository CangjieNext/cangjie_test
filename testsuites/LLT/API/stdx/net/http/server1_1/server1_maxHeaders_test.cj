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
 *          Test whether the server returns a 431 response after receiving a request whose headers size exceeds the value of maxRequestHeaderSize.
 * Test API:
 *       public func serve(): Unit
 */

package tests.server1_1

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
import stdx.encoding.url.URL
import std.collection.ArrayList

@Test
class TestServer11MaxHeaders {
    let server = ServerBuilder().addr("127.0.0.1").port(0).maxRequestHeaderSize(5).build()
    var port = 0u16

    @TestCase
    func maxHeadersTest(): Unit {
        startServer()
        sleep(Duration.second)
        port = server.port
        sendOverMaxHeadersRequest()
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
        let bodyBuf = Array<UInt8>(10, repeat: 0)
        let allBody = ArrayList<UInt8>()
        var readLen = ctx.request.body.read(bodyBuf)
        while (readLen > 0) {
            allBody.add(all: bodyBuf[..readLen])
            readLen = ctx.request.body.read(bodyBuf)
        }
    }

    func sendOverMaxHeadersRequest() {
        let client = ClientBuilder().build()
        let r = HttpRequestBuilder().url("http://127.0.0.1:${port}/hello").header("Connection", "close").build()
        let real = client.send(r)

        sleep(Duration.millisecond * 100)
        @Expect(real.status, UInt16(431))
        client.close()
    }
}
