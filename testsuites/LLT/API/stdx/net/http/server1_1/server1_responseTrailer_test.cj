/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./../bodyReadUtil
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt bodyReadUtil/read.cj -o read.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f read.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      Test class Server
 *          Test that trailers can send messages accurately.
 * Test API:
 *       public func serve(): Unit
 */

package tests.server1_1

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit

import std.collection.ArrayList
import bodyReadUtil.*

@Test
class TestServer11ResponseTrailer {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16
    let message = "hello"

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
        server
            .distributor
            .register("/hello",
                {
                    httpContext => httpContext
                        .responseBuilder
                        .header("Transfer-Encoding", "chunked")
                        .header("Trailer", "lab, rfc")
                        .header("Trailer", "GGBond")
                        .body("hello")
                        .trailer("lab", "Huawei PL ")
                        .trailer("rfc", "9110")
                        .trailer("rfc", "9112")
                        .trailer("FFBond", "father")
                })
        sleep(Duration.millisecond * 100)
        spawn {
            server.serve()
        }
    }

    func sendRequest() {
        let client = ClientBuilder().build()
        let bodyBuf = Array<UInt8>(5, repeat: 0)
        let r = HttpRequestBuilder().url("http://127.0.0.1:${port}/hello").header("Connection", "close").build()
        let real = client.send(r)

        sleep(Duration.millisecond * 300)

        real.body.read(bodyBuf)

        @Expect(message.toArray(), bodyBuf)
        readAll(5, real)

        var lab = ""
        if (let Some(s) <- real.trailers.getFirst("lab")) {
            lab = s
        }
        @Expect("Huawei PL", lab)

        var rfc = real.trailers.get("rfc")
        @Expect(1, rfc.size)

        var hero1 = ""
        if (let Some(s) <- real.trailers.getFirst("GGBond")) {
            lab = s
        }

        @Expect("", hero1)
        var hero2 = ""
        if (let Some(s) <- real.trailers.getFirst("FFBond")) {
            lab = s
        }
        @Expect("", hero2)

        client.close()
    }
}
