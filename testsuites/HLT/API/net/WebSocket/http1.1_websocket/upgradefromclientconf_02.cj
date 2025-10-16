/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ./files
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package  %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 
/*
 * Test description:
 *      Test WebSocket
 * Test API:
 *      public static func upgradeFromClient():(WebSocket, HttpHeaders)
 */

import stdx.net.http.*
import stdx.crypto.kit.*
import stdx.crypto.keys.*
import stdx.net.tls.common.*
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
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import std.fs.*
import std.io.*

var ser = Option<WebSocket>.None
var sum = 0

@Test
class Testupgradefromclientconf_02 {
    public override func beforeEach(): Unit {
        sum = 0
    }
    public func Config() {
        let pem0 = String.fromUtf8(readToEnd(File("./files/end_rsa.cer", Read)))
        let pem02 = String.fromUtf8(readToEnd(File("./files/end_rsa_private_key.pem", Read)))
        var tlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(pem0), GeneralPrivateKey.decodeFromPem(pem02))
        tlsConfig.supportedAlpnProtocols = ["h2"]
        tlsConfig
    }
    public func Config1() {
        var tlsConfig = TlsClientConfig()
        let pem = String.fromUtf8(readToEnd(File("./files/root_rsa.cer", Read)))
        tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        tlsConfig.supportedAlpnProtocols = ["h2"]
        tlsConfig
    }

    @TestCase
    func test_01(): Unit {
        //client websocket use the default version
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
        (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u, version: HTTP1_1)
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
        //client use the HTTP1_0 version
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

        try {
            (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u, version: HTTP1_0)
            websocket.closeConn()
        } catch (e: WebSocketException) {
            @Expect(e.message.contains("Only the upgrade from HTTP1_1 and HTTP2_0 to WebSocket is supported"))
            sum += 1
        }
        @Expect(sum, 1)
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }

    @TestCase
    func test_03(): Unit {
        //client use the HTTP2.0 version
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
        try {
            (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u, version: HTTP2_0)
            websocket.closeConn()
        } catch (e: HttpException) {
            @Expect(e.message.contains("HTTP/2 is not enabled"))
            sum += 1
        }
        @Expect(sum, 1)
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }

    @TestCase
    func test_04(): Unit {
        //client use the UnknownProtocol version
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

        try {
            (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u, version: UnknownProtocol("zps"))
            websocket.closeConn()
        } catch (e: WebSocketException) {
            @Expect(e.message.contains("Only the upgrade from HTTP1_1 and HTTP2_0 to WebSocket is supported"))
            sum += 1
        }
        @Expect(sum, 1)
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }

    @TestCase
    func test_05(): Unit {
        //client websocket use the default version, serverbuilder use the http2.0 version
        let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(Config()).build()
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
        try {
            (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u)
            websocket.closeConn()
        } catch (e: ConnectionException) {
            @Expect(e.message.contains("Socket is closed"))
            sum += 1
        }
        @Expect(sum, 1)
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }

    @TestCase
    func test_06(): Unit {
        //client websocket use the 2.0 version, serverbuilder use the 2.0 version
        let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(Config()).enableConnectProtocol(true).build()
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
        try {
            (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u, version: HTTP2_0)
            websocket.closeConn()
        } catch (e: HttpException) {
            @Expect(e.message.contains("HTTP/2 is not enabled"))
            sum += 1
        }
        @Expect(sum, 1)
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }

    @TestCase
    func test_07(): Unit {
        //client websocket use the 1.1 version, serverbuilder use the 2.0 version
        let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(Config()).enableConnectProtocol(true).build()
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

        let client = ClientBuilder().tlsConfig(Config1()).build()
        let u = URL.parse("ws://127.0.0.1:${server.port}/webSocket")
        let websocket: WebSocket
        let respHeaders: HttpHeaders
        try {
            (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u, version: HTTP1_1)
            websocket.closeConn()
        } catch (e: ConnectionException) {
            @Expect(e.message.contains("Socket is closed"))
            sum += 1
        }
        @Expect(sum, 1)
        client.close()
        ser.getOrThrow().closeConn()
        server.close()
    }

    @TestCase
    func test_08(): Unit {
        //client websocket use the 2.0 version, serverbuilder use the 2.0 version
        let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(Config()).enableConnectProtocol(true).build()
        server.logger.level = LogLevel.TRACE
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

        let client = ClientBuilder().tlsConfig(Config1()).build()
        client.logger.level = LogLevel.TRACE
        let u = URL.parse("wss://127.0.0.1:${server.port}/webSocket")
        let websocket: WebSocket
        let respHeaders: HttpHeaders
        (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u, version: HTTP2_0)
        sleep(Duration.millisecond * 200)
        websocket.closeConn()
        ser.getOrThrow().closeConn()
        client.close()
        server.close()
    }
}
