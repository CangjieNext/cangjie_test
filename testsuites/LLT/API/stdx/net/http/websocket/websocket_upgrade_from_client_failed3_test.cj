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
 *      Test WebSocket#upgradeFromClient
 * Test API:
 *
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
    var server = ServerBuilder().addr("0.0.0.0").port(0).tlsConfig(serverConfig()).enableConnectProtocol(true).build()
    @TestCase
    func webSocketUpgradeFromClient(): Unit {
        spawn {startServer()}
        sleep(Duration.second)
        let client = ClientBuilder().tlsConfig(clientConfig()).build()
        client.logger.level = LogLevel.OFF

        let u = URL.parse("wss://127.0.0.1:${server.port}/webSocket")
        let subProtocol = ArrayList<String>(["foo1", "bar1"])

        let websocket: WebSocket
        let headers: HttpHeaders
        try {
            (websocket, headers) = WebSocket.upgradeFromClient(client, u, subProtocols: subProtocol, version: HTTP2_0)
        } catch (e: WebSocketException) {
            println(e.message)
        }
        client.close()
        server.close()
        asanGC()
    }

    func startServer() {
        server.logger.level = LogLevel.OFF // set log level
        server.distributor.register("/webSocket", handler1)
        server.serve()
    }

    func handler1(ctx: HttpContext): Unit {
        ctx.responseBuilder.status(101)
    }
}
/* SCAN-IN
Upgrade to websocket failed, the status code should be 200, but received HTTP/2.0 101 Switching Protocols
 */
