/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: files
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package  %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run_stdx %output %run_utest_opt %run_args 2>&1 | compare %f
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import stdx.log.*
import stdx.logger.*
import std.console.Console
import std.net.*
import std.collection.*
import stdx.net.http.*
////import stdx.crypto.kit.*
import stdx.crypto.keys.*
//import stdx.net.tls.common.*
import stdx.net.tls.*
import stdx.crypto.x509.{X509Certificate,PrivateKey}
import std.math.*
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
public class Test_ServerBuilder_maxConcurrentStreams_h2 {
    @TestCase
    func default(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()
        @Expect(server.maxConcurrentStreams, 100)
        server.close()
    }

    @TestCase
    func zero(): Unit {
        let server = ServerBuilder()
            .addr("127.0.0.1")
            .port(0)
            .tlsConfig(serverConfig())
            .maxConcurrentStreams(0)
            .build()
        @Expect(server.maxConcurrentStreams, 0)

        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let request = HttpRequestBuilder()
            .method("GET")
            .url("https://127.0.0.1:${server.port}/")
            .version(HTTP2_0)
            .build()
        let c = ClientBuilder().tlsConfig(clientConfig()).build()
        try {
            let res = c.send(request)
        } catch (e: HttpException) {
            @Expect(e.message.contains("Stream closed."))
        }
        server.close()
    }

    @TestCase
    func max(): Unit {
        let server = ServerBuilder()
            .addr("127.0.0.1")
            .port(0)
            .tlsConfig(serverConfig())
            .maxConcurrentStreams(UInt32.Max)
            .build()
        @Expect(server.maxConcurrentStreams, UInt32.Max)
        server.close()
    }

    @TestCase
    func overwrite(): Unit {
        let server = ServerBuilder()
            .addr("127.0.0.1")
            .port(0)
            .tlsConfig(serverConfig())
            .maxConcurrentStreams(0)
            .maxConcurrentStreams(UInt32.Max)
            .build()
        @Expect(server.maxConcurrentStreams, UInt32.Max)
        server.close()
    }

    @TestCase
    func serverMaxConcurrentStreams(): Unit {
        let server = ServerBuilder()
            .addr("127.0.0.1")
            .port(0)
            .tlsConfig(serverConfig())
            .maxConcurrentStreams(2)
            .build()
        server.logger.level = LogLevel.OFF
        server.distributor.register("serverMaxConcurrentStreams", {_ => sleep(Duration.second * 5)})
        server.distributor.register("clientMaxConcurrentStreams", pushHd)
        server.distributor.register("push", {_ => sleep(Duration.second * 5)})

        @Assert(server.maxConcurrentStreams, 2)

        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let client = ClientBuilder().tlsConfig(clientConfig()).build()
        client.logger.level = LogLevel.OFF

        let request = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${server.port}/serverMaxConcurrentStreams")
            .build()

        let fList = ArrayList<Future<Unit>>()
        for (_ in 0..5) {
            let f = spawn {
                try {
                    let _ = client.send(request)
                } catch (e: Exception) {
                    println("${e}")
                }
            }
            fList.add(f)
        }
        for (f in fList) {
            f.get()
        }
    }

    func pushHd(ctx: HttpContext): Unit {
        let pusher = HttpResponsePusher.getPusher(ctx).getOrThrow()
        let fList = ArrayList<Future<Unit>>()
        for (_ in 0..2) {
            let f = spawn {
                try {
                    pusher.push("push", "GET", HttpHeaders())
                } catch (e: Exception) {
                    println(e)
                }
            }
            fList.add(f)
        }
        for (f in fList) {
            f.get()
        }
    }
}

// ASSERT: scan received frame on stream 1, num of active client streams exceeds SettingsMaxConcurrentStreams, which is set by server
