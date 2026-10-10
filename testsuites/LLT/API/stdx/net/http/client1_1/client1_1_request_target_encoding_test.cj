/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../../../asan
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

/*
 * Test description:
 *      The request-target must preserve the percent-encoded form of the
 *      caller-provided URL (path and query) instead of the decoded one,
 *      and encoded dot-segments (%2E) must not be collapsed.
 *      See cangjie_stdx issue #227.
 * Test API:
 *      func sendRequest(request: HttpRequest): HttpResponse
 */
package tests.client1_1

import stdx.net.http.*
import asan.*
import stdx.encoding.url.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*

@Test
class TestClient1_1RequestTargetEncoding {
    let serverSocket = TcpServerSocket(bindAt: 0)

    @TestCase
    func client1_1RequestTargetEncoding(): Unit {
        serverSocket.bind()
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.millisecond * 100)
        let client = ClientBuilder().build()
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0

        // percent-encoded reserved characters in query must be sent as-is
        let u1 = URL.parse("http://127.0.0.1:${port}/p%2Fq?a=1%26b=2")
        client.send(HttpRequestBuilder().url(u1).build())

        // percent-encoded non-ASCII must be sent as-is
        let u2 = URL.parse("http://127.0.0.1:${port}/a%20b?q=%E9%9D%92")
        client.send(HttpRequestBuilder().url(u2).build())

        // encoded dot-segments (%2E%2E) must not be collapsed
        let u3 = URL.parse("http://127.0.0.1:${port}/dot/%2E%2E/x")
        client.send(HttpRequestBuilder().url(u3).build())

        // encoded CR/LF must stay encoded, never injected into the request line
        let u4 = URL.parse("http://127.0.0.1:${port}/a%0d%0aX-Injected:%20v")
        client.send(HttpRequestBuilder().url(u4).build())

        // literal dot-segments are still normalized
        let u5 = URL.parse("http://127.0.0.1:${port}/./a/../b")
        client.send(HttpRequestBuilder().url(u5).build())

        client.close()
        fut.get()
        println("request_target_encoding_test")
        asanGC()
    }

    func serverPacketCapture() {
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let buf = Array<UInt8>(500, repeat: 0)
        let cases = [
            "GET /p%2Fq?a=1%26b=2 HTTP/1.1\r\n",
            "GET /a%20b?q=%E9%9D%92 HTTP/1.1\r\n",
            "GET /dot/%2E%2E/x HTTP/1.1\r\n",
            "GET /a%0d%0aX-Injected:%20v HTTP/1.1\r\n",
            "GET /b HTTP/1.1\r\n"
        ]
        for (expected in cases) {
            let server = serverSocket.accept()
            sleep(Duration.millisecond * 100)
            let i = server.read(buf)
            let read = String.fromUtf8(buf[0..i])
            @Expect(read.contains(expected))
            @Expect(read.contains("host: 127.0.0.1:${port}\r\n"))
            server.write("HTTP/1.1 204 no content\r\nconnection: close\r\n\r\n".toArray())
            server.close()
        }
        serverSocket.close()
    }
}

/* SCAN-IN
request_target_encoding_test
 */
