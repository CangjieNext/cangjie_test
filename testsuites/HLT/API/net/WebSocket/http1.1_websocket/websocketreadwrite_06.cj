/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package  %f -o %output  %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 
/*
 * Test description:
 *      Test WebSocket
 * Test API:
 *      public func read(): WebSocketFrame
 *      public func write(frameType: WebSocketFrameType, byteArray: Array<UInt8>, frameSize!: Int64 = FRAMESIZE)
 */

import stdx.net.http.*
//import stdx.net.tls.common.*
import stdx.net.tls
//import stdx.crypto.kit
import stdx.encoding.url.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.collection.*
import stdx.log.*
import stdx.logger.*
import std.console.Console

var ser = Option<WebSocket>.None
var sum1 = 0
var sum2 = 0

@Test
class Testwebsocketreadwrite_06 {
    public override func beforeEach(): Unit {
        sum1 = 0
        sum2 = 0
    }

    @TestCase
    func test_01(): Unit {
        //write the writeCloseFrame use different parameters.
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        func handler1(ctx: HttpContext): Unit {
            let websocketServer = WebSocket.upgradeFromServer(
                ctx,
                userFunc: {
                    request: HttpRequest =>
                    let value = request.headers.getFirst("test") ?? ""
                    @Expect(value, "zpstest")
                    let headers = HttpHeaders()
                    headers.add("resp", value)
                    headers
                }
            )
            ser = Option<WebSocket>.Some(websocketServer)
            sleep(Duration.millisecond * 100)
            var frame1 = websocketServer.read()
            @Expect(frame1.fin, true)
            @Expect(frame1.frameType, CloseWebFrame)
            @Expect(frame1.payload[0..], Array<UInt8>())
            sleep(Duration.millisecond * 100)
            var frame2 = websocketServer.read()
            @Expect(frame2.fin, true)
            @Expect(frame2.frameType, CloseWebFrame)
            @Expect(frame2.payload[0..], Array<UInt8>())
        }
        func startServer() {
            server.logger.level = LogLevel.DEBUG
            server.distributor.register("/webSocket", handler1)
            server.serve()
        }
        spawn {startServer()}
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let u = URL.parse("ws://127.0.0.1:${server.port}/webSocket")
        let headers = HttpHeaders()
        headers.add("test", "zpstest")
        let websocket: WebSocket
        let respHeaders: HttpHeaders
        (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u, headers: headers)
        let value1 = respHeaders.getFirst("resp") ?? ""
        @Expect(value1, "zpstest")
        websocket.writeCloseFrame(status: None, reason: "")
        websocket.writeCloseFrame(status: None, reason: "normal")
        sleep(Duration.millisecond * 600)
        websocket.closeConn()
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }
    @TestCase
    func test_02(): Unit {
        //write the writeCloseFrame use different parameters.
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        func handler1(ctx: HttpContext): Unit {
            let websocketServer = WebSocket.upgradeFromServer(
                ctx,
                userFunc: {
                    request: HttpRequest =>
                    let value = request.headers.getFirst("test") ?? ""
                    @Expect(value, "zpstest")
                    let headers = HttpHeaders()
                    headers.add("resp", value)
                    headers
                }
            )
            ser = Option<WebSocket>.Some(websocketServer)
            sleep(Duration.millisecond * 100)
            var frame1 = websocketServer.read()
            @Expect(frame1.fin, true)
            @Expect(frame1.frameType, CloseWebFrame)
            @Expect(frame1.payload[..2], [3u8, 232u8])
            @Expect(String.fromUtf8(frame1.payload[2..]), "")
            sleep(Duration.millisecond * 100)
            var frame2 = websocketServer.read()
            @Expect(frame2.fin, true)
            @Expect(frame2.frameType, CloseWebFrame)
            @Expect(frame1.payload[..2], [3u8, 232u8])
            @Expect(String.fromUtf8(frame2.payload[2..]), "normal")
            println("11111")
        }
        func startServer() {
            server.logger.level = LogLevel.DEBUG
            server.distributor.register("/webSocket", handler1)
            server.serve()
        }
        spawn {startServer()}
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let u = URL.parse("ws://127.0.0.1:${server.port}/webSocket")
        let headers = HttpHeaders()
        headers.add("test", "zpstest")
        let websocket: WebSocket
        let respHeaders: HttpHeaders
        (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u, headers: headers)
        let value1 = respHeaders.getFirst("resp") ?? ""
        @Expect(value1, "zpstest")
        websocket.writeCloseFrame(status: 1000, reason: "")
        sleep(Duration.millisecond * 100)
        websocket.writeCloseFrame(status: 1000, reason: "normal")
        sleep(Duration.millisecond * 600)
        websocket.closeConn()
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }

    @TestCase
    func test_03(): Unit {
        //write the writeCloseFrame after write text or binary.
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        func handler1(ctx: HttpContext): Unit {
            let websocketServer = WebSocket.upgradeFromServer(
                ctx,
                userFunc: {
                    request: HttpRequest =>
                    let value = request.headers.getFirst("test") ?? ""
                    @Expect(value, "zpstest")
                    let headers = HttpHeaders()
                    headers.add("resp", value)
                    headers
                }
            )
            ser = Option<WebSocket>.Some(websocketServer)
            sleep(Duration.millisecond * 100)
            var frame1 = websocketServer.read()
            @Expect(frame1.fin, true)
            @Expect(frame1.frameType, CloseWebFrame)
            @Expect(frame1.payload[..2], [3u8, 232u8])
            @Expect(String.fromUtf8(frame1.payload[2..]), "normal")
        }
        func startServer() {
            server.logger.level = LogLevel.DEBUG
            server.distributor.register("/webSocket", handler1)
            server.serve()
        }
        spawn {startServer()}
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let u = URL.parse("ws://127.0.0.1:${server.port}/webSocket")
        let headers = HttpHeaders()
        headers.add("test", "zpstest")
        let websocket: WebSocket
        let respHeaders: HttpHeaders
        (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u, headers: headers)
        let value1 = respHeaders.getFirst("resp") ?? ""
        @Expect(value1, "zpstest")
        websocket.writeCloseFrame(status: 1000, reason: "normal")
        sleep(Duration.millisecond * 100)
        try {
            websocket.write(TextWebFrame, Array<UInt8>(124, repeat: 10))
        } catch (e: WebSocketException) {
            @Expect(e.message.contains("No more data frames can be sent after sending a Close frame"))
            sum1 += 1
        }
        try {
            websocket.write(BinaryWebFrame, Array<UInt8>(125, repeat: 10))
        } catch (e: WebSocketException) {
            @Expect(e.message.contains("No more data frames can be sent after sending a Close frame"))
            sum1 += 1
        }
        @Expect(sum1, 2)
        sleep(Duration.millisecond * 600)
        websocket.closeConn()
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }

    @TestCase
    func test_04(): Unit {
        //write the writeCloseFrame after ping or pong.
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        func handler1(ctx: HttpContext): Unit {
            let websocketServer = WebSocket.upgradeFromServer(
                ctx,
                userFunc: {
                    request: HttpRequest =>
                    let value = request.headers.getFirst("test") ?? ""
                    @Expect(value, "zpstest")
                    let headers = HttpHeaders()
                    headers.add("resp", value)
                    headers
                }
            )
            ser = Option<WebSocket>.Some(websocketServer)
            sleep(Duration.millisecond * 100)
            var frame1 = websocketServer.read()
            @Expect(frame1.fin, true)
            @Expect(frame1.frameType, CloseWebFrame)
            @Expect(frame1.payload[..2], [3u8, 232u8])
            @Expect(String.fromUtf8(frame1.payload[2..]), "normal")
            sleep(Duration.millisecond * 100)
            var frame2 = websocketServer.read()
            @Expect(frame2.fin, true)
            @Expect(frame2.frameType, PingWebFrame)
            @Expect(frame2.payload[0..], Array<UInt8>(122, repeat: 10))
            sleep(Duration.millisecond * 100)
            var frame3 = websocketServer.read()
            @Expect(frame3.fin, true)
            @Expect(frame3.frameType, PingWebFrame)
            @Expect(frame3.payload[0..], Array<UInt8>(123, repeat: 10))

            sleep(Duration.millisecond * 100)
            var frame4 = websocketServer.read()
            @Expect(frame4.fin, true)
            @Expect(frame4.frameType, PongWebFrame)
            @Expect(frame4.payload[0..], Array<UInt8>(124, repeat: 10))
            sleep(Duration.millisecond * 100)
            var frame5 = websocketServer.read()
            @Expect(frame5.fin, true)
            @Expect(frame5.frameType, PongWebFrame)
            @Expect(frame5.payload[0..], Array<UInt8>(125, repeat: 10))
            println("555555")
        }
        func startServer() {
            server.logger.level = LogLevel.DEBUG
            server.distributor.register("/webSocket", handler1)
            server.serve()
        }
        spawn {startServer()}
        sleep(Duration.millisecond * 200)

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let u = URL.parse("ws://127.0.0.1:${server.port}/webSocket")
        let headers = HttpHeaders()
        headers.add("test", "zpstest")
        let websocket: WebSocket
        let respHeaders: HttpHeaders
        (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u, headers: headers)
        let value1 = respHeaders.getFirst("resp") ?? ""
        @Expect(value1, "zpstest")
        websocket.writeCloseFrame(status: 1000, reason: "normal")
        sleep(Duration.millisecond * 100)
        websocket.write(PingWebFrame, Array<UInt8>(122, repeat: 10))
        sleep(Duration.millisecond * 100)
        websocket.writePingFrame(Array<UInt8>(123, repeat: 10))
        sleep(Duration.millisecond * 100)
        websocket.write(PongWebFrame, Array<UInt8>(124, repeat: 10))
        sleep(Duration.millisecond * 100)
        websocket.writePongFrame(Array<UInt8>(125, repeat: 10))
        sleep(Duration.millisecond * 600)
        websocket.closeConn()
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }
}
