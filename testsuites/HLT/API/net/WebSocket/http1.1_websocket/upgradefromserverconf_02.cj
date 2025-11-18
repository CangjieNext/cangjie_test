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
 *      public static func upgradeFromServer():(WebSocket, HttpHeaders)
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
class Testupgradefromserverconf_02 {
    public override func beforeEach(): Unit {
        sum = 0
    }
    @TestCase
    func test_01(): Unit {
        //the origins of the server set ""
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        let origin = ArrayList<String>([""])
        func handler1(ctx: HttpContext): Unit {
            let websocketServer = WebSocket.upgradeFromServer(ctx, origins: origin)
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
        try {
            (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u)
            websocket.closeConn()
        } catch (e: WebSocketException) {
            @Expect(e.message.contains("Upgrade to websocket failed, the status code should be 101, but received 403"))
            sum += 1
        }
        @Expect(sum, 1)
        client.close()
        server.close()
    }

    @TestCase
    func test_02(): Unit {
        //the origins of the server and the client set ""
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        let origin = ArrayList<String>(["\"\""])
        func handler1(ctx: HttpContext): Unit {
            let websocketServer = WebSocket.upgradeFromServer(ctx, origins: origin)
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
        let headers = HttpHeaders()
        headers.add("Origin", "\"\"")
        let websocket: WebSocket
        let respHeaders: HttpHeaders
        (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u, headers: headers)
        websocket.closeConn()
        client.close()
        server.close()
    }

    @TestCase
    func test_03(): Unit {
        //the origins of the server and the client set "test"
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        let origin = ArrayList<String>(["test"])
        func handler1(ctx: HttpContext): Unit {
            let websocketServer = WebSocket.upgradeFromServer(ctx, origins: origin)
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
        let headers = HttpHeaders()
        headers.add("Origin", "test")
        let websocket: WebSocket
        let respHeaders: HttpHeaders
        (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u, headers: headers)
        websocket.closeConn()
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }

    @TestCase
    func test_04(): Unit {
        //the origins of the server set "test" and the client set "tests"
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        let origin = ArrayList<String>(["test"])
        func handler1(ctx: HttpContext): Unit {
            let websocketServer = WebSocket.upgradeFromServer(ctx, origins: origin)
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
        let headers = HttpHeaders()
        headers.add("Origin", "tests")
        let websocket: WebSocket
        let respHeaders: HttpHeaders
        try {
            (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u, headers: headers)
            websocket.closeConn()
        } catch (e: WebSocketException) {
            @Expect(e.message.contains("Upgrade to websocket failed, the status code should be 101, but received 403"))
            sum += 1
        }
        @Expect(sum, 1)
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }

    @TestCase
    func test_05(): Unit {
        //the origins of the server set "123" and the client set "123"
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        let origin = ArrayList<String>(["123"])
        func handler1(ctx: HttpContext): Unit {
            let websocketServer = WebSocket.upgradeFromServer(ctx, origins: origin)
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
        let headers = HttpHeaders()
        headers.add("Origin", "123")
        let websocket: WebSocket
        let respHeaders: HttpHeaders
        (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u, headers: headers)
        websocket.closeConn()
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }

    @TestCase
    func test_06(): Unit {
        //the origins of the server set "123" and the client set "123"
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        let origin = ArrayList<String>(["123", "test"])
        func handler1(ctx: HttpContext): Unit {
            let websocketServer = WebSocket.upgradeFromServer(ctx, origins: origin)
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
        let headers = HttpHeaders()
        headers.add("Origin", "test")
        let websocket: WebSocket
        let respHeaders: HttpHeaders
        (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u, headers: headers)
        websocket.closeConn()
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }
}
