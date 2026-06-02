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
 *      Test upgrade response
 * Test API:
 *      public func upgrade(req: HttpRequest): (HttpResponse, ?StreamingSocket)
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
import std.io.*

@Test
class TestConnNodeSendRequestUPGRADE5 {
    let serverSocket = TcpServerSocket(bindAt: 0)
    var svr: ?TcpSocket = None
    @TestCase
    func ConnNodeSendRequestUPGRADE5(): Unit {
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG

        let fut = spawn {serverPacketCapture()}
        sleep(Duration.millisecond * 100)

        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder().url(u).header("upgrade", "foo").build()

        let (_, conn) = client.upgrade(r)
        let buf = Array<UInt8>(500, repeat: 0)

        let c = conn.getOrThrow()
        let server = svr.getOrThrow()
        println(c)
        @Expect(c.remoteAddress, server.localAddress)
        @Expect(c.localAddress, server.remoteAddress)
        c.readTimeout = Duration.second
        println(c.readTimeout)
        c.writeTimeout = Duration.second
        println(c.writeTimeout)
        try {
            c.read(buf)
            @Expect(1, 2)
        } catch (e: SocketTimeoutException) {}
        fut.get()

        client.close()
        c.close()
        server.close()

        println("send_request_UPGRADE5_test")
    }
    func serverPacketCapture() {
        serverSocket.bind()
        let server = serverSocket.accept()
        svr = server
        let buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 100)
        server.read(buf)
        server.write("HTTP/1.1 101 ok\r\n\r\n".toArray())
        sleep(Duration.second * 2)

        serverSocket.close()
    }
}

/* SCAN-IN
send_request_UPGRADE5_test
 */
