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
 *      Test WebSocket#writeFrame
 * Test API:
 *      public func write(frameType: WebSocketFrameType, byteArray: Array<UInt8>): Unit
 */
package tests.websocket

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
import stdx.encoding.url.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.collection.*
import stdx.log.*

@Test
class TestWebSocketWriteFrameException {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()

    @TestCase
    func webSocketWriteFrameException(): Unit {
        spawn {startServer()}
        sleep(Duration.second)

        let client = ClientBuilder().build()
        let u = URL.parse("ws://127.0.0.1:${server.port}/webSocket")
        let websocket: WebSocket
        let respHeaders: HttpHeaders
        (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u)
        client.close()

        try {
            websocket.write(PingWebFrame, Array<UInt8>(126, repeat: 0))
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message, "All control frames must have a payload length of 125 bytes or less.")
        }

        try {
            websocket.write(UnknownWebFrame, "hello".toArray())
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message, "Invalid frame type, the type must be Text, Binary, Close, Ping, Pong.")
        }

        websocket.write(TextWebFrame, "hello".toArray())
        websocket.closeConn()
        server.close()
        println("websocket_write_exception_test_ok")
    }
    func startServer() {
        server.distributor.register("/webSocket", handler1)
        server.serve()
    }
    func handler1(ctx: HttpContext): Unit {
        let websocketServer = WebSocket.upgradeFromServer(ctx)
        let websocketFrame1 = websocketServer.read()
        @Expect(String.fromUtf8(websocketFrame1.payload), "hello")
        websocketServer.closeConn()
    }
}
/* SCAN-IN
websocket_write_exception_test_ok
 */
