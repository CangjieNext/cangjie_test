/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../data
// DEPENDENCE: ../../../asan
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx %cmp_opt asan.%middle %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

/*
 * Test description:
 *      test readtimeout with parameter 0, -1...
 * Test API:
 *      public func readTimeout(timeout: Duration): HttpRequestBuilder
 */

import stdx.net.http.*
////import stdx.crypto.kit.*
import stdx.crypto.keys.*
//import stdx.net.tls.common.*
import stdx.net.tls.*
import std.time.*
import std.sync.*
import std.fs.*
import stdx.crypto.x509.*
import std.io.*

@Test
class Test_ReadTimeout_Https_Http {
    var port = 0u16
    var ser = Option<Server>.None

    func serverConfig(protocol: String): TlsServerConfig {
        let pem0 = String.fromUtf8(readToEnd(File("data/end_rsa.cer", Read)))
        let pem02 = String.fromUtf8(readToEnd(File("data/end_rsa_private_key.pem", Read)))
        var tlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(pem0), PrivateKey.decodeFromPem(pem02))
        tlsConfig.supportedAlpnProtocols = [protocol]
        tlsConfig
    }

    func clientConfig(protocol: String): TlsClientConfig {
        var tlsConfig = TlsClientConfig()
        let pem = String.fromUtf8(readToEnd(File("data/root_rsa.cer", Read)))
        tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        tlsConfig.alpnProtocolsList = [protocol]
        tlsConfig
    }

    func startServer(cfg: TlsServerConfig): Unit {
        let server = ServerBuilder().addr("127.0.0.1").tlsConfig(cfg).port(0).build()
        server.distributor.register("/quick", {_ => sleep(Duration.millisecond * 100)})
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        port = server.port
        ser = Option<Server>.Some(server)
    }

    func startServer0(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server.distributor.register("/quick", {_ => sleep(Duration.millisecond * 100)})
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        port = server.port
        ser = Option<Server>.Some(server)
    }

    // test for http1_1
    @TestCase[readtime in [ Duration.Zero, - 1 * Duration.second, - 1000 * Duration.second ] 
]
    func readTimeout_01(readtime: Duration): Unit {
        startServer0()
        var client = ClientBuilder().build()
        var req = HttpRequestBuilder().readTimeout(readtime).url("http://127.0.0.1:${port}/quick").build()
        try {
            client.send(req)
            @Expect(1, 2)
        } catch (e: HttpTimeoutException) {
            @Expect(e.message.contains("timeout"))
        }
        client.close()
        ser.getOrThrow().close()
    }

    // test for h1s, h2
    @TestCase[readtime in [ Duration.Zero, - 1 * Duration.second, - 1000 * Duration.second ], 
 protocols in [("http/1.1", HTTP1_1), ("h2", HTTP2_0) ] 
]
    func readTimeout_02(readtime: Duration, protocols: (String, Protocol)): Unit {
        var (str, pro) = protocols
        var serverconf = serverConfig(str)
        var clientconf = clientConfig(str)
        startServer(serverconf)
        var client = ClientBuilder().tlsConfig(clientconf).build()
        var req = HttpRequestBuilder()
            .readTimeout(readtime)
            .version(pro)
            .url("https://127.0.0.1:${port}/quick")
            .build()
        try {
            client.send(req)
            @Expect(1, 2)
        } catch (e: HttpTimeoutException) {
            @Expect(e.message.contains("timeout"))
        }
        client.close()
        ser.getOrThrow().close()
    }
}
