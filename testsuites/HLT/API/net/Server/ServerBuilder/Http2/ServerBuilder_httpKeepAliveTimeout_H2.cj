/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
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
import stdx.crypto.kit.*
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

func send_request(s: Server) {
    spawn {
        s.serve()
    }
    sleep(Duration.second)
    let c = ClientBuilder().tlsConfig(clientConfig()).build()

    let request = HttpRequestBuilder()
        .header("connection", "keep-alive")
        .method("GET")
        .version(HTTP2_0)
        .url("https://127.0.0.1:${s.port}/dd")
        .build()

    let res = c.send(request)
    return res
}

@Test
public class Test_httpKeepAliveTimeout_h2 {
    @TestCase
    func default(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").tlsConfig(serverConfig()).port(0).build()
        @Expect(server.httpKeepAliveTimeout, Duration.Max)
        server.close()
    }

    @TestCase
    func zero(): Unit {
        let server = ServerBuilder()
            .addr("127.0.0.1")
            .tlsConfig(serverConfig())
            .port(0)
            .httpKeepAliveTimeout(Duration.Zero)
            .build()
        server.distributor.register("/dd", {ctx => ctx.responseBuilder.body("hello")})
        @Expect(server.httpKeepAliveTimeout, Duration.Zero)
        let res1 = send_request(server)
        let res2 = send_request(server)
        server.close()
    }
}
