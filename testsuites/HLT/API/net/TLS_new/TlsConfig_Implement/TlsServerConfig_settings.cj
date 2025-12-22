/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.collection.HashMap
import stdx.crypto.common.*
import stdx.crypto.keys.*
import stdx.crypto.x509.*
import stdx.net.tls.*
import stdx.net.tls.common.*

@Test
class Test_TlsServerConfig_Settings {
    var rsaPri = RSAPrivateKey(1024)
    var rsaPriPem = rsaPri.encodeToPem()
    var rsaPrifromPem = RSAPrivateKey.decodeFromPem(rsaPriPem.encode())
    var cfg = TlsServerConfig(Array<X509Certificate>(), rsaPrifromPem)

    @TestCase
    func test_verifyMode(): Unit {
        cfg.verifyMode = Default
        cfg.verifyMode = TrustAll
        cfg.verifyMode = CustomCA(Array<Certificate>())
        cfg.verifyMode = CustomVerify({certs: Array<Certificate> => true})
    }

    @TestCase
    func test_supportedAlpnProtocols(): Unit {
        cfg.supportedAlpnProtocols = Array<String>()
        @Assert(cfg.supportedAlpnProtocols, Array<String>())
        cfg.supportedAlpnProtocols = ["http/1.1", "http/2", "h2"]
        @Assert(cfg.supportedAlpnProtocols, ["http/1.1", "http/2", "h2"])
        cfg.supportedAlpnProtocols = ["http/1.1", "http/2", "http/1.1"]
        @Assert(cfg.supportedAlpnProtocols, ["http/1.1", "http/2", "http/1.1"])
        @AssertThrows[IllegalArgumentException](cfg.supportedAlpnProtocols = ["http/1.1\0"])
    }

    @TestCase
    func test_supportedVersions(): Unit {
        cfg.supportedVersions = [V1_2, V1_3, TLCP, V1_2]
        @Assert(cfg.supportedVersions.size, 4)
    }

    @TestCase
    func test_supportedCipherSuites(): Unit {
        cfg.supportedCipherSuites = HashMap<TlsVersion, Array<String>>()
        @Assert(cfg.supportedCipherSuites.size, 0)
        cfg.supportedCipherSuites = HashMap<TlsVersion, Array<String>>([(V1_2, ["kits1"]), (V1_3, ["kits1", "kits2"])])
        @Assert(cfg.supportedCipherSuites.size, 2)
        @Assert(cfg.supportedCipherSuites[V1_2], ["kits1"])
        @Assert(cfg.supportedCipherSuites[V1_3], ["kits1", "kits2"])
        @AssertThrows[IllegalArgumentException](cfg.supportedCipherSuites = HashMap<TlsVersion, Array<String>>([(V1_2, ["kits1\0"])]))
    }

    @TestCase
    func test_certificate(): Unit {
        @Assert(cfg.certificate.isSome())
        @AssertThrows[TlsException](cfg.certificate = None)
        var rsaPri = RSAPrivateKey(1024)
        var rsaPriPem = rsaPri.encodeToPem()
        var rsaPrifromPem = RSAPrivateKey.decodeFromPem(rsaPriPem.encode())
        cfg.certificate = (Array<Certificate>(), rsaPrifromPem)
        @Assert(cfg.certificate.isSome())
    }
}
