/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../x509/data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %n.%suffix %run_utest_opt %run_args

import std.fs.*
import stdx.crypto.common.*
import stdx.crypto.kit.*
import stdx.crypto.x509.*

@Test
class Test_DefaultCryptoKit {
    let kit = DefaultCryptoKit()

    @TestCase
    func test_01(): Unit {
        var r1 = kit.getRandomGen()
        for (_ in 0..100) {
            @Assert(r1.nextBits(3) < 10)
        }
    }

    @TestCase
    func test_02(): Unit {
        var parser = kit.publicKeyFromDer(DerBlob(File.readFrom("./data/root_rsa_public_key.der")))
        @Expect(parser.toString(), "PublicKey(422 bytes)")
    }

    @TestCase
    func test_03(): Unit {
        var parser = kit.publicKeyFromPem(String.fromUtf8(File.readFrom("./data/root_rsa_public_key.pem")))
        @Expect(parser.toString(), "PublicKey(422 bytes)")
    }

    @TestCase
    func test_04(): Unit {
        var parser = kit.privateKeyFromDer(DerBlob(File.readFrom("./data/end_ecdsa_private_key.der")))
        @Expect(parser.toString(), "PrivateKey(121 bytes, EC 256 bits)")
    }

    @TestCase
    func test_05(): Unit {
        var parser = kit.privateKeyFromPem(String.fromUtf8(File.readFrom("./data/end_ecdsa_private_key.pem")))
        @Expect(parser.toString(), "PrivateKey(138 bytes, EC 256 bits)")
    }

    @TestCase
    func test_06(): Unit {
        var parser = kit.certificateFromDer(DerBlob(File.readFrom("./data/root_ecdsa.der")))
        @Expect((parser as X509Certificate).getOrThrow().toString(), "X509Certificate(for=c=CN,st=GD,l=SZ,o=COM,ou=NSP,cn=CA,email=youremail@qq.com, valid in 2023-02-24T08:57:01Z..2033-02-21T08:57:01Z, issued by c=CN,st=GD,l=SZ,o=COM,ou=NSP,cn=CA,email=youremail@qq.com)")
    }

    @TestCase
    func test_07(): Unit {
        var parser = kit.certificateFromPem(String.fromUtf8(File.readFrom("./data/root_ecdsa.pem")))
        @Expect((parser[0] as X509Certificate).getOrThrow().toString(), "X509Certificate(for=c=CN,st=GD,l=SZ,o=COM,ou=NSP,cn=CA,email=youremail@qq.com, valid in 2023-02-24T08:57:01Z..2033-02-21T08:57:01Z, issued by c=CN,st=GD,l=SZ,o=COM,ou=NSP,cn=CA,email=youremail@qq.com)")
    }
}
