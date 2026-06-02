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
 *      Test Client1_1#sendrawbodyChunked
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
import std.collection.*

@Test
class TestClient1_1SendRawBodyChunked {
    let serverSocket = TcpServerSocket(bindAt: 0)

    @TestCase
    func client1_1SendRawBodyChunked(): Unit {
        let fut = spawn {serverPacketCaptureChunked()}
        sleep(Duration.millisecond * 100)
        let client = ClientBuilder().readTimeout(Duration.second * 30).build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let body = Array<UInt8>(8193, repeat: 97)
        let r = HttpRequestBuilder().url(u).header("Transfer-Encoding", "chunked").body(body).build()
        client.send(r)
        client.close()
        fut.get()
        serverSocket.close()
        println("ok")
        asanGC()
    }

    func serverPacketCaptureChunked() {
        serverSocket.bind()
        let server = serverSocket.accept()
        let buf = Array<UInt8>(10000, repeat: 0)
        sleep(Duration.millisecond * 100)
        server.write("HTTP/1.1 204 ok\r\nConnection: close\r\n\r\n".toArray())
        let resp = ArrayList<UInt8>()
        var i = server.read(buf)
        while (i != 0) {
            resp.add(all: buf[..i])
            i = server.read(buf)
        }

        let read = String.fromUtf8(resp.toArray())
        @Expect(read.contains("2000\r\n"))
        @Expect(read.contains("1\r\n"))
        @Expect(read.contains("0\r\n"))
        server.close()
    }
}

/* SCAN-IN
ok
 */
