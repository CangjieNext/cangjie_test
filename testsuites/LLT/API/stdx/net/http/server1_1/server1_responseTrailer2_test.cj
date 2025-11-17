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
 *      Test class Server
 *          1、If the response header contains invalid entries, the logger records
 *             the error information and returns a 500 response.
 *          2、When the HttpResponseWriter API is used and the response header contains invalid entries,
 *             the logger records the error information and returns a 500 response.
 * Test API:
 *       public func serve(): Unit
 */

package tests.server1_1

import stdx.net.http.*
import stdx.log.*
import std.collection.ArrayList
import std.net.TcpSocket

@Test
class TestServer11ResponseTrailer2 {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
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
        server.logger.level = LogLevel.DEBUG
        server
            .distributor
            .register(
                "/trailerContainCl",
                {
                    httpContext =>
                    httpContext
                        .responseBuilder
                        .header("transfer-encoding", "chunked") // 设置response头
                        .header("Trailer", "content-length")
                        .trailer("content-length", "5")
                    let writer = HttpResponseWriter(httpContext)
                    writer.write("hello".toArray())
                }
            )
        sleep(Duration.millisecond * 100)
        spawn {
            server.serve()
        }
    }

    func sendRequest() {
        var client = TcpSocket("127.0.0.1", port)
        client.connect()

        // write preface and initial settings
        let request = "GET /trailerContainCl HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nContent-Length: 20\r\nConnection: keep-alive\r\n\r\ntest illegal trailer"
            .toArray()
        client.write(request)

        sleep(Duration.millisecond * 100)

        client.close()
    }
}

/* SCAN-IN
Malformed trailer field in header.
 */
