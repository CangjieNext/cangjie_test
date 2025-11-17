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
import websocketUtil.*

@Test
class TestWebSocketUpgradeFromClient {
    let serverSocket = TcpServerSocket(bindAt: 0)

    @TestCase
    func webSocketUpgradeFromClient(): Unit {
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.millisecond * 100)
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        for (_ in 0..3) {
            let u = URL.parse("ws://127.0.0.1:${port}/a")
            let subProtocol = ArrayList<String>(["foo", "bar"])
            try {
                let websocket: WebSocket
                let headers: HttpHeaders
                (websocket, headers) = WebSocket.upgradeFromClient(client, u, subProtocols: subProtocol)
                match (headers.getFirst("hello")) {
                    case Some(v) => @Expect(v, "hello")
                    case None => @Expect(1, 2)
                }
                // the websocket conn no longer belongs to client
                client.close()
                let websocketFrame = websocket.read()
                @Expect(String.fromUtf8(websocketFrame.payload), "hello world")
                @Expect(websocketFrame.fin, true)
                @Expect(websocketFrame.frameType, TextWebFrame)
                websocket.write(BinaryWebFrame, "hello, server!".toArray())
                sleep(Duration.millisecond * 10)
                websocket.closeConn()
            } catch (e: WebSocketException) {
                println(e.message)
            }
        }

        client.close()
        fut.get()
        serverSocket.close()
        println("websocket_upgrade_from_client_test_ok")
    }

    func serverPacketCapture() {
        serverSocket.bind()
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        // not 101
        var server = serverSocket.accept()
        var buf = Array<UInt8>(5000, repeat: 0)
        var i = server.read(buf)
        var req = String.fromUtf8(buf[0..i])
        @Expect(req.contains("GET /a HTTP/1.1\r\n"))
        @Expect(req.contains("host: 127.0.0.1:${port}\r\n"))
        @Expect(req.contains("upgrade: websocket\r\n"))
        @Expect(req.contains("connection: Upgrade\r\n"))
        @Expect(req.contains("sec-websocket-key:"))
        @Expect(req.contains("sec-websocket-version: 13\r\n"))
        @Expect(req.contains("sec-websocket-protocol: foo,bar\r\n"))
        server.write("HTTP/1.1 204 ok\r\nConnection: close\r\na: b\r\nb: c\r\n\r\n".toArray())
        server.close()

        // 101 but failed
        server = serverSocket.accept()
        i = server.read(buf)
        req = String.fromUtf8(buf[0..i])
        server.write("HTTP/1.1 101 ok\r\nContent-Length: 10\r\na: b\r\nb: c\r\n\r\n".toArray())
        server.close()

        // 101 and success
        server = serverSocket.accept()
        i = server.read(buf)
        req = String.fromUtf8(buf[0..i])
        let keyIndex = req.lastIndexOf(b'=').getOrThrow()
        let key = req[keyIndex - 23..keyIndex + 1]
        let value = generateAcceptValue(key)
        server.write(
            "HTTP/1.1 101 Switching Protocols\r\nUpgrade: Websocket , webSocKet \r\nConNection: upGrade, a\r\nSec-websockeT-acCept: ${value}\r\nHello: hello\r\n\r\n"
                .toArray())
        // write a text frame, the payload data is encoded as UTF-8
        // 10000001 00001011
        // hello world
        let frame = Array<UInt8>(13, repeat: 0)
        // text frame
        frame[0] = 128 + 1
        frame[1] = 11
        "hello world".toArray().copyTo(frame, 0, 2, 11)
        server.write(frame)
        sleep(Duration.millisecond * 500)
        i = server.read(buf)
        // 10000010 10001110
        @Expect(buf[0..2], [130u8, 142u8])
        let maskingKey = buf[2..6]
        let payload = maskAndUnmask(maskingKey, buf[6..i])
        @Expect(String.fromUtf8(payload), "hello, server!")
        sleep(Duration.millisecond * 100)
        server.close()
    }
}

/* SCAN-IN
websocket_upgrade_from_client_test_ok
 */
