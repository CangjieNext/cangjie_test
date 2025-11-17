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
 *      Test WebSocketFrame
 * Test API:
 *      func toWebSocketFrameBytesExceptPayload
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
import stdx.encoding.base64.*
import stdx.crypto.crypto.*

@Test
class TestWebSocketFrame {
    let FRAMESIZE = 65536
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    @TestCase
    func webSocketFrame(): Unit {
        // just for coverage
        @Expect(UnknownWebFrame.toString(), "UnknownWebFrame")

        spawn {startServer()}
        sleep(Duration.second)
        let client = ClientBuilder().build()

        let u = URL.parse("ws://127.0.0.1:${server.port}/webSocket")

        let websocket: WebSocket
        let headers: HttpHeaders
        (websocket, headers) = WebSocket.upgradeFromClient(client, u)

        let websocketFrame1 = websocket.read()
        let websocketFrame2 = websocket.read()
        // first frame:         FIN = 0, Opcode != 0
        @Expect(websocketFrame1.fin, false)
        @Expect(websocketFrame1.frameType, BinaryWebFrame)
        @Expect(websocketFrame1.payload.size == FRAMESIZE)
        // last frame:          FIN = 1, Opcode = 0
        println(String.fromUtf8(websocketFrame2.payload))
        @Expect(String.fromUtf8(websocketFrame2.payload), "a")
        @Expect(websocketFrame2.fin, true)
        @Expect(websocketFrame2.frameType, ContinuationWebFrame)

        websocket.write(BinaryWebFrame, Array<UInt8>(65537, repeat: 97), frameSize: 65536)
        sleep(Duration.millisecond * 200)
        websocket.closeConn()
        client.close()
        server.close()
        println("websocket_frame_test_ok")
    }

    func startServer() {
        server.distributor.register("/webSocket", handler1)
        server.serve()
    }

    func handler1(ctx: HttpContext): Unit {
        let websocketServer = WebSocket.upgradeFromServer(ctx)
        websocketServer.write(BinaryWebFrame, Array<UInt8>(65537, repeat: 97), frameSize: 65536)

        let websocketFrame1 = websocketServer.read()
        let websocketFrame2 = websocketServer.read()
        // first frame:         FIN = 0, Opcode != 0
        @Expect(websocketFrame1.fin, false)
        @Expect(websocketFrame1.frameType, BinaryWebFrame)
        @Expect(websocketFrame1.payload.size == FRAMESIZE)
        // last frame:          FIN = 1, Opcode = 0
        println(String.fromUtf8(websocketFrame2.payload))
        @Expect(String.fromUtf8(websocketFrame2.payload), "a")
        @Expect(websocketFrame2.fin, true)
        @Expect(websocketFrame2.frameType, ContinuationWebFrame)

        websocketServer.closeConn()
    }
}

/* SCAN-IN
websocket_frame_test_ok
 */
