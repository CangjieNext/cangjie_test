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
 *      Test WebSocket#Close
 * Test API:
 *      public func closeConn()
 *      public func writeCloseFrame()
 *      public func read(): WebSocketFrame
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
class TestWebSocketWriteAndReadCloseFrames {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    // text.size = 124
    let text = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"

    @TestCase
    func webSocketWriteAndReadCloseFrames(): Unit {
        spawn {startServer()}
        sleep(Duration.second)
        let client = ClientBuilder().build()

        let u = URL.parse("ws://127.0.0.1:${server.port}/webSocket")
        let subProtocol = ArrayList<String>(["foo1", "bar1"])

        let websocket: WebSocket
        let headers: HttpHeaders
        (websocket, headers) = WebSocket.upgradeFromClient(client, u, subProtocols: subProtocol)

        try {
            websocket.write(CloseWebFrame, "2".toArray())
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message, "Invalid close payload.")
        }

        try {
            websocket.write(CloseWebFrame, [0u8, 232u8, 110u8, 111u8, 114u8, 109u8, 97u8, 108u8])
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message, "Invalid close status code.")
        }
        try {
            websocket.write(CloseWebFrame, ("aa" + text).toArray())
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message, "All control frames must have a payload length of 125 bytes or less.")
        }
        // send close frame by write()
        websocket.write(CloseWebFrame, Array<UInt8>())

        // recive close frame
        let websocketFrame2 = websocket.read()
        @Expect(websocketFrame2.fin, true)
        @Expect(websocketFrame2.frameType, CloseWebFrame)
        @Expect(websocketFrame2.payload.size == 0)

        websocket.closeConn()

        try {
            websocket.read()
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message, "The connection is closed.")
        }

        sleep(Duration.millisecond * 1000)
        // close connection again
        websocket.closeConn()
        // close again again
        websocket.closeConn()

        client.close()
        server.close()
        println("websocket_write_read_closeframe_test_ok")
    }

    func startServer() {
        server.distributor.register("/webSocket", handler1)
        server.serve()
    }

    func handler1(ctx: HttpContext): Unit {
        let websocketServer = WebSocket.upgradeFromServer(ctx, subProtocols: ArrayList<String>(["foo", "bar", "foo1"]))

        websocketServer.logger.level = LogLevel.DEBUG
        let websocketFrame1 = websocketServer.read()
        @Expect(websocketFrame1.fin, true)
        @Expect(websocketFrame1.frameType, CloseWebFrame)
        @Expect(websocketFrame1.payload.size == 0)

        try {
            websocketServer.writeCloseFrame(status: 200, reason: "normal")
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message, "Invalid status code.")
        }

        try {
            websocketServer.writeCloseFrame(status: 1000, reason: text)
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message, "All control frames must have a payload length of 125 bytes or less.")
        }

        websocketServer.writeCloseFrame()

        websocketServer.closeConn()
    }
}
/* SCAN-IN
websocket_write_read_closeframe_test_ok
 */
