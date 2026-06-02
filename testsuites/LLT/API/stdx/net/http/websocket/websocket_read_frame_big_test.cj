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
 *      Test WebSocket#read
 * Test API:
 *      public func read(): WebSocketFrame
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
import stdx.crypto.crypto.*
import websocketUtil.*

@Test
class TestWebSocketReadFrameBig {
    let serverSocket = TcpServerSocket(bindAt: 0)

    @TestCase
    func webSocketReadFrameBig(): Unit {
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.second)
        let client = ClientBuilder().build()
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("ws://127.0.0.1:${port}/a")

        let websocket: WebSocket
        let headers: HttpHeaders
        (websocket, headers) = WebSocket.upgradeFromClient(client, u)

        // the websocket conn no longer belongs to client
        client.close()

        let websocketFrame = websocket.read()
        @Expect(websocketFrame.payload.size, 65536)
        @Expect(String.fromUtf8(websocketFrame.payload[65528..]), "aaaaaaaa")
        @Expect(websocketFrame.fin, true)
        @Expect(websocketFrame.frameType, TextWebFrame)

        // receive a control frame that payloadlen > 125
        try {
            websocket.read()
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message, "The websocket connection is failed, since receiving a control frame has a payload length more than 125 bytes.")
        }

        sleep(Duration.millisecond * 10)
        websocket.closeConn()
        fut.get()
    }
    func serverPacketCapture() {
        serverSocket.bind()
        // 101 and success
        let server = serverSocket.accept()
        let buf = Array<UInt8>(500, repeat: 0)
        var i = server.read(buf)
        let req = String.fromUtf8(buf[0..i])

        let keyIndex = req.lastIndexOf(b'=').getOrThrow()
        let key = req[keyIndex - 23..keyIndex + 1]
        let value = generateAcceptValue(key)
        server.write(
            "HTTP/1.1 101 Switching Protocols\r\nUpgrade: Websocket\r\nConnection: Upgrade\r\nSec-WebSocket-Accept: ${value}\r\n\r\n"
                .toArray())
        // write a text frame, the payload data is encoded as UTF-8
        // 10000001 01111111
        // 2 + 8 + 65536
        let frame = Array<UInt8>(65546, repeat: 0)
        frame[0] = 128 + 1
        frame[1] = 127
        // 65536
        [0u8, 0u8, 0u8, 0u8, 0u8, 1u8, 0u8, 0u8].copyTo(frame, 0, 2, 8)
        // aaaa......
        Array<UInt8>(65536, repeat: 97).copyTo(frame, 0, 10, 65536)
        server.write(frame)

        // 10001001 01111110  // ping
        // 2 + 2 + 126
        let frame2 = Array<UInt8>(130, repeat: 0)
        frame2[0] = 128 + 9
        frame2[1] = 126
        [126u8, 0u8].copyTo(frame2, 0, 2, 2)
        // aaaa......
        Array<UInt8>(126, repeat: 97).copyTo(frame2, 0, 4, 126)
        server.write(frame2)

        // receive an close frame with 1002
        i = server.read(buf)
        // 10001000 10000010
        @Expect(buf[0..2], [136u8, 130u8])
        let maskingKey = buf[2..6]
        var buff = Array<UInt8>(2, repeat: 0)
        if (i == 6) {
            let i2 = server.read(buf)
            buff = buf[..i2]
        } else {
            buff = buf[6..i]
        }
        let payload = maskAndUnmask(maskingKey, buff)
        // 1002 close code
        @Expect(payload,[3u8, 234u8])
        sleep(Duration.millisecond * 500)
        server.close()
    }

    @TestCase
    func webSocketReadControlFragment(): Unit {
        let fut = spawn {serverPacketCapture2()}
        sleep(Duration.second)
        let client = ClientBuilder().build()
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("ws://127.0.0.1:${port}/a")

        let websocket: WebSocket
        let headers: HttpHeaders
        (websocket, headers) = WebSocket.upgradeFromClient(client, u)

        // the websocket conn no longer belongs to client
        client.close()

        // receive a control frame that payloadlen > 125
        try {
            websocket.read()
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message, "The websocket connection is failed, since receiving a control frame that is fragmented.")
        }

        sleep(Duration.millisecond * 10)
        websocket.closeConn()
        fut.get()
        serverSocket.close()
        println("websocket_read_frame_big_test_ok")
    }
    func serverPacketCapture2() {
        // 101 and success
        let server = serverSocket.accept()
        let buf = Array<UInt8>(500, repeat: 0)
        var i = server.read(buf)
        let req = String.fromUtf8(buf[0..i])

        let keyIndex = req.lastIndexOf(b'=').getOrThrow()
        let key = req[keyIndex - 23..keyIndex + 1]
        let value = generateAcceptValue(key)
        server.write(
            "HTTP/1.1 101 Switching Protocols\r\nUpgrade: Websocket\r\nConnection: Upgrade\r\nSec-WebSocket-Accept: ${value}\r\n\r\n"
                .toArray())

        // 00001001 00000010  // ping
        // 2 + 2 + 126
        let frame = Array<UInt8>(4, repeat: 0)
        frame[0] = 9 // fin = false
        frame[1] = 2
        // aa
        Array<UInt8>(2, repeat: 97).copyTo(frame, 0, 2, 2)
        server.write(frame)

        // receive an close frame with 1002
        sleep(Duration.millisecond * 10)
        i = server.read(buf)
        // 10001000 10000010
        @Expect(buf[0..2], [136u8, 130u8])
        let maskingKey = buf[2..6]
        var buff = Array<UInt8>(2, repeat: 0)
        if (i == 6) {
            let i2 = server.read(buf)
            buff = buf[..i2]
        } else {
            buff = buf[6..i]
        }
        let payload = maskAndUnmask(maskingKey, buff)
        // 1002 close code
        @Expect(payload, [3u8, 234u8])
        sleep(Duration.millisecond * 500)
        server.close()
    }
}

/* SCAN-IN
websocket_read_frame_big_test_ok
 */
