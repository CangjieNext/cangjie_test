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
 *      Test WebSocket#WriteAndRead
 * Test API:
 *      public func read(): WebSocketFrame
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
class TestWebSocketWriteAndReadConnectionException {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    @TestCase
    func webSocketWriteAndReadConnectionException(): Unit {
        spawn {startServer()}
        sleep(Duration.second)
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG

        let u = URL.parse("ws://127.0.0.1:${server.port}/webSocket")
        let websocket: WebSocket
        let headers: HttpHeaders
        (websocket, headers) = WebSocket.upgradeFromClient(client, u)

        websocket.write(BinaryWebFrame, "hello".toArray())
        let websocketFrame1 = websocket.read()
        println(String.fromUtf8(websocketFrame1.payload))
        sleep(Duration.second)
        try {
            websocket.read()
            @Expect(1, 2)
        } catch (e: ConnectionException) {
            @Expect(e.message, "Socket is closed.")
        }
        try {
            websocket.read()
            @Expect(1, 2)
        } catch (e: SocketException) {
            @Expect(e.message, "Socket is already closed")
        } catch (e: ConnectionException) {
            @Expect(e.message, "Socket is closed.")
        }
        websocket.closeConn()
        client.close()
        server.close()
        println("websocket_write_read_connection_exception_test_ok")
    }

    func startServer() {
        server.distributor.register("/webSocket", handler1)
        server.serve()
    }

    func handler1(ctx: HttpContext): Unit {
        let websocketServer = WebSocket.upgradeFromServer(ctx)
        let websocketFrame1 = websocketServer.read()
        println(String.fromUtf8(websocketFrame1.payload))
        websocketServer.write(TextWebFrame, "hello".toArray())
        websocketServer.closeConn()
    }
}
/* SCAN-IN
websocket_write_read_connection_exception_test_ok
 */
