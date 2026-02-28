/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %output  %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.fs.*
import stdx.crypto.x509.*
import stdx.crypto.common.*
import stdx.crypto.keys.*

var sum = 0

@Test
class Test_X509_derformat_encode_04 {
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_correct_rsa_cert_encode_01(): Unit {
        let derData = DerBlob(File.readFrom("./data/root_rsa.der"))
        @Expect(derData.size, 1596)
        @Expect(derData.hashCode(), -1277195204321811497)
        let derx509 = X509Certificate.decodeFromDer(derData)
        let derData1 = derx509.encodeToDer()
        @Expect(derData1.size, derData.size)
        @Expect(derData1.body, derData.body)
        @Expect(derData1.hashCode(), derData.hashCode())
    }

    @TestCase
    func test_correct_rsa_cert_decode_encode_decode_02(): Unit {
        let derData = DerBlob(File.readFrom("./data/root_rsa.der"))
        @Expect(derData.size, 1596)
        @Expect(derData.hashCode(), -1277195204321811497)
        let derx509 = X509Certificate.decodeFromDer(derData)
        let derData1 = derx509.encodeToDer()
        let derx509_1 = X509Certificate.decodeFromDer(derData1)
        @Expect(derx509.toString(), derx509_1.toString())
        @Expect(derx509.hashCode(), derx509_1.hashCode())
    }

    @TestCase
    func test_compare_rsa_cert_decode_encode_decode_03(): Unit {
        let derData = DerBlob(File.readFrom("./data/root_rsa.der"))
        @Expect(derData.size, 1596)
        @Expect(derData.hashCode(), -1277195204321811497)
        let derx509 = X509Certificate.decodeFromDer(derData)
        let derData1 = derx509.encodeToDer()
        let derx509_1 = X509Certificate.decodeFromDer(derData1)
        @Expect(derx509 == derx509_1)
    }

    @TestCase
    func test_compare_rsa_cert_decode_encode_decode_04(): Unit {
        let derData = DerBlob(File.readFrom("./data/root_rsa.der"))
        @Expect(derData.size, 1596)
        @Expect(derData.hashCode(), -1277195204321811497)
        let derx509 = X509Certificate.decodeFromDer(derData)
        let pemData = String.fromUtf8(File.readFrom("./data/root_rsa.cer"))
        let pemx509 = X509Certificate.decodeFromPem(pemData)[0]
        @Expect(derx509 == pemx509)
    }

    @TestCase
    func test_compare_rsa_cert_decode_encode_decode_05(): Unit {
        let derData = DerBlob(File.readFrom("./data/root_rsa.der"))
        @Expect(derData.size, 1596)
        @Expect(derData.hashCode(), -1277195204321811497)
        let derx509 = X509Certificate.decodeFromDer(derData)
        let pemData = String.fromUtf8(File.readFrom("./data/root_ecdsa.cer"))
        let pemx509 = X509Certificate.decodeFromPem(pemData)[0]
        @Expect(derx509 != pemx509)
    }
}
