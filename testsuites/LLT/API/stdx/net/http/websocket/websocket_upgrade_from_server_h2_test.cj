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
 *      Test WebSocket#upgradeFromServer
 * Test API:
 *      public static func upgradeFromServer(ctx: HttpContext, subProtocols!: ArrayList<String> = ArrayList<String>(),
                                            origins!: ArrayList<String> = ArrayList<String>(),
                                            userFunc!:(HttpRequest) -> HttpHeaders = {request: HttpRequest => HttpHeaders()}): WebSocket
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
class TestWebSocketUpgradeFromServerH2 {
    let server = ServerBuilder()
        .addr("127.0.0.1")
        .port(0)
        .tlsConfig(serverConfig())
        .enableConnectProtocol(true)
        .build()
    @TestCase
    func webSocketUpgradeFromServer(): Unit {
        spawn {startServer()}
        sleep(Duration.second)
        let client = ClientBuilder().tlsConfig(clientConfig()).build()

        let u = URL.parse("wss://127.0.0.1:${server.port}/webSocket")
        let subProtocol = ArrayList<String>(["foo1", "bar1"])

        let websocket: WebSocket
        let headers: HttpHeaders
        (websocket, headers) = WebSocket.upgradeFromClient(client, u, subProtocols: subProtocol, version: HTTP2_0)
        println("client " + websocket.subProtocol)
        @Expect(websocket.subProtocol, "foo1")

        let websocketFrame = websocket.read()
        @Expect(String.fromUtf8(websocketFrame.payload), "hello, client!")
        @Expect(websocketFrame.fin, true)
        @Expect(websocketFrame.frameType, TextWebFrame)
        println(String.fromUtf8(websocketFrame.payload))
        websocket.write(BinaryWebFrame, "hello, server!!".toArray())

        // closeConn
        websocket.closeConn()

        sleep(Duration.millisecond * 1000)
        client.close()
        server.close()
        asanGC()
        println("websocket_upgrade_from_server_test_ok")
    }

    func startServer() {
        server.distributor.register("/webSocket", handler1)
        server.serve()
    }

    func handler1(ctx: HttpContext): Unit {
        let websocketServer = WebSocket.upgradeFromServer(ctx, subProtocols: ArrayList<String>(["foo", "bar", "foo1"]))
        @Expect(websocketServer.subProtocol, "foo1")
        println("server " + websocketServer.subProtocol)
        websocketServer.write(TextWebFrame, "hello, client!".toArray())
        let websocketFrame = websocketServer.read()
        @Expect(String.fromUtf8(websocketFrame.payload), "hello, server!!")
        @Expect(websocketFrame.fin, true)
        @Expect(websocketFrame.frameType, BinaryWebFrame)
        println(String.fromUtf8(websocketFrame.payload))
    }
}
/* SCAN-IN
websocket_upgrade_from_server_test_ok
 */
