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
 *      func parseUpgradeRequest1_1(ctx: HttpContext): String
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
class TestWebSocketParseUpgradeRequest1_1 {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    @TestCase
    func webSocketParseUpgradeRequest1_1(): Unit {
        spawn {startServer()}
        sleep(Duration.second)

        var clientSocket = TcpSocket("127.0.0.1", server.port)
        clientSocket.connect()
        var r = "GET /webSocket HTTP/1.0\r\nHost: 127.0.0.1:${server.port}\r\nUpgrade: websocket\r\nConnection: upgrade\r\nSec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==\r\n\r\n"
            .toArray()
        clientSocket.write(r)
        sleep(Duration.millisecond * 10)
        let buf = Array<UInt8>(500, repeat: 0)
        let i = clientSocket.read(buf)
        @Expect(String.fromUtf8(buf[0..i]).contains("connection: close\r\n"))
        clientSocket.close()

        clientSocket = TcpSocket("127.0.0.1", server.port)
        clientSocket.connect()
        r = "GET /webSocket HTTP/1.1\r\nHost: 127.0.0.1:${server.port}\r\nUpgrade: websocket\r\nConnection: upgrade\r\nSec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==\r\n\r\n"
            .toArray()
        clientSocket.write(r)
        sleep(Duration.millisecond * 20)
        let i2 = clientSocket.read(buf)
        println(String.fromUtf8(buf[0..i2]))
        @Expect(String.fromUtf8(buf[0..i2]).contains("connection: close\r\n"))
        clientSocket.close()

        clientSocket = TcpSocket("127.0.0.1", server.port)
        clientSocket.connect()
        r = "GET /webSocket HTTP/1.1\r\nHost: 127.0.0.1:${server.port}\r\nUpgrade: websocket\r\nConnection: upgrade\r\nSec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==\r\nOrigin: foo, bar\r\n\r\n"
            .toArray()
        clientSocket.write(r)
        sleep(Duration.millisecond * 20)
        let i3 = clientSocket.read(buf)
        println(String.fromUtf8(buf[0..i3]))
        @Expect(String.fromUtf8(buf[0..i3]).contains("connection: close\r\n"))
        clientSocket.close()

        clientSocket = TcpSocket("127.0.0.1", server.port)
        clientSocket.connect()
        r = "GET /webSocket HTTP/1.1\r\nHost: 127.0.0.1:${server.port}\r\nUpgrade: websocket\r\nConnection: upgrade\r\nSec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==\r\nOrigin: foo1\r\n\r\n"
            .toArray()
        clientSocket.write(r)
        sleep(Duration.millisecond * 20)
        let i4 = clientSocket.read(buf)
        println(String.fromUtf8(buf[0..i4]))
        @Expect(String.fromUtf8(buf[0..i4]).contains("connection: close\r\n"))
        clientSocket.close()

        clientSocket = TcpSocket("127.0.0.1", server.port)
        clientSocket.connect()
        r = "GET /webSocket HTTP/1.1\r\nHost: 127.0.0.1:${server.port}\r\nUpgrade: websocket\r\nConnection: upgrade\r\nSec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==\r\nOrigin: foo\r\nSec-WebSocket-Version: 10, 11\r\n\r\n"
            .toArray()
        clientSocket.write(r)
        sleep(Duration.millisecond * 20)
        let i5 = clientSocket.read(buf)
        println(String.fromUtf8(buf[0..i5]))
        @Expect(String.fromUtf8(buf[0..i5]).contains("connection: close\r\n"))
        clientSocket.close()

        clientSocket = TcpSocket("127.0.0.1", server.port)
        clientSocket.connect()
        // no Host header
        r = "GET /webSocket HTTP/1.1\r\nUpgrade: websocket\r\nConnection: upgrade\r\nSec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==\r\nOrigin: foo\r\nSec-WebSocket-Version: 10, 11\r\n\r\n"
            .toArray()
        clientSocket.write(r)
        sleep(Duration.millisecond * 20)
        let i6 = clientSocket.read(buf)
        println(String.fromUtf8(buf[0..i6]))
        @Expect(String.fromUtf8(buf[0..i6]).contains("connection: close\r\n"))
        clientSocket.close()

        let client = ClientBuilder().build()
        let u = URL.parse("ws://127.0.0.1:${server.port}/webSocket")
        let headers = HttpHeaders()
        headers.add("origin", "foo")
        let (websocket, _) = WebSocket.upgradeFromClient(client, u, headers: headers)
        websocket.write(TextWebFrame, "hello".toArray())
        websocket.closeConn()

        server.close()
        println("websocket_parse_upgrade_request_test_ok")
    }

    func startServer() {
        server.distributor.register("/webSocket", handler1)
        server.serve()
    }
    func handler1(ctx: HttpContext): Unit {
        let websocket = WebSocket.upgradeFromServer(ctx, origins: ArrayList<String>(["foo", "bar"]))
        @Expect(String.fromUtf8(websocket.read().payload), "hello")
        websocket.closeConn()
    }
}
//ASSERT:scan Exception during process: WebSocketException: the upgrade request to websocket must be an HTTP/1.1 or higher request
//ASSERT:scan Exception during process: WebSocketException: the upgrade request lacks Origin field
//ASSERT:scan Exception during process: WebSocketException: the upgrade request's origin is not allowed by server
//ASSERT:scan Exception during process: WebSocketException: the upgrade request's origin is not allowed by server
//ASSERT:scan Exception during process: WebSocketException: the upgrade request's sec-websocket-version must be 13
