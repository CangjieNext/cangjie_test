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
 *      Test class ServerBuilder
 *          Test when the HttpResponseWriter API is used and the response writing time exceeds
 *          the writeTimeout value set by the server, the logger records the response.
 * Test API:
 *       public func writeTimeout(timeout: Duration): ServerBuilder
 */

package tests.server1_1

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
import stdx.encoding.url.URL
import stdx.log.*

@Test
class TestServer11WriterTimeout {
    let server = ServerBuilder().addr("127.0.0.1").port(0).writeTimeout(Duration.millisecond).build()
    var port = 0u16

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
        server.logger.level = LogLevel.WARN
        server
            .distributor
            .register(
                "/hello",
                {
                    httpContext =>
                    httpContext.responseBuilder.header("transfer-encoding", "chunked")

                    let writer = HttpResponseWriter(httpContext)
                    writer.write("hello".toArray())
                    sleep(Duration.second)
                }
            )
        sleep(Duration.millisecond * 100)
        spawn {
            server.serve()
        }
    }

    func sendRequest() {
        let client = ClientBuilder().build()
        let u = URL.parse("http://127.0.0.1:${port}/hello")
        let r = HttpRequestBuilder().url(u).header("Connection", "close").build()
        client.send(r)
        client.close()
    }
}

/* SCAN-IN
write response timeout
 */
