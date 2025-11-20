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

import stdx.net.http.*
import stdx.net.tls.common.*
import stdx.net.tls.*
import std.time.*
import std.sync.*
import std.fs.*
import stdx.crypto.x509.*
import stdx.crypto.keys.*
import std.io.*

@When[os == "macOS"]
let thread_count = 20
@When[os != "macOS"]
let thread_count = 50

@Test
class Test_Concurrent_100_connects {
    var port = 0u16
    var ser = Option<Server>.None

    func serverConfig(protocol: String): TlsServerConfig {
        let pem0 = String.fromUtf8(readToEnd(File("data/end_rsa.cer", Read)))
        let pem02 = String.fromUtf8(readToEnd(File("data/end_rsa_private_key.pem", Read)))
        var tlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(pem0), GeneralPrivateKey.decodeFromPem(pem02))
        tlsConfig.supportedAlpnProtocols = [protocol]
        tlsConfig
    }

    func clientConfig(protocol: String): TlsClientConfig {
        var tlsConfig = TlsClientConfig()
        let pem = String.fromUtf8(readToEnd(File("data/root_rsa.cer", Read)))
        tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        tlsConfig.supportedAlpnProtocols = [protocol]
        tlsConfig
    }

    func startServer(cfg: TlsServerConfig): Unit {
        let server = ServerBuilder().addr("127.0.0.1").tlsConfig(cfg).port(0).build()
        server.distributor.register("/quick", {
            ctx => ctx.request.body.read(Array<UInt8>(1 * 1024, repeat: 0))
        })
        server.distributor.register("/wait", {
            ctx => ctx.request.body.read(Array<UInt8>(1 * 1024, repeat: 0))
        })
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
        server.distributor.register("/quick", {
            ctx => ctx.request.body.read(Array<UInt8>(1024 * 1024, repeat: 0))
        })
        server.distributor.register("/wait", {
            ctx => ctx.request.body.read(Array<UInt8>(1024 * 1024, repeat: 0))
        })
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
    @TestCase
    func concurrent_01(): Unit {
        func startClient(urlstr: String) {
            var client = ClientBuilder().build()
            var res = client.get(urlstr)
            var buf = Array<UInt8>(2000, repeat: 0)
            while (res.body.read(buf) != 0) {}
            client.close()
        }
        startServer0()

        let thread = 50
        var fs = Array<Future<Unit>>(thread) {
            _ => spawn {startClient("http://127.0.0.1:${port}/quick")}
        }
        for (i in 0..thread) {
            fs[i].get()
        }

        var fs1 = Array<Future<Unit>>(thread) {
            _ => spawn {startClient("http://127.0.0.1:${port}/wait")}
        }
        for (i in 0..thread) {
            fs1[i].get()
        }
        ser.getOrThrow().close()
    }

    // test for h1s, h2
    @TestCase[protocols in [("http/1.1", HTTP1_1), ("h2", HTTP2_0) ] 
]
    func concurrent_02(protocols: (String, Protocol)): Unit {
        func startClient(urlstr: String, conf: TlsClientConfig) {
            var client = ClientBuilder().tlsConfig(conf).build()
            var res = client.get(urlstr)
            var buf = Array<UInt8>(2000, repeat: 0)
            while (res.body.read(buf) != 0) {}
            client.close()
        }

        var (str, pro) = protocols
        let serverconf = serverConfig(str)
        let clientconf = clientConfig(str)

        startServer(serverconf)

        let thread = thread_count
        var fs = Array<Future<Unit>>(thread) {
            _ => spawn {startClient("https://127.0.0.1:${port}/quick", clientconf)}
        }
        for (i in 0..thread) {
            fs[i].get()
        }

        var fs1 = Array<Future<Unit>>(thread) {
            _ => spawn {startClient("https://127.0.0.1:${port}/wait", clientconf)}
        }
        for (i in 0..thread) {
            fs1[i].get()
        }

        ser.getOrThrow().close()
    }
}
