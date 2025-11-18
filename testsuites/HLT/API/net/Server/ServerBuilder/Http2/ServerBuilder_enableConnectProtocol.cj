/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: files
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.net.*
import std.collection.*
import stdx.encoding.url.*
import stdx.net.http.*
////import stdx.crypto.kit.*
import stdx.crypto.keys.*
//import stdx.net.tls.common.*
import stdx.net.tls.*
import stdx.crypto.x509.{X509Certificate,PrivateKey}
import std.fs.*
import std.io.*

public func serverConfig(): TlsServerConfig {
    let pem0 = String.fromUtf8(readToEnd(File("./files/end_rsa.cer", Read)))
    let pem02 = String.fromUtf8(readToEnd(File("./files/end_rsa_private_key.pem", Read)))
    var tlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(pem0), PrivateKey.decodeFromPem(pem02))
    tlsConfig.supportedAlpnProtocols = ["h2"]
    tlsConfig
}

public func clientConfig(): TlsClientConfig {
    var tlsConfig = TlsClientConfig()
    let pem = String.fromUtf8(readToEnd(File("./files/root_rsa.cer", Read)))
    tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
    tlsConfig.alpnProtocolsList = ["h2"]
    tlsConfig
}

@Test
public class Test_enableConnectProtocol {
    @TestCase
    func default(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()
        @Expect(server.enableConnectProtocol, false)
    }

    @TestCase
    func enableConnectProtocol_true(): Unit {
        let server = ServerBuilder()
            .addr("127.0.0.1")
            .port(0)
            .tlsConfig(serverConfig())
            .enableConnectProtocol(true)
            .build()
        @Expect(server.enableConnectProtocol, true)

        server.distributor.register("/webSocket", handler1)
        spawn {server.serve()}
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let client = ClientBuilder().tlsConfig(clientConfig()).build()
        let u = URL.parse("wss://127.0.0.1:${server.port}/webSocket")
        let subProtocol = ArrayList<String>(["foo1", "bar1"])
        let websocket: WebSocket
        let headers: HttpHeaders
        (websocket, headers) = WebSocket.upgradeFromClient(client, u, subProtocols: subProtocol, version: HTTP2_0)
        println("client " + websocket.subProtocol)
        @Expect(websocket.subProtocol, "foo1")

        let websocketFrame = websocket.read()
        @Expect(String.fromUtf8(websocketFrame.payload), "hello, client!")
        @Expect(websocketFrame.fin, true)
        @Expect(websocketFrame.frameType, TextWebFrame)
        println(String.fromUtf8(websocketFrame.payload))
        websocket.write(BinaryWebFrame, "hello, server!!".toArray())
        websocket.closeConn()
        sleep(Duration.millisecond * 1000)
        client.close()
        server.close()
        println("websocket_upgrade_from_server_test_ok")
    }

    @TestCase
    func enableConnectProtocol_false(): Unit {
        var flag = false
        let server = ServerBuilder()
            .addr("127.0.0.1")
            .port(0)
            .tlsConfig(serverConfig())
            .enableConnectProtocol(false)
            .build()
        @Expect(server.enableConnectProtocol, false)

        server.distributor.register("/webSocket", handler1)
        spawn {server.serve()}
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let client = ClientBuilder().tlsConfig(clientConfig()).build()
        let u = URL.parse("wss://127.0.0.1:${server.port}/webSocket")
        let subProtocol = ArrayList<String>(["foo1", "bar1"])
        let websocket: WebSocket
        let headers: HttpHeaders
        try {
            (websocket, headers) = WebSocket.upgradeFromClient(client, u, subProtocols: subProtocol, version: HTTP2_0)
        } catch (e: HttpException) {
            flag = true
            @Expect(e.message.contains("Target HTTP/2 server doesn`t allow CONNECT method."))
        }
        @Expect(flag, true)
    }

    func handler1(ctx: HttpContext): Unit {
        let websocketServer = WebSocket.upgradeFromServer(ctx, subProtocols: ArrayList<String>(["foo", "bar", "foo1"]))
        println("server " + websocketServer.subProtocol)
        websocketServer.write(TextWebFrame, "hello, client!".toArray())
        let websocketFrame = websocketServer.read()
        println(String.fromUtf8(websocketFrame.payload))
    }
}
