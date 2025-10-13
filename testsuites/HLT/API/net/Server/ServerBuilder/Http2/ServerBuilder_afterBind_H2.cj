/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: files
// (not Windows) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.net.*
import std.collection.*
import stdx.net.http.*
import stdx.crypto.kit.*
import stdx.crypto.keys.*
import stdx.net.tls.common.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
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
public class Test_serverbuilder_afterbind {
    @TestCase
    func test_serverbuilder_afterbind_01(): Unit {
        let on = SyncCounter(1)
        let server = ServerBuilder().addr("127.0.0.1").tlsConfig(serverConfig()).port(0).build()
        server.distributor.register("/ss", {ctx => ctx.responseBuilder.header("hello", "value")})
        server.afterBind({=> on.dec()})
        spawn {
            server.serve()
        }
        on.waitUntilZero()
        let request1 = HttpRequestBuilder().url("https://127.0.0.1:${server.port}/ss").body("0").build()
        let client = ClientBuilder().tlsConfig(clientConfig()).build()
        let response1 = client.send(request1)
        @Expect(response1.status, 200)
        server.close()
        client.close()
    }
    @TestCase
    func test_serverbuilder_afterbind_02(): Unit {
        let on = SyncCounter(1)
        let server = ServerBuilder().addr("127.0.0.1").tlsConfig(serverConfig()).port(0).build()
        server.distributor.register("/ss", {ctx => ctx.responseBuilder.header("hello", "value")})
        server.afterBind({=> on.dec()})
        server.afterBind({=> on.dec()})
        spawn {
            server.serve()
        }
        on.waitUntilZero()
        let request1 = HttpRequestBuilder().url("https://127.0.0.1:${server.port}/ss").body("0").build()
        let client = ClientBuilder().tlsConfig(clientConfig()).build()
        let response1 = client.send(request1)
        @Expect(response1.status, 200)
        server.close()
        client.close()
    }

    @TestCase
    func test_serverbuilder_afterbind_03(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").tlsConfig(serverConfig()).port(0).build()
        server.distributor.register("/ss", {ctx => ctx.responseBuilder.header("hello", "value")})
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        server.afterBind({=> throw Exception("test_serverbuilder_afterbind_03 testcase is fail")})
        let request1 = HttpRequestBuilder().url("https://127.0.0.1:${server.port}/ss").body("0").build()
        let client = ClientBuilder().tlsConfig(clientConfig()).build()
        let response1 = client.send(request1)
        @Expect(response1.status, 200)
        server.close()
        client.close()
    }

    @TestCase
    func test_serverbuilder_afterbind_04(): Unit {
        let on = SyncCounter(1)
        let server = ServerBuilder().addr("127.0.0.1").tlsConfig(serverConfig()).port(0).build()
        server.distributor.register("/ss", {ctx => ctx.responseBuilder.header("hello", "value")})
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        let server1 = ServerBuilder().addr("127.0.0.1").tlsConfig(serverConfig()).port(server.port).build()
        server1.distributor.register("/ss", {ctx => ctx.responseBuilder.header("hello", "value")})
        server1.afterBind({=> throw Exception("test_serverbuilder_afterbind_04 testcase is fail")})
        try {
            server1.serve()
            @Expect(1, 2)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Address already in use") || e.message.contains("Address in use"), true)
        }
        server.close()
    }
}
