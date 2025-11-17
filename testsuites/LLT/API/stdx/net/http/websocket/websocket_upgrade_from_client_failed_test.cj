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
class TestWebSocketUpgradeFromClientFailed {
    let serverSocket = TcpServerSocket(bindAt: 0)

    @TestCase
    func webSocketUpgradeFromClientFailed(): Unit {
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.millisecond * 100)
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("ws://127.0.0.1:${port}/a")
        let subProtocol = ArrayList<String>(["foo", "bar"])
        try {
            let websocket: WebSocket
            let headers: HttpHeaders
            (websocket, headers) = WebSocket.upgradeFromClient(client, u, subProtocols: subProtocol)
        } catch (e: WebSocketException) {
            @Expect(e.message, "Upgrade to websocket failed, the status code should be 101, but received 200.")
        }

        let uc = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder().url(uc).header("Connection", "close").build()

        let resp = client.send(r)
        let buf = Array<UInt8>(4096, repeat: 0)
        let i = resp.body.read(buf)
        @Expect(String.fromUtf8(buf[0..i]), "hello")

        client.close()
        fut.get()
        serverSocket.close()
        println("websocket_upgrade_from_client_failed_test_ok")
    }

    func serverPacketCapture() {
        serverSocket.bind()
        // not 101
        let server = serverSocket.accept()
        let buf = Array<UInt8>(4096, repeat: 0)
        let i = server.read(buf)
        let req = String.fromUtf8(buf[0..i])
        println(req)
        server.write("HTTP/1.1 200 ok\r\nContent-Length: 5\r\n\r\nhello".toArray())
        server.close()

        let server2 = serverSocket.accept()
        server2.write("HTTP/1.1 200 ok\r\nContent-Length: 5\r\n\r\nhello".toArray())
        server2.close()
    }
}

/* SCAN-IN
websocket_upgrade_from_client_failed_test_ok
 */
