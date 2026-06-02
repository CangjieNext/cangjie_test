/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan close_begin_connNum: 0

/*
 * Test description:
 *      Test WebSocket#Redirect
 * Test API:
 *      public static func upgradeFromClient
 */
package tests.websocket

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
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
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    @TestCase
    func webSocketRedirect(): Unit {
        spawn {startServer()}
        sleep(Duration.second)
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG

        let u = URL.parse("ws://127.0.0.1:${server.port}/r")

        let websocket: WebSocket
        let headers: HttpHeaders
        (websocket, headers) = WebSocket.upgradeFromClient(client, u)
        let f = websocket.read()
        println(String.fromUtf8(f.payload))
        websocket.closeConn()
        client.close()
        server.close()
        println("websocket_redirect_test_ok")
    }

    func startServer() {
        server.distributor.register("/webSocket", handler1)
        server.distributor.register("/r", handler2)
        server.serve()
    }

    func handler1(ctx: HttpContext): Unit {
        let websocketServer = WebSocket.upgradeFromServer(ctx)
        websocketServer.write(TextWebFrame, "hello".toArray())
        websocketServer.closeConn()
    }
    func handler2(ctx: HttpContext): Unit {
        ctx.responseBuilder.status(308).header("location", "http://127.0.0.1:${server.port}/webSocket")
    }
}
