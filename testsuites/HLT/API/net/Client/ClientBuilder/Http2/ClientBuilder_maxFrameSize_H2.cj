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
//import stdx.net.tls.common.*
import stdx.net.tls.*
import stdx.crypto.x509.{X509Certificate, PrivateKey}
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
public class Test_maxFrameSize {
    @TestCase
    func default(): Unit {
        let client = ClientBuilder().tlsConfig(clientConfig()).build()
        @Expect(client.maxFrameSize, 16384)
    }

    @TestCase
    func min_value(): Unit {
        let client = ClientBuilder().tlsConfig(clientConfig()).maxFrameSize(UInt32(2 ** 14)).build()
        @Expect(client.maxFrameSize, UInt32(2**14))
    }

    @TestCase
    func max_value(): Unit {
        let client = ClientBuilder().tlsConfig(clientConfig()).maxFrameSize(UInt32(2 ** 24 - 1)).build()
        @Expect(client.maxFrameSize, UInt32(2**24-1))
    }

    @TestCase
    func less_min_value(): Unit {
        var flag = false
        try {
            let client = ClientBuilder().tlsConfig(clientConfig()).maxFrameSize(UInt32(2 ** 14 - 1)).build()
        } catch (e: IllegalArgumentException) {
            flag = true
            @Expect(e.message.contains("MaxFrameSize should between 2^14 and 2^24-1."))
        }
        @Expect(flag, true)
    }

    @TestCase
    func greater_max_value(): Unit {
        var flag = false
        try {
            let client = ClientBuilder().tlsConfig(clientConfig()).maxFrameSize(UInt32(2 ** 24)).build()
        } catch (e: IllegalArgumentException) {
            flag = true
            @Expect(e.message.contains("MaxFrameSize should between 2^14 and 2^24-1."))
        }
        @Expect(flag, true)
    }
}
