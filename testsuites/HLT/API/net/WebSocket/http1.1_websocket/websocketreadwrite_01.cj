/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
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
import stdx.crypto.kit
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
class Testwebsocketreadwrite_01 {
    public override func beforeEach(): Unit {
        sum1 = 0
        sum2 = 0
    }

    @TestCase
    func test_01(): Unit {
        //write the text frame exceed the 4 * 1024 bytes.
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
            websocketServer.write(TextWebFrame, Array<UInt8>(12288, repeat: 97))
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
        let data = ArrayList<UInt8>()
        var frame = websocket.read()
        while (true) {
            match (frame.frameType) {
                case ContinuationWebFrame =>
                    data.add(all: frame.payload)
                    if (frame.fin) {
                        break
                    }
                case TextWebFrame | BinaryWebFrame =>
                    if (!data.isEmpty()) {
                        throw Exception("invalid frame")
                    }
                    data.add(all: frame.payload)
                    if (frame.fin) {
                        break
                    }
                case CloseWebFrame =>
                    websocket.write(CloseWebFrame, frame.payload)
                    break
                case PingWebFrame => websocket.writePongFrame(frame.payload)
                case _ => ()
            }
            frame = websocket.read()
        }

        @Expect(data.size, 12288)
        @Expect(data.toArray(), Array<UInt8>(12288, repeat: 97))

        websocket.closeConn()
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }

    @TestCase
    func test_02(): Unit {
        //write the text frame less than or equal to the default bytes.
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
            websocketServer.write(TextWebFrame, Array<UInt8>(4096, repeat: 97))
            let data1 = ArrayList<UInt8>()
            var frame1 = websocketServer.read()
            while (true) {
                match (frame1.frameType) {
                    case ContinuationWebFrame =>
                        data1.add(all: frame1.payload)
                        if (frame1.fin) {
                            break
                        }
                    case TextWebFrame | BinaryWebFrame =>
                        if (!data1.isEmpty()) {
                            throw Exception("invalid frame")
                        }
                        data1.add(all: frame1.payload)
                        if (frame1.fin) {
                            break
                        }
                    case CloseWebFrame =>
                        websocketServer.write(CloseWebFrame, frame1.payload)
                        break
                    case PingWebFrame => websocketServer.writePongFrame(frame1.payload)
                    case _ => ()
                }
                frame1 = websocketServer.read()
            }
            @Expect(data1.size, 4000)
            @Expect(data1.toArray(), Array<UInt8>(4000, repeat: 90))
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
        websocket.write(TextWebFrame, Array<UInt8>(4000, repeat: 90))
        let data = ArrayList<UInt8>()
        var frame = websocket.read()
        while (true) {
            match (frame.frameType) {
                case ContinuationWebFrame =>
                    data.add(all: frame.payload)
                    if (frame.fin) {
                        break
                    }
                case TextWebFrame | BinaryWebFrame =>
                    if (!data.isEmpty()) {
                        throw Exception("invalid frame")
                    }
                    data.add(all: frame.payload)
                    if (frame.fin) {
                        break
                    }
                case CloseWebFrame =>
                    websocket.write(CloseWebFrame, frame.payload)
                    break
                case PingWebFrame => websocket.writePongFrame(frame.payload)
                case _ => ()
            }
            frame = websocket.read()
        }
        @Expect(data.size, 4096)
        @Expect(data.toArray(), Array<UInt8>(4096, repeat: 97))

        sleep(Duration.millisecond * 600)
        websocket.closeConn()
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }

    @TestCase
    func test_03(): Unit {
        //the data frame insert the control frame.
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
            websocketServer.write(TextWebFrame, Array<UInt8>(4096, repeat: 97))
            sleep(Duration.millisecond * 50)
            websocketServer.write(PingWebFrame, Array<UInt8>(125, repeat: 97))
            println("1111111111")
            sleep(Duration.millisecond * 100)
            websocketServer.write(BinaryWebFrame, Array<UInt8>(4000, repeat: 90))
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
        sleep(Duration.millisecond * 50)
        let data = ArrayList<UInt8>()
        var frame = websocket.read()
        while (true) {
            match (frame.frameType) {
                case ContinuationWebFrame =>
                    data.add(all: frame.payload)
                    if (frame.fin) {
                        break
                    }
                case TextWebFrame | BinaryWebFrame =>
                    if (!data.isEmpty()) {
                        throw Exception("invalid frame")
                    }
                    data.add(all: frame.payload)
                    if (frame.fin) {
                        break
                    }
                case _ => ()
            }
            frame = websocket.read()
        }
        @Expect(data.size, 4096)
        @Expect(data.toArray(), Array<UInt8>(4096, repeat: 97))

        var frame1 = websocket.read()
        @Expect(frame1.fin, true)
        @Expect(frame1.frameType, PingWebFrame)
        @Expect(frame1.payload[0..], Array<UInt8>(125, repeat: 97))

        sleep(Duration.millisecond * 100)
        let data2 = ArrayList<UInt8>()
        var frame2 = websocket.read()
        while (true) {
            match (frame2.frameType) {
                case ContinuationWebFrame =>
                    data2.add(all: frame2.payload)
                    if (frame2.fin) {
                        break
                    }
                case TextWebFrame | BinaryWebFrame =>
                    if (!data2.isEmpty()) {
                        throw Exception("invalid frame")
                    }
                    data2.add(all: frame2.payload)
                    if (frame2.fin) {
                        break
                    }
                case _ => ()
            }
            frame2 = websocket.read()
        }
        @Expect(data2.size, 4000)
        @Expect(data2.toArray(), Array<UInt8>(4000, repeat: 90))

        sleep(Duration.millisecond * 600)
        websocket.closeConn()
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }
}
