/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
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
 *      Test Client1_1#receiveContentLengthBody
 * Test API:
 *      public func request(request: HttpRequest): HttpResponse
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
import stdx.log.*

@Test
class TestClient1_1ReceiveBodyUntilClose {
    let serverSocket = TcpServerSocket(bindAt: 0)

    @TestCase
    func client1_1ReceiveBodyUntilClose(): Unit {
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.millisecond * 10)

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder().url(u).build()
        let response = client.send(r)
        @Expect(response.toString().contains("HTTP/1.1 200 OK\r\n"))
        // read response body
        let buf = Array<UInt8>(2, repeat: 0)
        var i = response.body.read(buf)
        @Expect(i, 2)
        @Expect(String.fromUtf8(buf[0..i]), "ab")
        let buf2 = Array<UInt8>(122, repeat: 0)
        i = response.body.read(buf2)
        @Expect(i, 42)
        @Expect(String.fromUtf8(buf2[0..i]), "cdefghijklmnopqHTTPHTTP/1.1 204 ok\r\n\r\nabcd")
        // conn is closed, no more data
        i = response.body.read(buf2)
        @Expect(i, 0)

        client.close()
        fut.get()
        serverSocket.close()
        println("ok")
        asanGC()
    }

    func serverPacketCapture() {
        serverSocket.bind()
        let server = serverSocket.accept()
        let buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 10)
        server.read(buf)
        server.write("HTTP/1.1 200 ok\r\n\r\nabcdefghijklmnopqHTTPHTTP/1.1 204 ok\r\n\r\nabcd".toArray())
        sleep(Duration.millisecond * 100)
        server.close()
    }
}

/* SCAN-IN
ok
 */
