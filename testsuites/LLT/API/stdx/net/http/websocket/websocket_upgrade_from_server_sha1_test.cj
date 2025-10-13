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
 *      Test WebSocket#upgradeFromServerFailed
 * Test API:
 *      public static func upgradeFromServer(ctx: HttpContext, subProtocols!: ArrayList<String> = ArrayList<String>(),
                                            origins!: ArrayList<String> = ArrayList<String>(),
                                            userFunc!:(HttpRequest) -> HttpHeaders = {request: HttpRequest => HttpHeaders()}): WebSocket
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
class TestWebSocketUpgradeFromServerSha1 {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    @TestCase
    func webSocketUpgradeFromServerSha1(): Unit {
        spawn {startServer()}
        sleep(Duration.second)
        let clientSocket = TcpSocket("127.0.0.1", server.port)
        clientSocket.connect()
        let r = "GET /webSocket HTTP/1.1\r\nHost: 127.0.0.1:${server.port}\r\nUpgrade: websocket\r\nConnection: upgrade\r\nSec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==\r\nSec-WebSocket-Version: 13\r\n\r\n"
            .toArray()
        clientSocket.write(r)
        sleep(Duration.millisecond * 10)
        let buf = Array<UInt8>(500, repeat: 0)
        let i = clientSocket.read(buf)
        let resp = String.fromUtf8(buf[..i])
        @Expect(resp.contains("sec-websocket-accept: s3pPLMBiTxaQ9kYGzzhZRbK+xOo=\r\n"))
        clientSocket.close()
        server.close()
        println("websocket_upgrade_from_server_sha1_test_ok")
    }

    func startServer() {
        server.distributor.register("/webSocket", handler1)
        server.serve()
    }

    func handler1(ctx: HttpContext): Unit {
        let webSocket = WebSocket.upgradeFromServer(ctx)
        webSocket.closeConn()
    }
}
/* SCAN-IN
websocket_upgrade_from_server_sha1_test_ok
 */
