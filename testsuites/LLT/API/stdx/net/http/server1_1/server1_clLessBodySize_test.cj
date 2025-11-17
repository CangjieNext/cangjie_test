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
 *          Test when responsewrote body size more than declared content-length, the body is truncated to the size of content-length.
 * Test API:
 *       public func serve(): Unit
 */

package tests.server1_1

import stdx.net.http.*

@Test
class TestServer11ClLessBodySize {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16
    let message = "hello world nihao"

    @TestCase
    func lessTest(): Unit {
        startServer()
        sleep(Duration.millisecond * 500)
        port = server.port
        sendRequest()
        sleep(Duration.millisecond * 100)
        server.close()
    }

    func startServer() {
        server
            .distributor
            .register("/less", {
                httpContext => httpContext.responseBuilder.header("content-length", "11").body(message)
            })
        server
            .distributor
            .register("/equal", {
                httpContext => httpContext.responseBuilder.header("content-length", "17").body(message)
            })
        sleep(Duration.millisecond * 100)
        spawn {
            server.serve()
        }
    }

    func sendRequest() {
        let client = ClientBuilder().build()
        let bodyBuf1 = Array<UInt8>(20, repeat: 0)
        let r1 = HttpRequestBuilder().url("http://127.0.0.1:${port}/less").header("Connection", "close").build()
        let less = client.send(r1)
        less.body.read(bodyBuf1)
        @Expect(String.fromUtf8(bodyBuf1.slice(0,11)), "hello world")
        @Expect(bodyBuf1.slice(12,8), Array<UInt8>(8, repeat: 0))

        let bodyBuf2 = Array<UInt8>(17, repeat: 0)
        let r2 = HttpRequestBuilder().url("http://127.0.0.1:${port}/equal").header("Connection", "close").build()
        let equal = client.send(r2)
        equal.body.read(bodyBuf2)
        @Expect(String.fromUtf8(bodyBuf2), message)
        client.close()
    }
}
