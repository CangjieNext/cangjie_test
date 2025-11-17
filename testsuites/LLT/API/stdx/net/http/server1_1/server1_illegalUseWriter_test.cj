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
 *       Test class HttpResponseWriter
 *            1、Response body is correctly written after a user invokes the write function.
 *            2、Response trailers is correctly written after a user invokes the write function.
 * Test API:
 *       public func write(buf: Array<Byte>): Unit
 */

package tests.server1_1

import stdx.net.http.*
import stdx.log.*

@Test
class TestServer11illegalUseWriter {
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
        server.logger.level = LogLevel.DEBUG

        server
            .distributor
            .register(
                "/versionTest",
                {
                    httpContext =>
                    httpContext
                        .responseBuilder
                        .version(HTTP1_0)
                        .header("transfer-encoding", "chunked") // 设置response头
                        .header("Trailer", "hero")
                        .trailer("hero", "GG BOND")
                    let writer = HttpResponseWriter(httpContext)
                    writer.write(message.toArray())
                }
            )
        sleep(Duration.millisecond * 100)
        spawn {
            server.serve()
        }
    }

    func sendRequest() {
        let client = ClientBuilder().build()

        let u = "http://127.0.0.1:${port}/versionTest"
        let real = client.get(u)

        sleep(Duration.millisecond * 100)
        @Expect(real.status == 500)

        client.close()
    }
}

/* SCAN-IN
The body cannot be sent in chunked mode in HTTP/1.0
 */
