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
 *      Test WebSocket#writePingFrame thread safe
 * Test API:
 *      public func read(): WebSocketFrame
 *      public func write(frameType: WebSocketFrameType, byteArray: Array<UInt8>): Unit
 *      public func writePingFrame(byteArray: Array<UInt8>): Unit
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
class TestWebSocketWriteAndReadControlFrames2 {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    @TestCase
    func webSocketWriteAndReadControlFrames2(): Unit {
        spawn {startServer()}
        sleep(Duration.second)
        let client = ClientBuilder().readTimeout(Duration.second).build()
        client.logger.level = LogLevel.DEBUG

        let u = URL.parse("ws://127.0.0.1:${server.port}/webSocket")
        let subProtocol = ArrayList<String>(["foo1", "bar1"])

        let websocket: WebSocket
        let headers: HttpHeaders
        (websocket, headers) = WebSocket.upgradeFromClient(client, u, subProtocols: subProtocol)
        println("----------------------client read:----------------------")
        var count = 0
        while (true) {
            let websocketFrame1 = websocket.read()
            count++
            if (websocketFrame1.frameType == TextWebFrame && !websocketFrame1.fin) {
                println("----------------------first one----------------------")
            }
            if (websocketFrame1.frameType == PingWebFrame) {
                println("----------------------get it----------------------")
                // pong
                websocket.writePongFrame(websocketFrame1.payload)
                @Expect(String.fromUtf8(websocketFrame1.payload), "pingpingping")
            }
            if (websocketFrame1.frameType == ContinuationWebFrame && websocketFrame1.fin) {
                println("----------------------final one----------------------")
                @Expect(String.fromUtf8(websocketFrame1.payload), "87654321")
            }

            if (count == 202) {
                break
            }
        }
        println("----------------------client read:----------------------")
        // close
        websocket.closeConn()
        sleep(Duration.millisecond * 2000)

        client.close()
        server.close()
        println("websocket_write_read_controlframe2_test_ok")
    }

    func startServer() {
        server.distributor.register("/webSocket", handler1)
        server.serve()
    }

    func handler1(ctx: HttpContext): Unit {
        let websocketServer = WebSocket.upgradeFromServer(ctx, subProtocols: ArrayList<String>(["foo", "bar", "foo1"]))

        let textBuilder = StringBuilder()

        for (_ in 0..102401) {
            textBuilder.append("87654321")
        }
        let text = textBuilder.toString()

        spawn {
            sleep(Duration.millisecond * 1)
            websocketServer.writePingFrame("pingpingping".toArray())
        }

        websocketServer.write(TextWebFrame, text.toArray())

        websocketServer.logger.level = LogLevel.DEBUG
        sleep(Duration.millisecond * 2000)
        println("----------------------server read:----------------------")
        let websocketFrame1 = websocketServer.read()
        @Expect(websocketFrame1.fin, true)
        @Expect(websocketFrame1.frameType, PongWebFrame)
        @Expect(websocketFrame1.payload.size == 12)
        @Expect(String.fromUtf8(websocketFrame1.payload), "pingpingping")
        println("----------------------server read:----------------------")

        websocketServer.closeConn()
    }
}
/* SCAN-IN
websocket_write_read_controlframe2_test_ok
 */
