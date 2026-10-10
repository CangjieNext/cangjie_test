/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      Test the HTTP/1.1 server enforces maxRequestBodySize on chunked request bodies.
 *      A chunked request body exceeding the configured limit must be rejected with 413,
 *      while a chunked request body within the limit is accepted.
 * Test API:
 *       public func maxRequestBodySize(size: Int64): ServerBuilder
 *       public func serve(): Unit
 */

package tests.http_chunked_body_size_limit

import stdx.net.http.*
import stdx.log.*
import std.net.TcpSocket

@Test
class TestHttpChunkedBodySizeLimit {
    let server = ServerBuilder().addr("127.0.0.1").port(0).maxRequestBodySize(1024).build()
    var port = 0u16

    @TestCase
    func chunkedBodySizeLimitTest(): Unit {
        startServer()
        sleep(Duration.millisecond * 500)
        port = server.port

        // chunked body over the limit (3 * 400 = 1200 > 1024) must be rejected with 413.
        // Before the fix the limit was ignored for chunked bodies and this returned 200.
        // chunk-data of 400 bytes uses chunk-size hex "190".
        let overResp = sendChunkedRequest("190", "a".toArray().repeat(400), 3)
        @Assert(overResp.contains("HTTP/1.1 413"))

        // chunked body within the limit (100 < 1024) must be accepted.
        // chunk-data of 100 bytes uses chunk-size hex "64".
        let okResp = sendChunkedRequest("64", "b".toArray().repeat(100), 1)
        @Assert(okResp.contains("HTTP/1.1 200"))

        sleep(Duration.millisecond * 100)
        server.close()
    }

    func startServer() {
        server.logger.level = LogLevel.WARN
        server
            .distributor
            .register("/upload", {
                ctx =>
                let buf = Array<UInt8>(512, repeat: 0)
                var total: Int64 = 0
                var n = ctx.request.body.read(buf)
                while (n > 0) {
                    total += n
                    n = ctx.request.body.read(buf)
                }
                ctx.responseBuilder.status(200).body("ok ${total}")
            })
        spawn {
            server.serve()
        }
    }

    func sendChunkedRequest(chunkSizeHex: String, chunkData: Array<UInt8>, chunkCount: Int64): String {
        let client = TcpSocket("127.0.0.1", port)
        client.connect()

        var request = "POST /upload HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nTransfer-Encoding: chunked\r\nConnection: close\r\n\r\n"
        for (_ in 0..chunkCount) {
            request += "${chunkSizeHex}\r\n"
            request += String.fromUtf8(chunkData)
            request += "\r\n"
        }
        request += "0\r\n\r\n"
        client.write(request.toArray())

        sleep(Duration.millisecond * 400)

        let allBody = StringBuilder()
        let buf = Array<UInt8>(2048, repeat: 0)
        while (true) {
            let len = client.read(buf)
            if (len == 0) {
                break
            }
            allBody.append(String.fromUtf8(buf.slice(0, len)))
            if (allBody.toString().contains("\r\n\r\n")) {
                break
            }
        }
        client.close()
        return allBody.toString()
    }
}
