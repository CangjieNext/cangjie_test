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
 *      Test Client1_1#sendrawbody
 * Test API:
 *      public func request(request: HttpRequest): HttpResponse
 */
package tests.client1_1

import stdx.net.http.*
import stdx.encoding.url.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import stdx.log.*

@Test
class TestClient1_1SendBodyBig {
    let serverSocket = TcpServerSocket(bindAt: 0)

    @TestCase
    func client1_1SendBodyContentLength(): Unit {
        let fut = spawn {serverPacketCaptureContentLength()}
        sleep(Duration.millisecond * 100)
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let sixtyFourM = 64 * 1024 * 1024
        let r = HttpRequestBuilder()
            .url(u)
            .header("Host", "huawei.com")
            .header("content-length", "${sixtyFourM}")
            .body(Array<Byte>(sixtyFourM, repeat: 97))
            .build()
        let resp = client.send(r)
        println(resp)
        let buf = Array<Byte>(500, repeat: 0)
        let i = resp.body.read(buf)
        @Expect(String.fromUtf8(buf[..i]), "hello")
        client.close()
        fut.get()
        serverSocket.close()
    }

    func serverPacketCaptureContentLength() {
        serverSocket.bind()
        let server = serverSocket.accept()
        server.write("HTTP/1.1 200 ok\r\nconnection: close\r\ncontent-length: 5\r\n\r\nhello".toArray())
        sleep(Duration.millisecond * 100)
        server.close()
    }
}
