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
class Testwebsocketconf_07 {
    @TestCase
    func test_01(): Unit {
        //writepingframe use the byte exceed the 125.
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
                websocketServer.writePingFrame(Array<UInt8>(126, repeat: 97))
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
            websocket.writePingFrame(Array<UInt8>(126, repeat: 97))
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message.contains("All control frames must have a payload length of 125 bytes or less"))
        }
        websocket.closeConn()
        client.close()
        server.close()
    }

    @TestCase
    func test_02(): Unit {
        //writepingframe use after the closeConn.
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
            websocket.writePingFrame(Array<UInt8>(125, repeat: 97))
            @Expect(1, 2)
        } catch (e: WebSocketException) {
            @Expect(e.message.contains("The connection is closed"))
        }
        sleep(Duration.millisecond * 600)
        client.close()
        server.close()
    }

    @TestCase
    func test_03(): Unit {
        //writepingframe use the correct bytes.
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
            let websocketFrame2 = websocketServer.read()
            @Expect(websocketFrame2.fin, true)
            @Expect(websocketFrame2.frameType, PingWebFrame)
            @Expect(websocketFrame2.payload[0..], Array<UInt8>(125, repeat: 90))
            websocketServer.writePingFrame(Array<UInt8>(125, repeat: 97))
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
        websocket.writePingFrame(Array<UInt8>(125, repeat: 90))
        sleep(Duration.millisecond * 200)
        let websocketFrame1 = websocket.read()
        @Expect(websocketFrame1.fin, true)
        @Expect(websocketFrame1.frameType, PingWebFrame)
        @Expect(websocketFrame1.payload[0..], Array<UInt8>(125, repeat: 97))

        sleep(Duration.millisecond * 600)
        websocket.closeConn()
        client.close()
        server.close()
    }
}
