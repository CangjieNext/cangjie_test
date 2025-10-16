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
import stdx.log.*
import stdx.logger.*
import std.console.Console
import std.sync.*
import std.net.*
import std.collection.*
import stdx.net.http.*
import stdx.crypto.keys.*
import stdx.net.tls.common.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import std.math.*
import std.fs.*
import std.io.*

public func serverConfig(): TlsServerConfig {
    let pem0 = String.fromUtf8(readToEnd(File("./files/end_rsa.cer", Read)))
    let pem02 = String.fromUtf8(readToEnd(File("./files/end_rsa_private_key.pem", Read)))
    var tlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(pem0), GeneralPrivateKey.decodeFromPem(pem02))
    tlsConfig.supportedAlpnProtocols = ["h2"]
    tlsConfig
}

public func clientConfig(): TlsClientConfig {
    var tlsConfig = TlsClientConfig()
    let pem = String.fromUtf8(readToEnd(File("./files/root_rsa.cer", Read)))
    tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
    tlsConfig.supportedAlpnProtocols = ["h2"]
    tlsConfig
}

@Test
public class Test_maxConcurrentStreams {
    @TestCase
    func default(): Unit {
        let client = ClientBuilder().tlsConfig(clientConfig()).build()
        @Expect(client.maxConcurrentStreams, 2147483647)
    }

    @TestCase
    func zero(): Unit {
        let client = ClientBuilder().tlsConfig(clientConfig()).maxConcurrentStreams(0).build()
        @Expect(client.maxConcurrentStreams, 0)
    }

    @TestCase
    func max(): Unit {
        let client = ClientBuilder().tlsConfig(clientConfig()).maxConcurrentStreams(UInt32.Max).build()
        @Expect(client.maxConcurrentStreams, UInt32.Max)
    }

    @TestCase
    func clientMaxConcurrentStreams(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()
        server.logger.level = LogLevel.OFF
        server.distributor.register("serverMaxConcurrentStreams", {_ => sleep(Duration.second * 5)})
        server.distributor.register("clientMaxConcurrentStreams", pushHd)
        server.distributor.register("push", {_ => sleep(Duration.second * 5)})

        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let client = ClientBuilder().tlsConfig(clientConfig()).maxConcurrentStreams(1).build()
        @Assert(client.maxConcurrentStreams, 1)

        let request = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${server.port}/clientMaxConcurrentStreams")
            .build()

        try {
            let response = client.send(request)
            let _ = response.getPush()
        } catch (e: Exception) {
            println("${e}")
        }

        client.close()
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

//ASSERT:scan HttpException: Write push related to stream 4, num of active push streams exceeds SettingsMaxConcurrentStreams, which is set by client
