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
 *      Test upgrade success
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
class TestConnNodeSendRequestUPGRADE2 {
    let serverSocket = TcpServerSocket(bindAt: 0)
    @TestCase
    func ConnNodeSendRequestUPGRADE2(): Unit {
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG

        let fut = spawn {serverPacketCapture()}
        sleep(Duration.millisecond * 100)

        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder().url(u).header("upgrade", "foo").build()
        let (resp, conn) = client.upgrade(r)
        let buf = Array<UInt8>(500, repeat: 0)
        let i = resp.body.read(buf)
        @Expect(String.fromUtf8(buf[..i]), "hello")
        if (let Some(_) <- conn) {
            @Expect(1, 2)
        }
        // the same conn 200 no content
        client.upgrade(r)
        // the same conn 101
        let (_, conn2) = client.upgrade(r)
        conn2?.write("hello server".toArray())
        let i2 = conn2?.read(buf) ?? 0
        @Expect(String.fromUtf8(buf[..i2]), "hello client")

        // another conn
        let (resp3, conn3) = client.upgrade(r)
        client.close()
        println(resp3)
        conn3?.write("hello server2".toArray())
        let i3 = conn3?.read(buf) ?? 0
        @Expect(String.fromUtf8(buf[..i3]), "hello client2")

        conn2?.close()
        conn3?.close()
        client.close()
        fut.get()

        println("send_request_UPGRADE2_test")
    }
    func serverPacketCapture() {
        serverSocket.bind()
        let server = serverSocket.accept()
        let buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 100)
        server.read(buf)

        server.write("HTTP/1.1 200 ok\r\ncontent-length: 5\r\n\r\nhello".toArray())
        server.read(buf)
        server.write("HTTP/1.1 200 ok\r\ncontent-length: 0\r\n\r\n".toArray())
        server.read(buf)
        server.write("HTTP/1.1 101 s\r\n\r\n".toArray())

        let i = server.read(buf)
        let read = String.fromUtf8(buf[0..i])
        @Expect(read, "hello server")
        server.write("hello client".toArray())

        // server2
        let server2 = serverSocket.accept()
        let rs = server2.read(buf)
        @Expect(String.fromUtf8(buf[..rs]).contains("connection: upgrade\r\n"))
        server2.write("HTTP/1.1 101 s\r\n\r\n".toArray())
        let i2 = server2.read(buf)
        let read2 = String.fromUtf8(buf[0..i2])
        @Expect(read2, "hello server2")
        server2.write("hello client2".toArray())

        server.close()
        server2.close()
        serverSocket.close()
    }
}

/* SCAN-IN
send_request_UPGRADE2_test
 */
