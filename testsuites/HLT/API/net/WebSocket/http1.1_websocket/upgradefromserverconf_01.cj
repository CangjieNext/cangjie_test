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
 *      public static func upgradeFromServer():(WebSocket, HttpHeaders)
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

var ser = Option<WebSocket>.None
var sum = 0

@Test
class Testupgradefromserverconf_01 {
    public override func beforeEach(): Unit {
        sum = 0
    }
    @TestCase
    func test_01(): Unit {
        //the subProtocols of the server set blank
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        func handler1(ctx: HttpContext): Unit {
            let subprotocols = ArrayList<String>(["", ""])
            ser = WebSocket.upgradeFromServer(ctx, subProtocols: subprotocols)
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
        sleep(Duration.millisecond * 100)
        @Expect(websocket.subProtocol, "")
        @Expect(ser.getOrThrow().subProtocol, "")

        websocket.closeConn()
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }

    @TestCase
    func test_02(): Unit {
        //the subProtocols of the server and the client set the "123"
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        let subprotocols = ArrayList<String>(["123"])
        func handler1(ctx: HttpContext): Unit {
            ser = WebSocket.upgradeFromServer(ctx, subProtocols: subprotocols)
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
        (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u, subProtocols: subprotocols)
        sleep(Duration.millisecond * 100)
        @Expect(websocket.subProtocol, "123")
        @Expect(ser.getOrThrow().subProtocol, "123")

        websocket.closeConn()
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }

    @TestCase
    func test_03(): Unit {
        //the subProtocols of the server and the client set the "foo"
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        let subprotocols = ArrayList<String>(["foo"])
        func handler1(ctx: HttpContext): Unit {
            ser = WebSocket.upgradeFromServer(ctx, subProtocols: subprotocols)
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
        (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u, subProtocols: subprotocols)
        sleep(Duration.millisecond * 100)
        @Expect(websocket.subProtocol, "foo")
        @Expect(ser.getOrThrow().subProtocol, "foo")

        websocket.closeConn()
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }

    @TestCase
    func test_04(): Unit {
        //the subProtocols of the server set "bar" and the client set the "foo"
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        let server_subprotocol = ArrayList<String>(["bar"])
        func handler1(ctx: HttpContext): Unit {
            ser = WebSocket.upgradeFromServer(ctx, subProtocols: server_subprotocol)
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
        let client_subprotocol = ArrayList<String>(["foo"])
        let websocket: WebSocket
        let respHeaders: HttpHeaders
        (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u, subProtocols: client_subprotocol)
        sleep(Duration.millisecond * 100)
        @Expect(websocket.subProtocol, "")
        @Expect(ser.getOrThrow().subProtocol, "")

        websocket.closeConn()
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }

    @TestCase
    func test_05(): Unit {
        //the subProtocols of the server  and the client set "foo" and  "bar"
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        let server_subprotocol = ArrayList<String>(["foo", "bar"])
        func handler1(ctx: HttpContext): Unit {
            ser = WebSocket.upgradeFromServer(ctx, subProtocols: server_subprotocol)
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
        let client_subprotocol = ArrayList<String>(["foo", "bar"])
        let websocket: WebSocket
        let respHeaders: HttpHeaders
        (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u, subProtocols: client_subprotocol)
        sleep(Duration.millisecond * 100)
        @Expect(websocket.subProtocol, "foo")
        @Expect(ser.getOrThrow().subProtocol, "foo")

        websocket.closeConn()
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }

    @TestCase
    func test_06(): Unit {
        //the subProtocols of the server  and the client set "foo" and  "bar" with different sequence
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        let server_subprotocol = ArrayList<String>(["foo", "bar"])
        func handler1(ctx: HttpContext): Unit {
            ser = WebSocket.upgradeFromServer(ctx, subProtocols: server_subprotocol)
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
        let client_subprotocol = ArrayList<String>(["bar", "foo"])
        let websocket: WebSocket
        let respHeaders: HttpHeaders
        (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u, subProtocols: client_subprotocol)
        sleep(Duration.millisecond * 100)
        @Expect(websocket.subProtocol, "bar")
        @Expect(ser.getOrThrow().subProtocol, "bar")

        websocket.closeConn()
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }
}
