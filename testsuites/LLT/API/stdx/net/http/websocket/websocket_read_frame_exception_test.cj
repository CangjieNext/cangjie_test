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

let GUID2 = "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"

@Test
class TestWebSocketReadFrameException {
    let serverSocket = TcpServerSocket(bindAt: 0)

    @TestCase
    func webSocketReadMaskFrameFromServer(): Unit {
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
        @Expect(String.fromUtf8(websocketFrame.payload), "hello world")
        @Expect(websocketFrame.fin, true)
        @Expect(websocketFrame.frameType, TextWebFrame)
        websocket.write(BinaryWebFrame, "hello, server!".toArray())
        sleep(Duration.millisecond * 10)

        // read an invalid frame
        try {
            websocket.read()
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message, "The websocket connection is failed, since receiving an invalid mask message.")
        }
        sleep(Duration.millisecond * 200)
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
        // 10000001 00001011 
        // hello world
        let frame = Array<UInt8>(13, repeat: 0)
        frame[0] = 128 + 1
        frame[1] = 11
        "hello world".toArray().copyTo(frame, 0, 2, 11)
        server.write(frame)
        sleep(Duration.millisecond * 500)
        i = server.read(buf)
        // 10000010 10001110
        @Expect(buf[0..2], [130u8, 142u8])
        var maskingKey = buf[2..6]
        let payload = maskAndUnmask(maskingKey, buf[6..i])
        @Expect(String.fromUtf8(payload), "hello, server!")
        sleep(Duration.millisecond * 100)

        // server send a mask frame
        let frameSent = Array<UInt8>(17, repeat: 0)
        frameSent[0] = 128 + 1
        frameSent[1] = 128 + 11 // MASK is on
        maskingKey = generateMaskingKey()
        maskingKey.copyTo(frameSent, 0, 2, 4)
        "hello_world".toArray().copyTo(frameSent, 0, 6, 11)
        server.write(frameSent)
        // receive an close frame with 1002
        i = server.read(buf)
        // 10001000 10000010
        @Expect(buf[0..2], [136u8, 130u8])
        maskingKey = buf[2..6]
        var buff = Array<UInt8>(2, repeat: 0)
        if (i == 6) {
            let i2 = server.read(buf)
            buff = buf[..i2]
        } else {
            buff = buf[6..i]
        }
        let payload2 = maskAndUnmask(maskingKey, buff)
        // 1002 close code
        @Expect(payload2, [3u8, 234u8])
        server.close()
    }

    @TestCase
    func webSocketReadRsvFrame(): Unit {
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

        // read an invalid frame
        try {
            websocket.read()
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message, "The websocket connection is failed, since extensions not supported yet, rsv must be 0.")
        }
        sleep(Duration.millisecond * 200)
        websocket.closeConn()

        fut.get()
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

        // server send a rsv frame
        let frameSent = Array<UInt8>(13, repeat: 0)
        // 11110001 10001110
        frameSent[0] = 128 + 64 + 32 + 16 + 1 // RSV1 RSV2 RSV3 is on
        frameSent[1] = 11
        "hello_world".toArray().copyTo(frameSent, 0, 2, 11)
        server.write(frameSent)
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
        let payload2 = maskAndUnmask(maskingKey, buff)

        // 1002 close code
        @Expect(payload2, [3u8, 234u8])
        server.close()
    }

    @TestCase
    func webSocketReadUnknownFrame(): Unit {
        let fut = spawn {serverPacketCapture3()}
        sleep(Duration.millisecond * 100)
        let client = ClientBuilder().build()
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("ws://127.0.0.1:${port}/a")

        let websocket: WebSocket
        let headers: HttpHeaders
        (websocket, headers) = WebSocket.upgradeFromClient(client, u)

        // the websocket conn no longer belongs to client
        client.close()

        // read an invalid frame
        try {
            websocket.read()
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message, "The websocket connection is failed, since receiving a message with invalid frame type.")
        }
        sleep(Duration.millisecond * 200)
        websocket.closeConn()

        fut.get()
        serverSocket.close()
        println("websocket_read_frame_exception_test_ok")
    }
    func serverPacketCapture3() {
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

        // server send a rsv frame
        let frameSent = Array<UInt8>(13, repeat: 0)
        // 10000011 10001110
        frameSent[0] = 128 + 3 // opcode == 3
        frameSent[1] = 11
        "hello_world".toArray().copyTo(frameSent, 0, 2, 11)
        server.write(frameSent)
        // receive an close frame with 1003
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
        let payload2 = maskAndUnmask(maskingKey, buff)
        // 1003 close code
        @Expect(payload2, [3u8, 235u8])
        server.close()
    }
}

func generateMaskingKey(): Array<UInt8> {
    let secureRandom = SecureRandom()
    return secureRandom.nextBytes(4)
}
/* SCAN-IN
websocket_read_frame_exception_test_ok
 */
