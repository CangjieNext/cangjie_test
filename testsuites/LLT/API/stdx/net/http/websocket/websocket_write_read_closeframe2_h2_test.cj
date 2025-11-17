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
import stdx.net.tls.*
import stdx.crypto.x509.*
import {asan.*, tlsconfig.*}

@Test
class TestWebSocketWriteAndReadCloseFrames2H2 {
    let server = ServerBuilder()
        .addr("127.0.0.1")
        .port(0)
        .enableConnectProtocol(true)
        .tlsConfig(serverConfig())
        .build()

    @TestCase
    func webSocketWriteAndReadCloseFrames2(): Unit {
        spawn {startServer()}
        sleep(Duration.second)
        let client = ClientBuilder().tlsConfig(clientConfig()).build()
        client.logger.level = LogLevel.DEBUG

        let u = URL.parse("wss://127.0.0.1:${server.port}/webSocket")
        let subProtocol = ArrayList<String>(["foo1", "bar1"])

        let websocket: WebSocket
        let headers: HttpHeaders
        (websocket, headers) = WebSocket.upgradeFromClient(client, u, subProtocols: subProtocol, version: HTTP2_0)

        // 1000normal
        websocket.write(CloseWebFrame, [3u8, 232u8, 110u8, 111u8, 114u8, 109u8, 97u8, 108u8])
        // recive close frame
        let websocketFrame = websocket.read()
        @Expect(websocketFrame.fin, true)
        @Expect(websocketFrame.frameType, CloseWebFrame)
        // 1000 = 3 * 256 + 232
        @Expect(websocketFrame.payload[..2], [3u8, 232u8])
        @Expect(String.fromUtf8(websocketFrame.payload[2..]), "normal")

        websocket.closeConn()
        sleep(Duration.millisecond * 1000)
        // close connection again
        websocket.closeConn()
        // close again again
        websocket.closeConn()
        client.close()
        server.close()
        asanGC()
        println("websocket_write_read_closeframe2_test_ok")
    }

    func startServer() {
        server.logger.level = LogLevel.DEBUG // set log level
        server.distributor.register("/webSocket", handler1)
        server.serve()
    }

    func handler1(ctx: HttpContext): Unit {
        let websocketServer = WebSocket.upgradeFromServer(ctx, subProtocols: ArrayList<String>(["foo", "bar", "foo1"]))

        websocketServer.logger.level = LogLevel.DEBUG
        let websocketFrame2 = websocketServer.read()
        @Expect(websocketFrame2.fin, true)
        @Expect(websocketFrame2.frameType, CloseWebFrame)
        @Expect(websocketFrame2.payload[..2], [3u8, 232u8])
        @Expect(String.fromUtf8(websocketFrame2.payload[2..]), "normal")

        websocketServer.writeCloseFrame(status: 1000, reason: "normal")

        websocketServer.closeConn()
    }
}
/* SCAN-IN
websocket_write_read_closeframe2_test_ok
 */
