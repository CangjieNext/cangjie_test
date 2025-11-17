/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../tls/files
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
import stdx.encoding.url.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.collection.*
import stdx.log.*
import stdx.net.tls.*
import stdx.crypto.x509.*
import {asan.*, tlsconfig.*}

@Test
class TestWebSocketWriteAndReadControlFramesH2 {
    let server = ServerBuilder()
        .addr("127.0.0.1")
        .port(0)
        .enableConnectProtocol(true)
        .tlsConfig(serverConfig())
        .build()

    @TestCase
    func webSocketWriteAndReadControlFrames(): Unit {
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
        @Expect(websocketFrame1.fin, true)
        @Expect(websocketFrame1.frameType, PingWebFrame)
        @Expect(websocketFrame1.payload.size == 12)
        @Expect(String.fromUtf8(websocketFrame1.payload), "pingpingping")
        websocket.writePongFrame(websocketFrame1.payload)
        println(String.fromUtf8(websocketFrame1.payload))
        println("----------------------client read:----------------------")

        sleep(Duration.millisecond * 2000)

        client.close()
        server.close()
        asanGC()
    }

    func startServer() {
        server.distributor.register("/webSocket", handler1)
        server.serve()
    }

    func handler1(ctx: HttpContext): Unit {
        let websocketServer = WebSocket.upgradeFromServer(ctx, subProtocols: ArrayList<String>(["foo", "bar", "foo1"]))

        websocketServer.write(PingWebFrame, "pingpingping".toArray())
        websocketServer.logger.level = LogLevel.DEBUG
        sleep(Duration.millisecond * 2000)
        println("----------------------server read:----------------------")
        let websocketFrame1 = websocketServer.read()
        @Expect(websocketFrame1.fin, true)
        @Expect(websocketFrame1.frameType, PongWebFrame)
        @Expect(websocketFrame1.payload.size == 12)
        @Expect(String.fromUtf8(websocketFrame1.payload), "pingpingping")
        println(String.fromUtf8(websocketFrame1.payload))
        println("----------------------server read:----------------------")

        websocketServer.closeConn()
        println("websocket_write_read_closeframe_test_ok")
    }
}
/* SCAN-IN
websocket_write_read_closeframe_test_ok
 */
