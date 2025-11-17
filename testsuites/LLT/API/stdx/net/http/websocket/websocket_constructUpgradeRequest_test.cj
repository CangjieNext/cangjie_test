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
 *      Test WebSocket#UpgradeRequest
 * Test API:
 *      func constructUpgradeRequest(url: URL, webSocketKey: String,
 *             subProtocols: ArrayList<String>, headers: HttpHeaders, version: Protocol): HttpRequest
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
class TestWebSocketconstructUpgradeRequest {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()

    @TestCase
    func webSocketconstructUpgradeRequestInvalidUrl(): Unit {
        let client = ClientBuilder().build()

        let u = URL.parse("wss:///webSocket")
        try {
            WebSocket.upgradeFromClient(client, u)
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message, "Upgrade to websocket failed, no host in request URL.")
        }
        let u2 = URL.parse("http:///webSocket")
        try {
            WebSocket.upgradeFromClient(client, u2)
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message, "Upgrade to websocket failed, invalid URL scheme, the scheme must be ws or wss.")
        }
        client.close()
    }

    @TestCase
    func webSocketconstructUpgradeRequestInvalidHeader(): Unit {
        let client = ClientBuilder().build()

        let u = URL.parse("ws://127.0.0.1:80/a")
        let headers = HttpHeaders()
        headers.add("Sec-WebSocket-Extensions", "a")
        try {
            WebSocket.upgradeFromClient(client, u, headers: headers)
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message, "Upgrade to websocket failed, websocket extensions not supported yet.")
        }
        client.close()
    }

    @TestCase
    func webSocketconstructUpgradeRequestHeader(): Unit {
        spawn {startServer()}
        sleep(Duration.second)
        let client = ClientBuilder().build()
        let u = URL.parse("ws://127.0.0.1:${server.port}/webSocket")
        let headers = HttpHeaders()
        headers.add("test", "echo")
        let websocket: WebSocket
        let respHeaders: HttpHeaders
        (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u, headers: headers)
        websocket.closeConn()
        @Expect(respHeaders.getFirst("resp"), Some("echo"))
        client.close()
        server.close()
        println("websocket_construct_upgrade_request_test_ok")
    }
    func startServer() {
        server.distributor.register("/webSocket", handler1)
        server.serve()
    }

    func handler1(ctx: HttpContext): Unit {
        let websocketServer = WebSocket.upgradeFromServer(
            ctx,
            userFunc: {
                request: HttpRequest =>
                let value = request.headers.getFirst("test") ?? ""
                let headers = HttpHeaders()
                headers.add("resp", value)
                headers
            }
        )
        websocketServer.closeConn()
    }
}
/* SCAN-IN
websocket_construct_upgrade_request_test_ok
 */
