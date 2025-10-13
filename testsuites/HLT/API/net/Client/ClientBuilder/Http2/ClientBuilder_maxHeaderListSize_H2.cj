/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// (not Windows) LEVEL: 0
// (Windows) LEVEL: 1
// DEPENDENCE: files
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
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
public class Test_maxHeaderListSize_H2 {
    @TestCase
    func default(): Unit {
        let client = ClientBuilder().tlsConfig(clientConfig()).build()
        @Expect(client.maxHeaderListSize, 4294967295)
    }

    @TestCase
    func zero(): Unit {
        let client = ClientBuilder().tlsConfig(clientConfig()).maxHeaderListSize(0).build()
        @Expect(client.maxHeaderListSize, 0)
    }

    @TestCase
    func max(): Unit {
        let client = ClientBuilder().tlsConfig(clientConfig()).maxHeaderListSize(UInt32.Max).build()
        @Expect(client.maxHeaderListSize, UInt32.Max)
    }

    @TestCase
    func equalsize(): Unit {
        let server = ServerBuilder().tlsConfig(serverConfig()).addr("127.0.0.1").port(0).build()

        spawn {server.serve()}
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        server.distributor.register("/dd", {ctx => ctx.responseBuilder.header("1", "1").body("hello")})

        let request = HttpRequestBuilder().version(HTTP2_0).url("https://127.0.0.1:${server.port}/dd").build()

        let client = ClientBuilder().tlsConfig(clientConfig()).maxHeaderListSize(141).build()

        let response = client.send(request)
        @Expect(response.status,200)
        server.close()
        client.close()
    }

    @TestCase
    func oversize(): Unit {
        let server = ServerBuilder().tlsConfig(serverConfig()).addr("127.0.0.1").port(0).build()

        spawn {server.serve()}
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        server.distributor.register("/dd", {ctx => ctx.responseBuilder.header("1000", "1").body("hello")})

        let request = HttpRequestBuilder().version(HTTP2_0).url("https://127.0.0.1:${server.port}/dd").build()

        let client = ClientBuilder().tlsConfig(clientConfig()).maxHeaderListSize(140).build()
        try {
            let response = client.send(request)
        } catch (e: HttpException) {
            @Expect(e.message, "Stream closed.")
        }
        server.close()
        client.close()
    }
}
