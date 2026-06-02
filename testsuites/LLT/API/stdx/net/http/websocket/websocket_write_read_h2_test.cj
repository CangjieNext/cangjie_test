/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../tls/files
// DEPENDENCE: ../../../../asan
// DEPENDENCE: ../config
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt config/tlsconfig.cj -o tlsconfig.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle tlsconfig.%middle -o %output %cmp_utest_opt
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
import stdx.crypto.kit
import stdx.encoding.url.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.collection.*
import stdx.log.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import {asan.*, tlsconfig.*}

@Test
class TestWebSocketWriteAndReadH2 {
    let FRAMESIZE = 4 * 1024
    let server = ServerBuilder()
        .addr("127.0.0.1")
        .port(0)
        .tlsConfig(serverConfig())
        .enableConnectProtocol(true)
        .build()
    @TestCase
    func webSocketWriteAndRead(): Unit {
        spawn {startServer()}
        sleep(Duration.second)
        let client = ClientBuilder().tlsConfig(clientConfig()).build()
        client.logger.level = LogLevel.DEBUG

        let u = URL.parse("wss://127.0.0.1:${server.port}/webSocket")
        let subProtocol = ArrayList<String>(["foo1", "bar1"])

        let websocket: WebSocket
        let headers: HttpHeaders
        (websocket, headers) = WebSocket.upgradeFromClient(client, u, subProtocols: subProtocol, version: HTTP2_0)

        println("----------------------client read:----------------------")
        let websocketFrame1 = websocket.read()
        let websocketFrame2 = websocket.read()
        let websocketFrame3 = websocket.read()
        // first frame:         FIN = 0, Opcode != 0
        @Expect(websocketFrame1.fin, false)
        @Expect(websocketFrame1.frameType, TextWebFrame)
        @Expect(websocketFrame1.payload.size == FRAMESIZE)
        // intermediate frame:  FIN = 0, Opcode = 0
        @Expect(websocketFrame2.fin, false)
        @Expect(websocketFrame2.frameType, ContinuationWebFrame)
        @Expect(websocketFrame2.payload.size == FRAMESIZE)
        // last frame:          FIN = 1, Opcode = 0
        println(String.fromUtf8(websocketFrame3.payload))
        @Expect(String.fromUtf8(websocketFrame3.payload), "87654321")
        @Expect(websocketFrame3.fin, true)
        @Expect(websocketFrame3.frameType, ContinuationWebFrame)

        let textBuilder = StringBuilder()
        for (_ in 0..1025) {
            textBuilder.append("12345678")
        }
        let text = textBuilder.toString()

        websocket.write(BinaryWebFrame, text.toArray())
        println("----------------------client read:----------------------")

        sleep(Duration.millisecond * 2000)
        websocket.closeConn()
        client.close()
        server.close()
        asanGC()
        println("websocket_write_read_test_ok")
    }

    func startServer() {
        server.distributor.register("/webSocket", handler1)
        server.logger.level = LogLevel.DEBUG
        server.serve()
    }

    func handler1(ctx: HttpContext): Unit {
        let websocketServer = WebSocket.upgradeFromServer(ctx, subProtocols: ArrayList<String>(["foo", "bar", "foo1"]))

        let textBuilder = StringBuilder()
        for (_ in 0..1025) {
            textBuilder.append("87654321")
        }
        let text = textBuilder.toString()
        websocketServer.write(TextWebFrame, text.toArray())
        sleep(Duration.second)
        println("----------------------server read:----------------------")
        let websocketFrame1 = websocketServer.read()
        let websocketFrame2 = websocketServer.read()
        let websocketFrame3 = websocketServer.read()
        // first frame:         FIN = 0, Opcode != 0
        @Expect(websocketFrame1.fin, false)
        @Expect(websocketFrame1.frameType, BinaryWebFrame)
        @Expect(websocketFrame1.payload.size == FRAMESIZE)
        // intermediate frame:  FIN = 0, Opcode = 0
        @Expect(websocketFrame2.fin, false)
        @Expect(websocketFrame2.frameType, ContinuationWebFrame)
        @Expect(websocketFrame2.payload.size == FRAMESIZE)
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
websocket_write_read_test_ok
 */
