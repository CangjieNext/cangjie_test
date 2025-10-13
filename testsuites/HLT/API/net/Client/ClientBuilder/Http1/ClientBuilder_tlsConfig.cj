/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
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
import stdx.encoding.url.*
import std.fs.*
import std.io.*

public func serverConfig(): TlsServerConfig {
    let pem0 = String.fromUtf8(readToEnd(File("./files/end_rsa.cer", Read)))
    let pem02 = String.fromUtf8(readToEnd(File("./files/end_rsa_private_key.pem", Read)))
    var tlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(pem0), GeneralPrivateKey.decodeFromPem(pem02))
    tlsConfig.supportedAlpnProtocols = ["http/1.1"]
    tlsConfig
}

public func clientConfig(): TlsClientConfig {
    var tlsConfig = TlsClientConfig()
    let pem = String.fromUtf8(readToEnd(File("./files/root_rsa.cer", Read)))
    tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
    tlsConfig.supportedAlpnProtocols = ["http/1.1"]
    tlsConfig
}

@Test
public class Test_tlsConfig {
    @TestCase
    func request_http(): Unit {
        var flag = false
        let server = ServerBuilder().addr("127.0.0.1").tlsConfig(serverConfig()).port(0).build()
        server.distributor.register("/", {ctx => ctx.responseBuilder.body("hello!")})
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let client1 = ClientBuilder().tlsConfig(clientConfig()).build()

        let request = HttpRequestBuilder().url("http://127.0.0.1:${server.port}/").build()
        try {
            client1.send(request)
        } catch (e: ConnectionException) {
            flag = true
            @Expect(e.message.contains("closed"))
        }
        @Expect(flag, true)
    }

    @TestCase
    func request_https(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").tlsConfig(serverConfig()).port(0).build()
        server.distributor.register("/", {ctx => ctx.responseBuilder.body("hello!")})
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let client1 = ClientBuilder().tlsConfig(clientConfig()).build()

        let request = HttpRequestBuilder().url("https://127.0.0.1:${server.port}/").build()
        let response = client1.send(request)
        let buf_true = Array<UInt8>(6, repeat: 0)
        response.body.read(buf_true)
        @Expect(String.fromUtf8(buf_true),"hello!")
        @Expect(response.status, 200)
    }

    @TestCase
    func request_https_without_tlsconfig(): Unit {
        var flag = false
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server.distributor.register("/", {ctx => ctx.responseBuilder.body("hello!")})
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let client1 = ClientBuilder().build()

        let request = HttpRequestBuilder().url("https://127.0.0.1:${server.port}/").build()
        try {
            client1.send(request)
        } catch (e: HttpException) {
            flag = true
            @Expect(e.message, "TLS must be configured when HTTPS requests are sent.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func get_config(): Unit {
        let client = ClientBuilder().tlsConfig(clientConfig()).build()
        let cfg = client.getTlsConfig().getOrThrow()
        println((cfg as TlsClientConfig).getOrThrow().serverName)
        let a = cfg.certificate
    }
}

// ASSERT: scan TLS handshake error, the connection is closed
// ASSERT: scan ./files/root_rsa.cer
// ASSERT: scan None
