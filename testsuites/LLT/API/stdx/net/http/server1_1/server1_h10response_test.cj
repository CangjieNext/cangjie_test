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
 *          Test when user send a response whose protocol is HTTP/1.0,
 *          will automatically converts the response to HTTP/1.1 and generates a log.
 * Test API:
 *       public func serve(): Unit
 */

package tests.server1_1

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit

import std.net.TcpSocket

@Test
class TestServer11Http10rResponse {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16
    let body = "hello world"

    @TestCase
    func h10responseTest(): Unit {
        startServer()
        sleep(Duration.millisecond * 100)
        port = server.port
        sendRequest()
        sleep(Duration.millisecond * 100)
        server.close()
    }

    func startServer() {
        server.distributor.register("/hello", {
            httpContext => httpContext.responseBuilder.version(HTTP1_0).body(body)
        })
        sleep(Duration.millisecond * 100)
        spawn {
            server.serve()
        }
    }

    func sendRequest() {
        // connect
        var socket = TcpSocket("127.0.0.1", port)
        socket.connect()

        // write preface and initial settings
        let preface = "GET /hello HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nTransfer-encoding: chunked\r\nConnection: close\r\n\r\n0\r\n\r\n"
            .toArray()
        socket.write(preface)

        sleep(Duration.millisecond * 300)

        let arr = Array<UInt8>(1000, repeat: 0)
        let len = socket.read(arr)
        let resp = String.fromUtf8(arr.slice(0, len))
        println(resp)
        @Expect(resp.contains("HTTP/1.1"))
        @Expect(!resp.contains("HTTP/1.0"))
        @Expect(resp.contains("hello world"))

        socket.close()
    }
}

/* SCAN-IN
HTTP/1.0 response is not supported
 */
