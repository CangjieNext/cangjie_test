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
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.net.*
import std.collection.*
import stdx.log.*
import stdx.logger.*
import std.console.Console
import stdx.encoding.url.*
import stdx.net.http.*
import stdx.crypto.keys.*
//import stdx.net.tls.common.*
import stdx.net.tls.*
import stdx.crypto.x509.{X509Certificate, PrivateKey}
import std.fs.*
import std.io.*
import std.process.*

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
public class Test_noProxy {
    @TestCase
    func without_env(): Unit {
        let client1 = ClientBuilder()
            .noProxy()
            .tlsConfig(clientConfig())
            .httpProxy("127.1.1.1:8080")
            .httpsProxy("127.1.1.1:8080")
            .build()
        @Expect(client1.httpProxy, "")
        @Expect(client1.httpsProxy, "")

        let client2 = ClientBuilder().httpProxy("127.1.1.1:8080").httpsProxy("127.1.1.1:8080").noProxy().build()
        @Expect(client2.httpProxy, "")
        @Expect(client2.httpsProxy, "")
    }

    @TestCase
    func with_env(): Unit {
        Process.current.setEnv("http_proxy", "192.168.1.1:80")
        Process.current.setEnv("https_proxy", "192.168.1.1:80")
        let client1 = ClientBuilder().noProxy().tlsConfig(clientConfig()).build()
        @Expect(client1.httpProxy, "")
        @Expect(client1.httpsProxy, "")
        Process.current.removeEnv("http_proxy")
        Process.current.removeEnv("https_proxy")
    }
}
