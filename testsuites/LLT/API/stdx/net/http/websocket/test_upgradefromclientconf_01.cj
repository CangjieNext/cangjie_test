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
// RUN-EXEC: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 
/*
 * Test description:
 *      Test WebSocket
 * Test API:
 *      public static func upgradeFromClient():(WebSocket, HttpHeaders)
 */

import stdx.net.http.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import stdx.crypto.kit
import stdx.encoding.url.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.collection.*
import stdx.log.*
import tlsconfig.*

var ser = Option<WebSocket>.None
var sum = 0

@Test
class Testupgradefromclientconf_01 {
    @TestCase
    func test_07(): Unit {
        var cfg = clientConfig()
        cfg.supportedAlpnProtocols = ["h2"]
        let client = ClientBuilder().tlsConfig(cfg).build()
        let u = URL.parse("wss://127.0.0.1:77777/webSocket")
        let websocket: WebSocket
        let respHeaders: HttpHeaders
        try {
            (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u, version: HTTP2_0)
            websocket.closeConn()
        } catch (e: HttpException) {
            @Expect(e.message, "Invalid port string: 77777.")
            sum += 1
        }
        @Expect(sum, 1)
        client.close()
    }
}
