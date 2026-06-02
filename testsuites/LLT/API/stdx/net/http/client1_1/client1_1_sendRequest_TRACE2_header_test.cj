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
 *      Test ConnNode#sendRequest
 * Test API:
 *      func sendRequest(request: HttpRequest): HttpResponse
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
class TestConnNodeSendRequestTRACE2 {
    let serverSocket = TcpServerSocket(bindAt: 0)

    @TestCase
    func ConnNodeSendRequestTRACE2(): Unit {
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.millisecond * 100)
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")

        let r = HttpRequestBuilder().trace().url(u).header("content-Length", "20").build()
        try {
            client.send(r)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message, "The TRACE request cannot contain content.")
        }

        let r2 = HttpRequestBuilder()
            .trace()
            .url(u)
            .header("content-Length", "20")
            .header("Transfer-Encoding", "chunked")
            .build()
        try {
            client.send(r2)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message, "The content-length and transfer-encoding can not be set together.")
        }

        let r3 = HttpRequestBuilder().trace().url(u).header("Transfer-Encoding", "chunked").build()
        try {
            client.send(r3)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message, "The TRACE request cannot contain content.")
        }

        let r4 = HttpRequestBuilder().trace().url(u).build()

        let rsp = client.send(r4)
        @Expect(rsp.toString().contains("204"))

        let r5 = HttpRequestBuilder().trace().url(u).header("content-Length", "0").build()
        let rsp2 = client.send(r5)
        @Expect(rsp2.toString().contains("204"))

        client.close()
        serverSocket.close()
        fut.get()
    }

    func serverPacketCapture() {
        serverSocket.bind()
        let buf = Array<UInt8>(500, repeat: 0)
        let server = serverSocket.accept()
        let i = server.read(buf)
        println(String.fromUtf8(buf[..i]))
        server.write("HTTP/1.1 204 no content\r\n\r\n".toArray())

        sleep(Duration.second)
        let i2 = server.read(buf)
        println(String.fromUtf8(buf[..i2]))
        @Expect(String.fromUtf8(buf[..i2]).contains("\r\n0\r\n"), false)
        server.write("HTTP/1.1 204 no content\r\nconnection: close\r\n\r\n".toArray())
        sleep(Duration.second)
        server.close()
    }
}
