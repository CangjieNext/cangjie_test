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
import stdx.net.tls.*
import stdx.crypto.x509.*
import stdx.encoding.url.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.collection.*
import stdx.log.*
import {asan.*, tlsconfig.*}

@Test
class TestWebSocketWSS {
    @TestCase
    func webSocketWSSFailed(): Unit {
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let u = URL.parse("wss://127.0.0.1:80/webSocket")
        let websocket: WebSocket
        let headers: HttpHeaders
        try {
            (websocket, headers) = WebSocket.upgradeFromClient(client, u)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message, "TLS must be configured when HTTPS requests are sent.")
        }
        client.close()
        println("websocket_tls_test_ok")
    }

    var serverZ: ?Server = None
    func startServer() {
        var cfg = serverConfig()
        cfg.supportedAlpnProtocols = ["http/1.1"]
        let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(cfg).build()
        server.distributor.register("/webSocket", handler1)
        serverZ = server
        server.serve()
    }

    func handler1(ctx: HttpContext): Unit {
        let websocketServer = WebSocket.upgradeFromServer(ctx)
        websocketServer.write(TextWebFrame, "hello".toArray())
        websocketServer.closeConn()
    }
    @TestCase
    func webSocketWSS(): Unit {
        spawn {startServer()}
        sleep(Duration.second)
        var clientCfg = clientConfig()
        clientCfg.alpnProtocolsList = ["http/1.1"]
        let client = ClientBuilder().tlsConfig(clientCfg).build()
        client.logger.level = LogLevel.DEBUG
        println(serverZ?.port)
        let u = URL.parse("wss://127.0.0.1:${(serverZ?.port).getOrThrow()}/webSocket")
        let websocket: WebSocket
        (websocket, _) = WebSocket.upgradeFromClient(client, u)
        let f = websocket.read()
        @Expect(String.fromUtf8(f.payload), "hello")
        websocket.closeConn()
        client.close()
        serverZ?.close()
        asanGC()
        println("websocket_tls_test_ok")
    }
}
/* SCAN-IN
websocket_tls_test_ok
 */
