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
 *      public static func upgradeFromClient():(WebSocket, HttpHeaders)
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
var sum = 0

@Test
class Testupgradefromclientconf_01 {
    public override func beforeEach(): Unit {
        sum = 0
    }
    @TestCase
    func test_01(): Unit {
        //the client is build
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        func handler1(ctx: HttpContext): Unit {
            let websocketServer = WebSocket.upgradeFromServer(ctx)
            ser = Option<WebSocket>.Some(websocketServer)
        }
        func startServer() {
            server.distributor.register("/webSocket", handler1)
            server.serve()
        }
        spawn {startServer()}
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let client = ClientBuilder().build()
        let u = URL.parse("ws://127.0.0.1:${server.port}/webSocket")
        let websocket: WebSocket
        let respHeaders: HttpHeaders
        (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u)
        sleep(Duration.millisecond * 200)
        @Expect(websocket.subProtocol, "")
        @Expect(ser.getOrThrow().subProtocol, "")

        websocket.closeConn()
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }

    @TestCase
    func test_02(): Unit {
        //test again
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        func handler1(ctx: HttpContext): Unit {
            let websocketServer = WebSocket.upgradeFromServer(ctx)
            ser = Option<WebSocket>.Some(websocketServer)
        }
        func startServer() {
            server.distributor.register("/webSocket", handler1)
            server.serve()
        }
        spawn {startServer()}
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let client = ClientBuilder().build()
        let u = URL.parse("ws://127.0.0.1:${server.port}/webSocket")
        let websocket: WebSocket
        let respHeaders: HttpHeaders
        (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u)
        @Expect(websocket.subProtocol, "")
        @Expect(ser.getOrThrow().subProtocol, "")

        websocket.closeConn()
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }

    @TestCase
    func test_03(): Unit {
        //url of the error ip
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        func handler1(ctx: HttpContext): Unit {
            let websocketServer = WebSocket.upgradeFromServer(ctx)
            ser = Option<WebSocket>.Some(websocketServer)
        }
        func startServer() {
            server.distributor.register("/webSocket", handler1)
            server.serve()
        }
        spawn {startServer()}
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let client = ClientBuilder().build()
        try {
            URL.parse("ws://%2:${server.port}/webSocket")
        } catch (e: UrlSyntaxException) {
            sum += 1
        }
        @Expect(sum, 1)
        client.close()
        server.close()
    }

    @TestCase
    func test_04(): Unit {
        //url of the error ip
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        func handler1(ctx: HttpContext): Unit {
            let websocketServer = WebSocket.upgradeFromServer(ctx)
            ser = Option<WebSocket>.Some(websocketServer)
        }
        func startServer() {
            server.distributor.register("/webSocket", handler1)
            server.serve()
        }
        spawn {startServer()}
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let client = ClientBuilder().build()
        let u = URL.parse("ws://127.0.0.0:${server.port}/webSocket")
        let websocket: WebSocket
        let respHeaders: HttpHeaders
        try {
            (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u)
            websocket.closeConn()
        } catch (e: SocketException) {
            if (e.message.contains("Failed to connect") || e.message.contains("Network is unreachable")) {
                sum += 1
            }
        }
        @Expect(sum, 1)

        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }

    @TestCase
    func test_05(): Unit {
        //url of the error ip
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        func handler1(ctx: HttpContext): Unit {
            let websocketServer = WebSocket.upgradeFromServer(ctx)
            ser = Option<WebSocket>.Some(websocketServer)
        }
        func startServer() {
            server.distributor.register("/webSocket", handler1)
            server.serve()
        }
        spawn {startServer()}
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let client = ClientBuilder().build()
        let u = URL.parse("ws://127.0.0.3:${server.port}/webSocket")
        let websocket: WebSocket
        let respHeaders: HttpHeaders
        try {
            (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u)
            websocket.closeConn()
        } catch (e: SocketException) {
            if (e.message.contains("Failed to connect") || e.message.contains("Connection refused")) {
                sum += 1
            }
        }
        @Expect(sum, 1)
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }

    @TestCase
    func test_06(): Unit {
        //url of the error port
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        func handler1(ctx: HttpContext): Unit {
            let websocketServer = WebSocket.upgradeFromServer(ctx)
            ser = Option<WebSocket>.Some(websocketServer)
        }
        func startServer() {
            server.distributor.register("/webSocket", handler1)
            server.serve()
        }
        spawn {startServer()}
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let client = ClientBuilder().build()
        let u = URL.parse("ws://127.0.0.1:0/webSocket")
        let websocket: WebSocket
        let respHeaders: HttpHeaders
        try {
            (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u)
            websocket.closeConn()
        } catch (e: SocketException) {
            if (e.message.contains("Failed to connect") || e.message.contains("Connection refused")) {
                sum += 1
            }
        }
        @Expect(sum, 1)
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }

    @TestCase
    func test_07(): Unit {
        //url of the error port
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        func handler1(ctx: HttpContext): Unit {
            let websocketServer = WebSocket.upgradeFromServer(ctx)
            ser = Option<WebSocket>.Some(websocketServer)
        }
        func startServer() {
            server.distributor.register("/webSocket", handler1)
            server.serve()
        }
        spawn {startServer()}
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let client = ClientBuilder().build()
        let u = URL.parse("ws://127.0.0.1:77777/webSocket")
        let websocket: WebSocket
        let respHeaders: HttpHeaders
        try {
            (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u)
            websocket.closeConn()
        } catch (e: HttpException) {
            @Expect(e.message.contains("Invalid url address or proxy"))
            sum += 1
        }
        @Expect(sum, 1)
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }

    @TestCase
    func test_08(): Unit {
        //url of the error url scheme
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        func handler1(ctx: HttpContext): Unit {
            let websocketServer = WebSocket.upgradeFromServer(ctx)
            ser = Option<WebSocket>.Some(websocketServer)
        }
        func startServer() {
            server.distributor.register("/webSocket", handler1)
            server.serve()
        }
        spawn {startServer()}
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let client = ClientBuilder().build()
        let u = URL.parse("w://127.0.0.1:${server.port}/webSocket")
        let websocket: WebSocket
        let respHeaders: HttpHeaders
        try {
            (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u)
            websocket.closeConn()
        } catch (e: WebSocketException) {
            @Expect(e.message.contains("Upgrade to websocket failed, invalid URL scheme, the scheme must be ws or wss"))
            sum += 1
        }
        @Expect(sum ,1)
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }

    @TestCase
    func test_09(): Unit {
        //url of the error url scheme
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        func handler1(ctx: HttpContext): Unit {
            let websocketServer = WebSocket.upgradeFromServer(ctx)
            ser = Option<WebSocket>.Some(websocketServer)
        }
        func startServer() {
            server.distributor.register("/webSocket", handler1)
            server.serve()
        }
        spawn {startServer()}
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let client = ClientBuilder().build()
        let u = URL.parse("wss://127.0.0.1:${server.port}/webSocket")
        let websocket: WebSocket
        let respHeaders: HttpHeaders
        try {
            (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u)
            websocket.closeConn()
        } catch (e: HttpException) {
            @Expect(e.message.contains("TLS must be configured when HTTPS requests are sent."))
            sum += 1
        }
        @Expect(sum, 1)
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }

    @TestCase
    func test_10(): Unit {
        //url of the error url scheme
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        func handler1(ctx: HttpContext): Unit {
            let websocketServer = WebSocket.upgradeFromServer(ctx)
            ser = Option<WebSocket>.Some(websocketServer)
        }
        func startServer() {
            server.distributor.register("/webSocket", handler1)
            server.serve()
        }
        spawn {startServer()}
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let client = ClientBuilder().build()
        let u = URL.parse("wsss://127.0.0.1:${server.port}/webSocket")
        let websocket: WebSocket
        let respHeaders: HttpHeaders
        try {
            (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u)
            websocket.closeConn()
        } catch (e: WebSocketException) {
            @Expect(e.message.contains("Upgrade to websocket failed, invalid URL scheme, the scheme must be ws or wss"))
            sum += 1
        }
        @Expect(sum, 1)
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }

    @TestCase
    func test_11(): Unit {
        //url of the error url scheme
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        func handler1(ctx: HttpContext): Unit {
            let websocketServer = WebSocket.upgradeFromServer(ctx)
            ser = Option<WebSocket>.Some(websocketServer)
        }
        func startServer() {
            server.distributor.register("/webSocket", handler1)
            server.serve()
        }
        spawn {startServer()}
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let client = ClientBuilder().build()
        let u = URL.parse("ws://127.0.0.1:${server.port}/webSocket1")
        let websocket: WebSocket
        let respHeaders: HttpHeaders
        try {
            (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u)
            websocket.closeConn()
        } catch (e: WebSocketException) {
            @Expect(e.message.contains("Upgrade to websocket failed, the status code should be 101, but received 404"))
            sum += 1
        }
        @Expect(sum, 1)
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }

    @TestCase
    func test_12(): Unit {
        //url of the error url scheme
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        func handler1(ctx: HttpContext): Unit {
            let websocketServer = WebSocket.upgradeFromServer(ctx)
            ser = Option<WebSocket>.Some(websocketServer)
        }
        func startServer() {
            server.distributor.register("/", handler1)
            server.serve()
        }
        spawn {startServer()}
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let client = ClientBuilder().build()
        let u = URL.parse("")
        let websocket: WebSocket
        let respHeaders: HttpHeaders
        try {
            (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u)
            websocket.closeConn()
        } catch (e: WebSocketException) {
            @Expect(e.message.contains("Upgrade to websocket failed, invalid URL scheme, the scheme must be ws or wss"))
            sum += 1
        }
        @Expect(sum, 1)
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }

    @TestCase
    func test_13(): Unit {
        //url of the correct url scheme
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        func handler1(ctx: HttpContext): Unit {
            let websocketServer = WebSocket.upgradeFromServer(ctx)
            ser = Option<WebSocket>.Some(websocketServer)
        }
        func startServer() {
            server.distributor.register("/", handler1)
            server.serve()
        }
        spawn {startServer()}
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let client = ClientBuilder().build()
        let u = URL.parse("ws://127.0.0.1:${server.port}/")
        let websocket: WebSocket
        let respHeaders: HttpHeaders
        (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u)
        websocket.closeConn()
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }

    @TestCase
    func test_14(): Unit {
        //url of the correct url scheme
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        func handler1(ctx: HttpContext): Unit {
            let websocketServer = WebSocket.upgradeFromServer(ctx)
            ser = Option<WebSocket>.Some(websocketServer)
        }
        func startServer() {
            server.distributor.register("/", handler1)
            server.serve()
        }
        spawn {startServer()}
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let client = ClientBuilder().build()
        let u = URL.parse("ws://127.0.0.1:${server.port}")
        let websocket: WebSocket
        let respHeaders: HttpHeaders
        (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u)
        websocket.closeConn()
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }
}
