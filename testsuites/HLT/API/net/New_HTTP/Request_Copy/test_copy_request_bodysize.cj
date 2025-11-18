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
// RUN-EXEC: %export cjHeapSize=12GB && %run_stdx %output %run_utest_opt %run_args

/*
 * Test description:
 *      test if HttpRequest can deal with large bodysize
 * Test API:
 *      public init(request: HttpRequest)
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
class Test_Copy_Request_Bodysize {
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

    func startServer(pro: String) {
        var cfg = serverConfig(pro)
        let server = ServerBuilder()
            .addr("127.0.0.1")
            .tlsConfig(cfg)
            .maxRequestBodySize(32 * 1024 * 1024)
            .port(0)
            .build()
        server.distributor.register("/content", handler1)
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        ser = Option<Server>.Some(server)
        port = ser.getOrThrow().port
    }

    func handler1(ctx: HttpContext): Unit {
        let req = ctx.request
        var newRequest = HttpRequestBuilder(req).build()
        @Expect(req.bodySize, newRequest.bodySize)
    }

    // test for h1s, h2
    @TestCase[protocol in [("http/1.1", HTTP1_1), ("h2", HTTP2_0) ], 
 bodysize in [ 0, 1024, 1024 * 1024, 32 * 1024 * 1024 ] 
]
    func request_bodysize(protocol: (String, Protocol), bodysize: Int64): Unit {
        var (str, pro) = protocol
        startServer(str)
        var bodyarray = Array<UInt8>(bodysize, repeat: 30)
        var cfg = clientConfig(str)
        let client = ClientBuilder().tlsConfig(cfg).build()
        let request = HttpRequestBuilder()
            .get()
            .url("https://127.0.0.1:${port}/content")
            .body(bodyarray)
            .version(pro)
            .build()
        client.send(request)
        client.close()
        ser.getOrThrow().close()
    }
}
