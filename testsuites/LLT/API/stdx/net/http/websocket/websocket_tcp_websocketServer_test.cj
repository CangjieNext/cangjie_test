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
class TestTcpWebSocketServer {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    @TestCase
    func tcpWebSocketServer(): Unit {
        spawn {startServer()}
        sleep(Duration.second)

        var clientSocket = TcpSocket("127.0.0.1", server.port)
        clientSocket.connect()
        var r = "GET /webSocket HTTP/1.1\r\nHost: 127.0.0.1:${server.port}\r\nUpgrade: websocket\r\nConnection: upgrade\r\nSec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==\r\nOrigin: foo\r\nSec-WebSocket-Version: 13\r\n\r\n"
            .toArray()
        clientSocket.write(r)
        sleep(Duration.millisecond * 10)
        let buf = Array<UInt8>(500, repeat: 0)
        var i = clientSocket.read(buf)
        println(String.fromUtf8(buf[..i]))
        @Expect(!String.fromUtf8(buf[..i]).contains("101"))

        r = "GET /webSocket2 HTTP/1.1\r\nHost: 127.0.0.1:${server.port}\r\nUpgrade: websocket\r\nConnection: upgrade\r\nSec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==\r\nOrigin: foo\r\nSec-WebSocket-Version: 13\r\n\r\n"
            .toArray()
        clientSocket.write(r)
        sleep(Duration.millisecond * 10)
        i = clientSocket.read(buf)
        println(String.fromUtf8(buf[..i]))

        clientSocket.close()

        server.close()
        println("websocket_tcp_websocketServer_test_ok")
    }

    func startServer() {
        server.distributor.register("/webSocket", handler1)
        server.distributor.register("/webSocket2", handler2)
        server.serve()
    }
    func handler1(ctx: HttpContext): Unit {
        ctx.responseBuilder.header("transfer-encoding", "chunked")
        let writer = HttpResponseWriter(ctx)
        writer.write("x".toArray())
        try {
            WebSocket.upgradeFromServer(ctx)
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message, "Upgrade to websocket failed, a response has been sent to the client.")
        }
    }
    func handler2(ctx: HttpContext): Unit {
        let websocket = WebSocket.upgradeFromServer(ctx)
        try {
            WebSocket.upgradeFromServer(ctx)
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message, "Upgrade to websocket failed, the connection has been upgraded.")
        }
        websocket.closeConn()
    }
}
/* SCAN-IN
websocket_tcp_websocketServer_test_ok
 */
