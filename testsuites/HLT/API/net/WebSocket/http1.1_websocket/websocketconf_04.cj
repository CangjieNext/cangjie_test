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
 *      public class WebSocket {}
 */

import stdx.net.http.*
import stdx.net.tls.common.*
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

@Test
class Testwebsocketconf_04 {
    @TestCase
    func test_01(): Unit {
        //write the correct close type.
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
            websocketServer.write(CloseWebFrame, [3u8, 232u8, 110u8, 111u8, 114u8, 109u8, 97u8, 108u8, 34u8])
            sleep(Duration.millisecond * 600)
            let websocketFrame2 = websocketServer.read()
            @Expect(websocketFrame2.fin, true)
            @Expect(websocketFrame2.frameType, CloseWebFrame)
            @Expect(websocketFrame2.payload[..2], [3u8, 232u8])
            @Expect(String.fromUtf8(websocketFrame2.payload[2..]), "normal\"")
            websocketServer.closeConn()
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
        sleep(Duration.millisecond * 100)
        let websocketFrame1 = websocket.read()
        @Expect(websocketFrame1.fin, true)
        @Expect(websocketFrame1.frameType, CloseWebFrame)
        @Expect(websocketFrame1.payload[..2], [3u8, 232u8])
        @Expect(String.fromUtf8(websocketFrame1.payload[2..]), "normal\"")
        sleep(Duration.millisecond * 100)
        websocket.write(CloseWebFrame, [3u8, 232u8, 110u8, 111u8, 114u8, 109u8, 97u8, 108u8, 34u8])
        websocket.closeConn()
        client.close()
        server.close()
    }

    @TestCase
    func test_02(): Unit {
        //write the error close type.
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
            try {
                websocketServer.write(CloseWebFrame, [3u8, 237u8, 110u8, 111u8, 114u8, 109u8, 97u8, 108u8, 34u8])
                @Expect(1, 2)
            } catch (e: WebSocketException) {
                @Expect(e.message.contains("Invalid close status code"))
            }
            websocketServer.closeConn()
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
        sleep(Duration.millisecond * 100)
        try {
            websocket.write(CloseWebFrame, [3u8, 238u8, 110u8, 111u8, 114u8, 109u8, 97u8, 108u8, 34u8])
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message.contains("Invalid close status code"))
        }
        websocket.closeConn()
        client.close()
        server.close()
    }

    @TestCase
    func test_03(): Unit {
        //the client write the error close type and the server write the correct close type.
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
            websocketServer.write(CloseWebFrame, [19u8, 135u8, 110u8, 111u8, 114u8, 109u8, 97u8, 108u8, 34u8])
            println("3333333")
            websocketServer.closeConn()
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
        sleep(Duration.millisecond * 100)
        try {
            websocket.write(CloseWebFrame, [19u8, 136u8, 110u8, 111u8, 114u8, 109u8, 97u8, 108u8, 34u8])
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message.contains("Invalid close status code"))
        }
        let websocketFrame1 = websocket.read()
        @Expect(websocketFrame1.fin, true)
        @Expect(websocketFrame1.frameType, CloseWebFrame)
        @Expect(websocketFrame1.payload[..2], [19u8, 135u8])
        @Expect(String.fromUtf8(websocketFrame1.payload[2..]), "normal\"")
        websocket.closeConn()
        client.close()
        server.close()
    }

    @TestCase
    func test_04(): Unit {
        //the  close type contain the 0. 
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
            try {
                websocketServer.write(CloseWebFrame, [0u8, 0u8, 110u8, 111u8, 114u8, 109u8, 97u8, 108u8, 34u8])
                @Expect(1, 2)
            } catch (e: WebSocketException) {
                @Expect(e.message.contains("Invalid close status code"))
            }
            websocketServer.closeConn()
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
        sleep(Duration.millisecond * 100)
        try {
            websocket.write(CloseWebFrame, [255u8, 255u8, 110u8, 111u8, 114u8, 109u8, 97u8, 108u8, 34u8])
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message.contains("Invalid close status code"))
        }
        websocket.closeConn()
        client.close()
        server.close()
    }

    @TestCase
    func test_05(): Unit {
        //the  close type exceed the 125 bytes and equal the 125 bytes.
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
            try {
                websocketServer.write(CloseWebFrame, Array<UInt8>(126, repeat: 97))
                @Expect(1, 2)
            } catch (e: WebSocketException) {
                @Expect(e.message.contains("All control frames must have a payload length of 125 bytes or less"))
            }
            let websocketFrame1 = websocketServer.read()
            @Expect(websocketFrame1.fin, true)
            @Expect(websocketFrame1.frameType, CloseWebFrame)
            @Expect(websocketFrame1.payload[..2], [19u8, 19u8])
            @Expect(websocketFrame1.payload[2..], Array<UInt8>(123, repeat: 19))
            websocketServer.closeConn()
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
        websocket.write(CloseWebFrame, Array<UInt8>(125, repeat: 19))
        websocket.closeConn()
        client.close()
        server.close()
    }
}
