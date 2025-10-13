/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
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
class Testwebsocketconf_03 {
    @TestCase
    func test_01(): Unit {
        //the client write the  error frame type
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
            websocketServer.write(TextWebFrame, "hello".toArray())
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
        try {
            websocket.write(ContinuationWebFrame, "hello".toArray())
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message.contains("Invalid frame type"))
            println(e.message)
        }

        try {
            websocket.write(UnknownWebFrame, "hello".toArray())
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message.contains("Invalid frame type"))
            println(e.message)
        }

        websocket.closeConn()
        client.close()
        server.close()
    }

    @TestCase
    func test_02(): Unit {
        //the server write the error frame type
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
                websocketServer.write(ContinuationWebFrame, "hello".toArray())
                @Expect(1, 2)
            } catch (e: WebSocketException) {
                @Expect(e.message.contains("Invalid frame type"))
                println(e.message)
            }

            try {
                websocketServer.write(UnknownWebFrame, "hello".toArray())
                @Expect(1, 2)
            } catch (e: WebSocketException) {
                @Expect(e.message.contains("Invalid frame type"))
                println(e.message)
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
        client.close()
        server.close()
    }

    @TestCase
    func test_03(): Unit {
        //the control frame exceed 125 bytes of the client
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
        try {
            websocket.write(CloseWebFrame, Array<UInt8>(4097, repeat: 97))
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message.contains("All control frames must have a payload length of 125 bytes or less"))
        }
        try {
            websocket.write(PingWebFrame, Array<UInt8>(4097, repeat: 97))
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message.contains("All control frames must have a payload length of 125 bytes or less"))
        }
        try {
            websocket.write(PongWebFrame, Array<UInt8>(4097, repeat: 97))
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message.contains("All control frames must have a payload length of 125 bytes or less"))
        }
        websocket.closeConn()
        client.close()
        server.close()
    }

    @TestCase
    func test_04(): Unit {
        //the control frame exceed 125 bytes of the server
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
                websocketServer.write(CloseWebFrame, Array<UInt8>(4097, repeat: 97))
                @Expect(1, 2)
            } catch (e: WebSocketException) {
                @Expect(e.message.contains("All control frames must have a payload length of 125 bytes or less"))
            }
            try {
                websocketServer.write(PingWebFrame, Array<UInt8>(4097, repeat: 97))
                @Expect(1, 2)
            } catch (e: WebSocketException) {
                @Expect(e.message.contains("All control frames must have a payload length of 125 bytes or less"))
            }
            try {
                websocketServer.write(PongWebFrame, Array<UInt8>(4097, repeat: 97))
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
        sleep(Duration.millisecond * 400)
        websocket.closeConn()
        client.close()
        server.close()
    }
}
