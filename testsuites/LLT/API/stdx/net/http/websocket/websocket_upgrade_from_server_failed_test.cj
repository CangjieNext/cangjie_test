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
 *      Test WebSocket#upgradeFromServerFailed
 * Test API:
 *      public static func upgradeFromServer(ctx: HttpContext, subProtocols!: ArrayList<String> = ArrayList<String>(),
                                            origins!: ArrayList<String> = ArrayList<String>(),
                                            userFunc!:(HttpRequest) -> HttpHeaders = {request: HttpRequest => HttpHeaders()}): WebSocket
 */
package tests.websocket

import stdx.net.http.*
import stdx.encoding.url.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.collection.*
import stdx.log.*

@Test
class TestWebSocketUpgradeFromServerFailed {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    @TestCase
    func webSocketUpgradeFromServerFailed(): Unit {
        spawn {startServer()}
        sleep(Duration.second)
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let u = URL.parse("http://127.0.0.1:${server.port}/webSocket")
        // invalid upgrade 1 upgrade
        let r = HttpRequestBuilder().url(u).build()
        let resp = client.send(r)
        let buf = Array<UInt8>(500, repeat: 0)
        resp.body.read(buf)

        // invalid upgrade 2 version
        var clientSocket2 = TcpSocket("127.0.0.1", server.port)
        clientSocket2.connect()
        let r2 = "GET /webSocket HTTP/1.0\r\nHost: 127.0.0.1:${server.port}\r\nUpgrade: websocket\r\nConnection: upgrade\r\nsec-websocket-key: dGhlIHNhbXBsZSBub25jZQ==\r\nsec-websocket-version: 13\r\n\r\n"
            .toArray()
        clientSocket2.write(r2)
        sleep(Duration.millisecond * 10)
        clientSocket2.read(buf)
        clientSocket2.close()

        // invalid upgrade 3 method
        let r3 = HttpRequestBuilder().method("PUT").url(u).build()
        let resp3 = client.send(r3)
        resp3.body.read(buf)

        // invalid upgrade 4 key
        var clientSocket = TcpSocket("127.0.0.1", server.port)
        clientSocket.connect()
        let r4 = "GET /webSocket HTTP/1.1\r\nHost: 127.0.0.1:${server.port}\r\nUpgrade: websocket,c\r\nConnection: upgrade\r\nsec-websocket-key: 123\r\n\r\n"
            .toArray()
        clientSocket.write(r4)
        sleep(Duration.millisecond * 10)
        let i4 = clientSocket.read(buf)
        @Expect(String.fromUtf8(buf[0..i4]).contains("connection: close\r\n"))
        clientSocket.close()

        // invalid upgrade 5 version
        clientSocket = TcpSocket("127.0.0.1", server.port)
        clientSocket.connect()
        let r5 = "GET /webSocket HTTP/1.1\r\nHost: 127.0.0.1:${server.port}\r\nUpgrade: websocket\r\nConnection: upGrade, c\r\nsec-websocket-key: dGhlIHNhbXBsZSBub25jZQ==\r\nsec-websocket-version: 12\r\n\r\n"
            .toArray()
        clientSocket.write(r5)
        sleep(Duration.millisecond * 10)
        let i5 = clientSocket.read(buf)
        @Expect(String.fromUtf8(buf[0..i5]).contains("connection: close\r\n"))
        @Expect(String.fromUtf8(buf[0..i5]).contains("sec-websocket-version: 13"))
        clientSocket.close()

        // invalid upgrade 6 upgrade
        clientSocket = TcpSocket("127.0.0.1", server.port)
        clientSocket.connect()
        let r6 = "GET /webSocket HTTP/1.1\r\nHost: 127.0.0.1:${server.port}\r\nUpgrade: websoct, c\r\nConnection: upGrade\r\n\r\n"
            .toArray()
        clientSocket.write(r6)
        sleep(Duration.millisecond * 10)
        let i6 = clientSocket.read(buf)
        @Expect(String.fromUtf8(buf[0..i6]).contains("connection: close\r\n"))
        clientSocket.close()

        // invalid upgrade 7 lacks key
        clientSocket = TcpSocket("127.0.0.1", server.port)
        clientSocket.connect()
        let r7 = "GET /webSocket HTTP/1.1\r\nHost: 127.0.0.1:${server.port}\r\nUpgrade: websocket, c\r\nConnection: upGrade\r\n\r\n"
            .toArray()
        clientSocket.write(r7)
        sleep(Duration.millisecond * 10)
        let i7 = clientSocket.read(buf)
        @Expect(String.fromUtf8(buf[0..i7]).contains("connection: close\r\n"))
        clientSocket.close()

        // invalid upgrade 8 more keys
        clientSocket = TcpSocket("127.0.0.1", server.port)
        clientSocket.connect()
        let r8 = "GET /webSocket HTTP/1.1\r\nHost: 127.0.0.1:${server.port}\r\nUpgrade: websocket, c\r\nConnection: upGrade\r\nsec-websocket-key: dGhlIHNhbXBsZSBub25jZQ==, dGhlIHNhbXBsZSBub25jZQ==\r\n\r\n"
            .toArray()
        clientSocket.write(r8)
        sleep(Duration.millisecond * 10)
        let i8 = clientSocket.read(buf)
        @Expect(String.fromUtf8(buf[0..i8]).contains("connection: close\r\n"))
        clientSocket.close()

        // invalid upgrade 9 lack version
        clientSocket = TcpSocket("127.0.0.1", server.port)
        clientSocket.connect()
        let r9 = "GET /webSocket HTTP/1.1\r\nHost: 127.0.0.1:${server.port}\r\nUpgrade: websocket, c\r\nConnection: upGrade, c\r\nsec-websocket-key: dGhlIHNhbXBsZSBub25jZQ==\r\n\r\n"
            .toArray()
        clientSocket.write(r9)
        sleep(Duration.millisecond * 10)
        let i9 = clientSocket.read(buf)
        @Expect(String.fromUtf8(buf[0..i9]).contains("connection: close\r\n"))
        clientSocket.close()

        // invalid upgrade 10 more versions
        clientSocket = TcpSocket("127.0.0.1", server.port)
        clientSocket.connect()
        let r10 = "GET /webSocket HTTP/1.1\r\nHost: 127.0.0.1:${server.port}\r\nUpgrade: websocket\r\nConnection: upGrade, c\r\nsec-websocket-key: dGhlIHNhbXBsZSBub25jZQ==\r\nsec-websocket-version: 13, 14\r\n\r\n"
            .toArray()
        clientSocket.write(r10)
        sleep(Duration.millisecond * 10)
        let i10 = clientSocket.read(buf)
        @Expect(String.fromUtf8(buf[0..i10]).contains("connection: close\r\n"))
        @Expect(String.fromUtf8(buf[0..i10]).contains("sec-websocket-version: 13"))
        clientSocket.close()

        // invalid upgrade 11 extensions
        clientSocket = TcpSocket("127.0.0.1", server.port)
        clientSocket.connect()
        let r11 = "GET /webSocket HTTP/1.1\r\nHost: 127.0.0.1:${server.port}\r\nUpgrade: websocket\r\nConnection: upGrade, c\r\nsec-websocket-key: dGhlIHNhbXBsZSBub25jZQ==\r\nsec-websocket-version: 13\r\nsec-websocket-extensions: test\r\n\r\n"
            .toArray()
        clientSocket.write(r11)
        sleep(Duration.millisecond * 10)
        let i11 = clientSocket.read(buf)
        @Expect(!String.fromUtf8(buf[0..i11]).contains("connection: close\r\n"))
        clientSocket.close()

        sleep(Duration.millisecond * 100)

        let rc = HttpRequestBuilder().url(u).header("Connection", "close").build()
        let respc = client.send(rc)
        let ic = respc.body.read(buf)
        println(String.fromUtf8(buf[0..ic]))

        client.close()
        server.close()
        println("websocket_upgrade_from_server_failed_test_ok")
    }

    func startServer() {
        server.distributor.register("/webSocket", handler1)
        server.serve()
    }

    func handler1(ctx: HttpContext): Unit {
        if (let Some(arr) <- ctx.request.headers.getFirst("connection")) {
            if (arr.contains("close")) {
                return
            }
        }
        WebSocket.upgradeFromServer(ctx)
    }
}

//ASSERT:scan Exception during process: WebSocketException: the upgrade request lacks Upgrade: websocket header field
//ASSERT:scan Exception during process: WebSocketException: the upgrade request to websocket must be an HTTP/1.1 or higher request
//ASSERT:scan Exception during process: WebSocketException: the upgrade request to websocket must be a GET request
//ASSERT:scan Exception during process: WebSocketException: the upgrade request's sec-websocket-key header value is invalid
//ASSERT:scan Exception during process: WebSocketException: the upgrade request's sec-websocket-version must be 13
//ASSERT:scan Exception during process: WebSocketException: the upgrade request lacks Upgrade: websocket header field
//ASSERT:scan Exception during process: WebSocketException: the upgrade request lacks sec-websocket-key header field
//ASSERT:scan Exception during process: WebSocketException: the upgrade request's sec-websocket-key header value is invalid
//ASSERT:scan Exception during process: WebSocketException: the upgrade request lacks sec-websocket-version header field
//ASSERT:scan Exception during process: WebSocketException: the upgrade request's sec-websocket-version must be 13
