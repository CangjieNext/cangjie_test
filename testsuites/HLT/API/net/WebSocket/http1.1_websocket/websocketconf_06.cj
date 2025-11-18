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
 *      public class WebSocket {}
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

@Test
class Testwebsocketconf_06 {
    @TestCase
    func test_01(): Unit {
        //writecloseframe use the error code.
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
            sleep(Duration.millisecond * 100)
            try {
                websocketServer.writeCloseFrame(status: 0, reason: "normal")
                @Expect(1, 2)
            } catch (e: WebSocketException) {
                @Expect(e.message.contains("Invalid status code"))
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
            websocket.writeCloseFrame(status: 999, reason: "normal")
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message.contains("Invalid status code"))
        }
        websocket.closeConn()
        client.close()
        server.close()
    }

    @TestCase
    func test_02(): Unit {
        //writecloseframe use the error code.
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
            sleep(Duration.millisecond * 100)
            try {
                websocketServer.writeCloseFrame(status: 1015, reason: "normal")
                @Expect(1, 2)
            } catch (e: WebSocketException) {
                @Expect(e.message.contains("Invalid status code"))
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
            websocket.writeCloseFrame(status: 5000, reason: "normal")
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message.contains("Invalid status code"))
        }
        websocket.closeConn()
        client.close()
        server.close()
    }

    @TestCase
    func test_03(): Unit {
        //writecloseframe use the error code.
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
            sleep(Duration.millisecond * 100)
            try {
                websocketServer.writeCloseFrame(status: 1006, reason: "normal")
                @Expect(1, 2)
            } catch (e: WebSocketException) {
                @Expect(e.message.contains("Invalid status code"))
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
            websocket.writeCloseFrame(status: 1005, reason: "normal")
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message.contains("Invalid status code"))
        }
        websocket.closeConn()
        client.close()
        server.close()
    }

    @TestCase
    func test_04(): Unit {
        //writecloseframe use the byte exceed the 125.
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        let text = StringBuilder(r'a', 124).toString()
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
            sleep(Duration.millisecond * 100)
            try {
                websocketServer.writeCloseFrame(status: 1004, reason: text)
                @Expect(1, 2)
            } catch (e: WebSocketException) {
                @Expect(e.message.contains("All control frames must have a payload length of 125 bytes or less"))
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
            websocket.writeCloseFrame(status: 1007, reason: text)
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message.contains("All control frames must have a payload length of 125 bytes or less"))
        }
        websocket.closeConn()
        client.close()
        server.close()
    }

    @TestCase
    func test_05(): Unit {
        //writecloseframe use after the closeConn.
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        let text = StringBuilder(r'a', 123).toString()
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
            sleep(Duration.millisecond * 100)
            try {
                websocketServer.read()
                @Expect(1, 2)
            } catch (e: SocketException) {
                @Expect(e.message.contains("Broken pipe"))
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
        websocket.closeConn()
        sleep(Duration.millisecond * 100)
        try {
            websocket.read()
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message.contains("The connection is closed"))
        }
        sleep(Duration.millisecond * 600)
        client.close()
        server.close()
    }

    @TestCase
    func test_06(): Unit {
        //writecloseframe use correct bytes.
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        let text = StringBuilder(r'a', 123).toString()
        let text1 = StringBuilder(r'a', 122).append(r'b').toString()
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
            sleep(Duration.millisecond * 100)
            let websocketFrame2 = websocketServer.read()
            @Expect(websocketFrame2.fin, true)
            @Expect(websocketFrame2.frameType, CloseWebFrame)
            @Expect(websocketFrame2.payload[..2], [3u8, 232u8])
            @Expect(String.fromUtf8(websocketFrame2.payload[2..]), "${text1}")
            websocketServer.writeCloseFrame(status: 1000, reason: text)
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
        websocket.writeCloseFrame(status: 1000, reason: text1)
        sleep(Duration.millisecond * 100)
        let websocketFrame1 = websocket.read()
        @Expect(websocketFrame1.fin, true)
        @Expect(websocketFrame1.frameType, CloseWebFrame)
        @Expect(websocketFrame1.payload[..2], [3u8, 232u8])
        @Expect(String.fromUtf8(websocketFrame1.payload[2..]), "${text}")

        sleep(Duration.millisecond * 600)
        websocket.closeConn()
        client.close()
        server.close()
    }
}
