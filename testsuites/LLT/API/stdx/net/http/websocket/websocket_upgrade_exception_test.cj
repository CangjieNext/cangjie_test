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
 *      public static func upgradeFromClient
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

@Test
class TestWebSocketUpgradeFromClientException {
    @TestCase
    func webSocketUpgradeFromClient(): Unit {
        let client = ClientBuilder().build()
        let u = URL.parse("ws://127.0.0.1:80/webSocket")
        client.close()
        try {
            WebSocket.upgradeFromClient(client, u)
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message, "This client has already closed.")
        }

        println("websocket_upgradeFromClient_exception_test_ok")
    }
}
/* SCAN-IN
websocket_upgradeFromClient_exception_test_ok
 */
