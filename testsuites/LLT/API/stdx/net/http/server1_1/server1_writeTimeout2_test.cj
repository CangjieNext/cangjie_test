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
 *          Test the response writing time exceeds the writeTimeout value set by the server,
 *          the logger records the response.
 * Test API:
 *       public func writeTimeout(timeout: Duration): ServerBuilder
 */

package tests.server1_1

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
import stdx.net.tls
import stdx.crypto.kit
import stdx.encoding.url.URL
import stdx.log.*

@Test
class TestServer11WriterTimeout2 {
    let server = ServerBuilder().addr("127.0.0.1").port(0).writeTimeout(Duration.Zero).build()
    var port = 0u16
    let message = "hello world" * (1000 * 1000)

    @TestCase
    func writeTimeoutTest(): Unit {
        startServer()
        sleep(Duration.millisecond * 500)
        port = server.port
        try {
            sendRequest()
        } catch (e: Exception) {
            e.printStackTrace()
        }
        sleep(Duration.millisecond * 100)
        server.closeGracefully()
        server.closeGracefully() //Test that no abnormal behavior occurs when repeated invoking is performed.
    }

    func startServer() {
        server.logger.level = LogLevel.WARN
        server
            .distributor
            .register("/hello",
                {
                    httpContext => httpContext
                        .responseBuilder
                        .header("foo1", "bar1")
                        .header("foo2", "bar2")
                        .header("foo3", "bar3")
                        .body(message)
                })
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
