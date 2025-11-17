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
class TestWebSocketWriteAndReadFrameSize {
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
        try {
            websocket.write(BinaryWebFrame, "hello".toArray(), frameSize: 0)
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message, "FrameSize must > 0.")
        }
        try {
            websocket.write(BinaryWebFrame, "hello".toArray(), frameSize: -22)
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message, "FrameSize must > 0.")
        }
        websocket.write(BinaryWebFrame, "hello".toArray(), frameSize: 2)
        let f = websocket.read()
        @Expect(String.fromUtf8(f.payload), "hello")
        println(String.fromUtf8(f.payload))
        websocket.closeConn()
        client.close()
        server.close()

        println("websocket_write_read_frameSize_test_ok")
    }

    func startServer() {
        server.distributor.register("/webSocket", handler1)
        server.serve()
    }

    func handler1(ctx: HttpContext): Unit {
        let websocketServer = WebSocket.upgradeFromServer(ctx)
        let data = ArrayList<UInt8>()
        var frame = websocketServer.read()
        var count = 1
        while (true) {
            match (frame.frameType) {
                case ContinuationWebFrame =>
                    data.add(all: frame.payload)
                    if (frame.fin) {
                        break
                    }
                case TextWebFrame | BinaryWebFrame =>
                    if (!data.isEmpty()) {
                        throw Exception("invalid frame")
                    }
                    data.add(all: frame.payload)
                    if (frame.fin) {
                        break
                    }
                case CloseWebFrame =>
                    websocketServer.write(CloseWebFrame, frame.payload)
                    break
                case PingWebFrame => websocketServer.writePongFrame(frame.payload)
                case _ => ()
            }
            frame = websocketServer.read()
            count++
        }
        @Expect(String.fromUtf8(data.toArray()), "hello")
        @Expect(count, 3)
        websocketServer.write(PingWebFrame, "hello".toArray(), frameSize: -2)
        websocketServer.closeConn()
    }
}
/* SCAN-IN
websocket_write_read_frameSize_test_ok
 */
