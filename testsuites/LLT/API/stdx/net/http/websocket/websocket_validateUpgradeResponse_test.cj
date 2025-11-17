/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./../websocketUtil
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt websocketUtil/websocketUtil.cj -o websocketUtil.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f websocketUtil.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

/*
 * Test description:
 *      Test WebSocket#upgradeFromClient
 * Test API:
 *      func validateUpgradeResponse(resp: HttpResponse, acceptValue: String, subProtocols: ArrayList<String>): String
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
import websocketUtil.*

@Test
class TestWebSocketValidateUpgradeResponse {
    let serverSocket = TcpServerSocket(bindAt: 0)

    @TestCase
    func webSocketValidateUpgradeResponse(): Unit {
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.millisecond * 100)
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("ws://127.0.0.1:${port}/a")
        let subProtocols = ArrayList<String>(["foo1", "bar1"])
        try {
            WebSocket.upgradeFromClient(client, u)
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message, "Upgrade to websocket failed, the handshake response has a wrong Upgrade header field.")
        }
        // upgrade 2 to server 2
        try {
            WebSocket.upgradeFromClient(client, u)
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message, "Upgrade to websocket failed, the handshake response lacks Connection: Upgrade header field.")
        }
        // upgrade 3 to server 3
        try {
            WebSocket.upgradeFromClient(client, u)
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message, "Upgrade to websocket failed, the handshake response lacks Sec-Websocket-Accept header field.")
        }
        // upgrade 4 to server 4
        try {
            WebSocket.upgradeFromClient(client, u)
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message, "Upgrade to websocket failed, the handshake response has a wrong accept string.")
        }
        // upgrade 5 to server 5
        try {
            WebSocket.upgradeFromClient(client, u)
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message, "Upgrade to websocket failed, websocket extensions not supported yet.")
        }
        // upgrade 6 to server 6
        try {
            WebSocket.upgradeFromClient(client, u)
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message, "Upgrade to websocket failed, the handshake response must have one or null subprotocol.")
        }
        // upgrade 7 to server 7
        try {
            WebSocket.upgradeFromClient(client, u, subProtocols: subProtocols)
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message, "Upgrade to websocket failed, the handshake response has wrong subprotocol.")
        }

        client.close()
        fut.get()
        serverSocket.close()
        println("websocket_validate_upgrade_response_test_ok")
    }

    func serverPacketCapture() {
        serverSocket.bind()
        var server = serverSocket.accept()
        var buf = Array<UInt8>(5000, repeat: 0)
        var i = server.read(buf)
        var req = String.fromUtf8(buf[0..i])
        var keyIndex = req.lastIndexOf(b'=').getOrThrow()
        var key = req[keyIndex - 23..keyIndex + 1]
        var value = generateAcceptValue(key)
        server.write(
            "HTTP/1.1 101 Switching Protocols\r\nUpgrade: Webssocket\r\nConnection: upgrade\r\nSec-WebSocket-Accept: ${value}\r\n\r\n"
                .toArray())
        server.close()
        // server2
        server = serverSocket.accept()
        i = server.read(buf)
        req = String.fromUtf8(buf[0..i])
        keyIndex = req.lastIndexOf(b'=').getOrThrow()
        key = req[keyIndex - 23..keyIndex + 1]
        value = generateAcceptValue(key)
        server.write(
            "HTTP/1.1 101 Switching Protocols\r\nUpgrade: Websocket\r\nConnection: upggrade\r\nSec-WebSocket-Accept: ${value}\r\n\r\n"
                .toArray())
        server.close()
        // server3
        server = serverSocket.accept()
        i = server.read(buf)
        req = String.fromUtf8(buf[0..i])
        keyIndex = req.lastIndexOf(b'=').getOrThrow()
        key = req[keyIndex - 23..keyIndex + 1]
        value = generateAcceptValue(key)
        server.write("HTTP/1.1 101 Switching Protocols\r\nUpgrade: Websocket\r\nConnection: upgrade\r\n\r\n".toArray())
        server.close()
        // server4
        server = serverSocket.accept()
        i = server.read(buf)
        req = String.fromUtf8(buf[0..i])
        keyIndex = req.lastIndexOf(b'=').getOrThrow()
        key = req[keyIndex - 23..keyIndex + 1]
        value = generateAcceptValue(key)
        server.write(
            "HTTP/1.1 101 Switching Protocols\r\nUpgrade: Websocket\r\nConnection: upgrade\r\nSec-WebSocket-Accept: aaa\r\n\r\n"
                .toArray())
        server.close()
        // server5
        server = serverSocket.accept()
        i = server.read(buf)
        req = String.fromUtf8(buf[0..i])
        keyIndex = req.lastIndexOf(b'=').getOrThrow()
        key = req[keyIndex - 23..keyIndex + 1]
        value = generateAcceptValue(key)
        server.write(
            "HTTP/1.1 101 Switching Protocols\r\nUpgrade: Websocket\r\nConnection: upgrade\r\nSec-WebSocket-Accept: ${value}\r\nSec-WebSocket-Extensions: foo\r\n\r\n"
                .toArray())
        server.close()
        // server6
        server = serverSocket.accept()
        i = server.read(buf)
        req = String.fromUtf8(buf[0..i])
        keyIndex = req.lastIndexOf(b'=').getOrThrow()
        key = req[keyIndex - 23..keyIndex + 1]
        value = generateAcceptValue(key)
        server.write(
            "HTTP/1.1 101 Switching Protocols\r\nUpgrade: Websocket\r\nConnection: upgrade\r\nSec-WebSocket-Accept: ${value}\r\nSec-WebSocket-Protocol: foo, bar\r\n\r\n"
                .toArray())
        server.close()
        // server7
        server = serverSocket.accept()
        i = server.read(buf)
        req = String.fromUtf8(buf[0..i])
        keyIndex = req.lastIndexOf(b'=').getOrThrow()
        key = req[keyIndex - 23..keyIndex + 1]
        value = generateAcceptValue(key)
        server.write(
            "HTTP/1.1 101 Switching Protocols\r\nUpgrade: Websocket\r\nConnection: upgrade\r\nSec-WebSocket-Accept: ${value}\r\nSec-WebSocket-Protocol: foo\r\n\r\n"
                .toArray())
        server.close()
    }
}

/* SCAN-IN
websocket_validate_upgrade_response_test_ok
 */
