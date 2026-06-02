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
 *          Test whether the header in the response returned by the server is correct.
 *            1、The header and value in the response are correct.
 *            2、Multiple values of the same header in a response are
 *               combined into one value and separated by commas (,).
 *            3、The value of the response header set-cookie is not sent together.
 * Test API:
 *       public func serve(): Unit
 */

package tests.server1_1

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit

import std.collection.ArrayList

@Test
class TestServer11ResponseHeader {
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
                        .header("Content-Length", "5")
                        .header("Accept-Language", "zh-CN,zh;q=0.9")
                        .header("Accept-Language", "en;q=0.8")
                        .header("set-cookie", "value1")
                        .header("set-cookie", "value2")
                        .body("hello")
                })
        spawn {
            server.serve()
        }
    }

    func sendRequest() {
        let client = ClientBuilder().build()
        let bodyBuf = Array<UInt8>(5, repeat: 0)
        let r = HttpRequestBuilder().url("http://127.0.0.1:${port}/hello").header("Connection", "close").build()
        let real = client.send(r)

        real.body.read(bodyBuf)

        let contentLength = real.headers.getFirst("content-length") ?? "0"
        @Expect(contentLength, "5")

        let acceptLanguage = real.headers.getFirst("accept-language") ?? ""
        @Expect(acceptLanguage, "zh-CN,zh;q=0.9,en;q=0.8")

        let set_cookie2 = real.headers.get("set-cookie")
        @Expect(collectionToArrayList(set_cookie2), ArrayList<String>(["value1", "value2"]))

        sleep(Duration.millisecond * 100)
        @Expect(bodyBuf, message.toArray())
        client.close()
    }
}

func collectionToArrayList(collection: Collection<String>): ArrayList<String> {
    let arr = ArrayList<String>()
    for (str in collection) {
        arr.add(str)
    }
    return arr
}
