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

class flag {
    var a = 0
}

var f = flag()

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
public class Test_onShutdown_h2 {
    @TestCase
    func overwrite(): Unit {
        f.a = 0
        let server = ServerBuilder()
            .addr("127.0.0.1")
            .port(0)
            .onShutdown({=> f.a = 1})
            .onShutdown({=> f.a = 2})
            .tlsConfig(serverConfig())
            .build()
        server.close()
        @Expect(f.a, 2)
    }

    @TestCase
    func close_by_closeGracefully(): Unit {
        f.a = 0
        let server = ServerBuilder()
            .addr("127.0.0.1")
            .port(0)
            .onShutdown({=> f.a = 3})
            .onShutdown({=> f.a = 4})
            .tlsConfig(serverConfig())
            .build()
        server.closeGracefully()
        @Expect(f.a, 4)
    }

    @TestCase
    func multiple_close(): Unit {
        f.a = 0
        let server = ServerBuilder().addr("127.0.0.1").tlsConfig(serverConfig()).port(0).onShutdown({=> f.a++}).build()
        server.closeGracefully()
        server.close()
        server.closeGracefully()
        server.close()
        @Expect(f.a, 1)
    }
}
