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
 *      Test WebSocket#upgradeFromClient
 * Test API:
 *      public static func upgradeFromClient(client: Client, url: URL,
                                        subProtocols!: ArrayList<String> = ArrayList<String>(),
                                        headers!: HttpHeaders = HttpHeaders()): (WebSocket, HttpHeaders)
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

@Test
class TestWebSocketUpgradeFromClientNot101 {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()

    @TestCase
    func webSocketUpgradeFromClientNot101(): Unit {
        spawn {startHttpServer()}
        sleep(Duration.millisecond * 100)
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = server.port
        // not websocket handler, nobody, 204
        let u = URL.parse("ws://127.0.0.1:${port}/a")
        for (_ in 0..11) {
            try {
                WebSocket.upgradeFromClient(client, u)
            } catch (e: WebSocketException) {
                @Expect(e.message, "Upgrade to websocket failed, the status code should be 101, but received 204.")
            }
        }

        // not websocket handler, withbody, 200
        let u2 = URL.parse("ws://127.0.0.1:${port}/b")
        for (_ in 0..11) {
            try {
                WebSocket.upgradeFromClient(client, u2)
            } catch (e: WebSocketException) {
                @Expect(e.message, "Upgrade to websocket failed, the status code should be 101, but received 200.")
            }
        }

        // upgrade to websocket success
        let u3 = URL.parse("ws://127.0.0.1:${port}/c")
        let (websocket, _) = WebSocket.upgradeFromClient(client, u3)
        let f = websocket.read()
        println(String.fromUtf8(f.payload))
        @Expect(String.fromUtf8(f.payload), "hello")
        websocket.closeConn()

        // http request to handler2 success
        let resp = client.get("http://127.0.0.1:${port}/b")
        let buf = Array<UInt8>(500, repeat: 0)
        let i = resp.body.read(buf)
        println(String.fromUtf8(buf[..i]))
        @Expect(String.fromUtf8(buf[..i]), "not websocket")

        client.close()
        server.close()
        println("websocket_upgrade_from_client_not_101_test_ok")
    }

    func startHttpServer() {
        server.distributor.register("/a", handler1)
        server.distributor.register("/b", handler2)
        server.distributor.register("/c", handler3)
        server.serve()
    }
    func handler1(ctx: HttpContext): Unit {
        ctx.responseBuilder.status(204)
    }
    func handler2(ctx: HttpContext): Unit {
        ctx.responseBuilder.status(200).body("not websocket")
    }
    func handler3(ctx: HttpContext): Unit {
        let websocketServer = WebSocket.upgradeFromServer(ctx)
        websocketServer.write(TextWebFrame, "hello".toArray())
        websocketServer.closeConn()
    }
}

/* SCAN-IN
websocket_upgrade_from_client_not_101_test_ok
 */
