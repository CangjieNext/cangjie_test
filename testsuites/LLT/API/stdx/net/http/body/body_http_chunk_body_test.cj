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
 *      HttpChunkedBodyProvider#readline
 * Test API:
 *      private func readLine(): String
 */

package tests.body

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
import stdx.net.tls
import std.net.*
import std.time.*
import std.sync.*
import stdx.log.*
import stdx.encoding.url.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestChunkedBodyProviderReadLine {
    let serverSocket = TcpServerSocket(bindAt: 0)
    @TestCase
    func testChunkedBodyProviderRead(): Unit {
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.millisecond * 100)
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let resp = client.get("http://127.0.0.1:${port}/a")
        let buf = Array<UInt8>(500, repeat: 0)
        var i = 0
        try {
            do {
                i = resp.body.read(buf)
                println(String.fromUtf8(buf[..i]))
            } while (i != 0)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message, "ReadLine too long.")
        }

        fut.get()
        client.close()
    }
    func serverPacketCapture() {
        serverSocket.bind()
        let server = serverSocket.accept()
        let buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 100)
        server.read(buf)
        server.write("HTTP/1.1 200 ok\r\nconnection: close\r\ntransfer-encoding: chunked\r\n\r\n".toArray())
        server.write("10\r\n1234567890123456\r\n2\r\n12\r\n0\r\n".toArray())
        server.write(Array<UInt8>(8 * 1000 * 1024, repeat: 0))
        server.write("\r\n".toArray())
        server.close()
        serverSocket.close()
    }

    @TestCase
    func testChunkedBodyProviderReadLineServer(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server
            .distributor
            .register(
                "/hello",
                {
                    ctx =>
                    let buf = Array<UInt8>(500, repeat: 0)
                    ctx.request.body.read(buf)
                    ctx.responseBuilder.header("content-length", "5").header("connection", "close").body("hello")
                }
            )

        spawn {server.serve()}
        sleep(Duration.second)
        let port = server.port
        let client = TcpSocket("127.0.0.1", port)
        client.connect()
        client.write("GET /hello HTTP/1.1\r\nhost: 127.0.0.1:${port}\r\ntransfer-encoding: chunked\r\n\r\n".toArray())
        client.write("10\r\n1234567890123456\r\n2\r\n12\r\n0\r\n".toArray())
        client.write(Array<UInt8>(8 * 1000 * 1024, repeat: 0))
        client.write("\r\n".toArray())
        sleep(Duration.second)
        let buf = Array<UInt8>(500, repeat: 0)
        let i = client.read(buf)

        @Expect(String.fromUtf8(buf[..i]).contains("400 Bad Request"))

        client.close()

        let client2 = TcpSocket("127.0.0.1", port)
        client2.connect()
        client2.write("GET /hello HTTP/1.1\r\nhost: 127.0.0.1:${port}\r\ntransfer-encoding: chunked\r\n\r\n".toArray())
        client2.write("10\r\n1234567890123456\r\n2\r\n12\r\n0\r\n".toArray())
        client2.write("a\rc: 22\r\n".toArray())
        client2.write("\r\n".toArray())
        sleep(Duration.second)
        let i2 = client2.read(buf)
        @Expect(String.fromUtf8(buf[..i2]).contains("400 Bad Request"))

        client2.close()
        server.close()
    }
}
