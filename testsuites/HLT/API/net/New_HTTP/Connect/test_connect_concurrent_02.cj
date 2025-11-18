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
import std.sync.*
import std.net.*
import std.collection.*
import std.fs.*
import stdx.crypto.x509.{X509Certificate,PrivateKey}
import std.io.*

@Test
class Test_Connect_Concurrent {
    func serverConfig(): TlsServerConfig {
        let pem0 = String.fromUtf8(readToEnd(File("data/end_rsa.cer", Read)))
        let pem02 = String.fromUtf8(readToEnd(File("data/end_rsa_private_key.pem", Read)))
        var tlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(pem0), PrivateKey.decodeFromPem(pem02))
        tlsConfig.supportedAlpnProtocols = ["http/1.1"]
        tlsConfig
    }

    func clientConfig1(): TlsClientConfig {
        var tlsConfig = TlsClientConfig()
        let pem = String.fromUtf8(readToEnd(File("data/root_rsa.cer", Read)))
        tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        tlsConfig.alpnProtocolsList = ["http/1.1"]
        tlsConfig
    }

    var port = 0u16
    var ser = Option<Server>.None
    var arrbody_0 = Array<UInt8>(1 * 1024, repeat: 65)
    var count = AtomicInt64(0)

    @TestCase
    func connect_01(): Unit {
        startServer()
        let fList = ArrayList<Future<Unit>>()
        for (_ in 0..15) {
            var fut = spawn {
                startClient()
            }
            fList.add(fut)
        }
        for (i in fList) {
            i.get()
        }
        @Expect(count.load(), 0)
        ser.getOrThrow().close()
    }

    func startClient(): Unit {
        let cfg1 = clientConfig1()
        let client1 = ClientBuilder().tlsConfig(cfg1).build()
        try {
            let (_, conn1) = client1.connect("https://127.0.0.1:${port}/connect")
            conn1?.close()
        } catch (e: Exception) {
            count.fetchAdd(1)
        }
        client1.close()
    }

    func startServer(): Unit {
        let cfg = serverConfig()
        let poolCfg = ServicePoolConfig(capacity: 10, queueCapacity: 5)
        let server = ServerBuilder().addr("127.0.0.1").tlsConfig(cfg).servicePoolConfig(poolCfg).port(0).build()
        server.distributor.register("/connect", handler)
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
