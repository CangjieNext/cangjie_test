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
 *      Test ConnNode#sendRequest
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
import stdx.log.*
import std.io.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import stdx.crypto.common.*

@Test
class TestReceiveNormalBodyProvider {
    let serverSocket = TcpServerSocket(bindAt: 0)
    @TestCase
    func receiveNormalBodyProvider(): Unit {
        // start server
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.second)
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder().url(u).build()
        let resp = client.send(r)
        println(resp.toString())
        @Expect(resp.toString().contains("body size: 12"))
        let buf = Array<UInt8>(500, repeat: 0)
        let i = resp.body.read(buf)
        let read = String.fromUtf8(buf[..i])
        println(read)
        client.close()
        fut.get()
        println("receive_normalBodyProvider_test_ok")
        asanGC()
    }
    func serverPacketCapture() {
        serverSocket.bind()
        let server = serverSocket.accept()
        let buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 100)
        let i = server.read(buf)
        let read = String.fromUtf8(buf[..i])
        println(read)
        server.write("HTTP/1.1 200 ok\r\nconnection: close\r\ncontent-length: 12\r\n\r\nhello client".toArray())
        server.close()
        serverSocket.close()
    }
}

/* SCAN-IN
receive_normalBodyProvider_test_ok
 */
