/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../data
// DEPENDENCE: ../../../asan
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx %cmp_opt asan.%middle %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

/*
 * Test description:
 *      test connect method in concurrenct scenes
 * Test API:
 *      public func connect(url: String, headers!: HttpHeaders = HttpHeaders(), version!: Protocol=HTTP1_1)
 *                           : (HttpResponse, ?StreamingSocket)
 */

import stdx.net.http.*
import stdx.crypto.keys.*
//import stdx.net.tls.common.*
import stdx.net.tls.*
import std.time.*
import std.io.*
import std.net.*
import std.collection.*
import std.fs.*
import stdx.crypto.x509.{X509Certificate,PrivateKey}

@Test
class Test_Connect_Concurrent {
    func serverConfig(): TlsServerConfig {
        let pem0 = String.fromUtf8(readToEnd(File("data/end_rsa.cer", Read)))
        let pem02 = String.fromUtf8(readToEnd(File("data/end_rsa_private_key.pem", Read)))
        var tlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(pem0), PrivateKey.decodeFromPem(pem02))
        tlsConfig.supportedAlpnProtocols = ["http/1.1", "h2"]
        tlsConfig
    }

    func clientConfig1(): TlsClientConfig {
        var tlsConfig = TlsClientConfig()
        let pem = String.fromUtf8(readToEnd(File("data/root_rsa.cer", Read)))
        tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        tlsConfig.alpnProtocolsList = ["http/1.1"]
        tlsConfig
    }

    func clientConfig2(): TlsClientConfig {
        var tlsConfig = TlsClientConfig()
        let pem = String.fromUtf8(readToEnd(File("data/root_rsa.cer", Read)))
        tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        tlsConfig.alpnProtocolsList = ["h2"]
        tlsConfig
    }

    var port = 0u16
    var ser = Option<Server>.None
    var arrbody = Array<UInt8>(16 * 1024, repeat: 66)
    var arrbody_0 = Array<UInt8>(16 * 1024, repeat: 65)

    @TestCase
    func connect_01(): Unit {
        startServer()
        let cfg1 = clientConfig1()
        let client1 = ClientBuilder().tlsConfig(cfg1).build()
        let cfg2 = clientConfig2()
        let client2 = ClientBuilder().tlsConfig(cfg2).build()

        let (_, conn1) = client1.connect("https://127.0.0.1:${port}/connect")
        let (_, conn2) = client2.connect("https://127.0.0.1:${port}/connect", version: HTTP2_0)
        client1.close()
        client2.close()

        conn1?.close()
        conn2?.close()
        ser.getOrThrow().close()
    }

    func startServer() {
        let cfg = serverConfig()
        let server = ServerBuilder().addr("127.0.0.1").tlsConfig(cfg).enableConnectProtocol(true).port(0).build()
        server.distributor.register("/connect", handler)
        server.distributor.register("/hello", {_ =>})
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        port = server.port
        ser = Option<Server>.Some(server)
    }

    func handler(ctx: HttpContext): Unit {
        ctx.responseBuilder.status(101)
        ctx.responseBuilder.body(arrbody_0)
    }
}
