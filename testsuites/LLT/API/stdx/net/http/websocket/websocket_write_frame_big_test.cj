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
import stdx.encoding.url.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.collection.*
import stdx.log.*

@Test
class TestWebSocketWriteAndRead {
    let FRAMESIZE = 65536
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    @TestCase
    func webSocketWriteAndRead(): Unit {
        spawn {startServer()}
        sleep(Duration.second)
        let client = ClientBuilder().build()

        let u = URL.parse("ws://127.0.0.1:${server.port}/webSocket")

        let websocket: WebSocket
        let headers: HttpHeaders
        (websocket, headers) = WebSocket.upgradeFromClient(client, u)

        println("----------------------client read:----------------------")
        let websocketFrame1 = websocket.read()
        let websocketFrame3 = websocket.read()
        // first frame:         FIN = 0, Opcode != 0
        @Expect(websocketFrame1.fin, false)
        @Expect(websocketFrame1.frameType, TextWebFrame)
        @Expect(websocketFrame1.payload.size == FRAMESIZE)
        // last frame:          FIN = 1, Opcode = 0
        println(String.fromUtf8(websocketFrame3.payload))
        @Expect(String.fromUtf8(websocketFrame3.payload), "87654321")
        @Expect(websocketFrame3.fin, true)
        @Expect(websocketFrame3.frameType, ContinuationWebFrame)

        let textBuilder = StringBuilder()
        // 65536 = 8192 * 8
        for (_ in 0..8193) {
            textBuilder.append("12345678")
        }
        let text = textBuilder.toString()

        websocket.write(BinaryWebFrame, text.toArray(), frameSize: FRAMESIZE)
        println("----------------------client read:----------------------")

        sleep(Duration.millisecond * 2000)
        websocket.closeConn()
        client.close()
        server.close()
        println("websocket_write_big_test_ok")
    }

    func startServer() {
        server.distributor.register("/webSocket", handler1)
        server.serve()
    }

    func handler1(ctx: HttpContext): Unit {
        let websocketServer = WebSocket.upgradeFromServer(ctx)

        let textBuilder = StringBuilder()
        for (_ in 0..8193) {
            textBuilder.append("87654321")
        }
        let text = textBuilder.toString()
        websocketServer.write(TextWebFrame, text.toArray(), frameSize: FRAMESIZE)
        sleep(Duration.millisecond * 200)
        println("----------------------server read:----------------------")
        let websocketFrame1 = websocketServer.read()
        let websocketFrame3 = websocketServer.read()
        // first frame:         FIN = 0, Opcode != 0
        @Expect(websocketFrame1.fin, false)
        @Expect(websocketFrame1.frameType, BinaryWebFrame)
        @Expect(websocketFrame1.payload.size == FRAMESIZE)
        // last frame:          FIN = 1, Opcode = 0
        @Expect(String.fromUtf8(websocketFrame3.payload), "12345678")
        @Expect(websocketFrame3.fin, true)
        @Expect(websocketFrame3.frameType, ContinuationWebFrame)
        println(String.fromUtf8(websocketFrame3.payload))
        println("----------------------server read:----------------------")
        websocketServer.closeConn()
    }
}
/* SCAN-IN
websocket_write_big_test_ok
 */
