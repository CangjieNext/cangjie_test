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
 *      Test client autoRedirect read Location
 * Test API:
 *      func doRequest(req: HttpRequest): HttpResponse
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
class TestClientReadLocation {
    let serverSocket = TcpServerSocket(bindAt: 0)

    @TestCase
    func connTestClientReadLocation(): Unit {
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.millisecond * 100)

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = "http://127.0.0.1:${port}/a"

        try {
            client.get(u)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message, "Response's Location header can only contain a single URI-reference.")
        }

        try {
            client.get(u)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message, "Response missing Location header, status code: 308.")
        }

        client.close()
        fut.get()
    }

    func serverPacketCapture() {
        serverSocket.bind()
        let server = serverSocket.accept()
        let buf = Array<UInt8>(500, repeat: 0)
        server.read(buf)
        server.write("HTTP/1.1 308 xx\r\nLocation: c\r\nLocation: a\r\nContent-length: 8\r\n\r\nredirect".toArray())
        server.read(buf)
        server.write("HTTP/1.1 308 xx\r\nLocation: \r\nContent-length: 8\r\n\r\nredirect".toArray())
        server.close()

        serverSocket.close()
    }
}
