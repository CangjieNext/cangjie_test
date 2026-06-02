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
                                        version!: Protocol = HTTP1_1,
                                        subProtocols!: ArrayList<String> = ArrayList<String>(),
                                        headers!: HttpHeaders = HttpHeaders()): (WebSocket, HttpHeaders)
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
import stdx.encoding.base64.*

@Test
class TestWebSocketUpgradeFromClientFailed2 {
    let serverSocket = TcpServerSocket(bindAt: 0)

    @TestCase
    func webSocketUpgradeFromClientFailed2(): Unit {
        let client = ClientBuilder().build()
        let u = URL.parse("ws://127.0.0.1:80/a")
        try {
            WebSocket.upgradeFromClient(client, u, version: HTTP1_0)
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message, "Only the upgrade from HTTP1_1 and HTTP2_0 to WebSocket is supported.")
        }
        try {
            WebSocket.upgradeFromClient(client, u, version: UnknownProtocol("ooo"))
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message, "Only the upgrade from HTTP1_1 and HTTP2_0 to WebSocket is supported.")
        }

        client.close()
        serverSocket.close()
        println("websocket_upgrade_from_client_failed2_test_ok")
    }
}

/* SCAN-IN
websocket_upgrade_from_client_failed2_test_ok
 */
