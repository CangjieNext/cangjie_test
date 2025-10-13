/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix  %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %n.%suffix %run_utest_opt %run_args

import std.fs.*
import stdx.crypto.x509.*
import stdx.crypto.common.*
import stdx.crypto.keys.*

var sum = 0

@Test
class Test_X509_creatreq_der_decode_06 {
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_correct_ecdsa_cert_encode_01(): Unit {
        let derData = DerBlob(File.readFrom("./data/end_ecdsa_certreq.der"))
        @Expect(derData.size, 318)
        @Expect(derData.hashCode(), -1520706448488126973)
        let derx509 = X509CertificateRequest.decodeFromDer(derData)
        @Expect(derx509.hashCode(), -1520706448488126973)
    }

    @TestCase
    func test_correct_ersa_cert_encode_02(): Unit {
        let derData = DerBlob(File.readFrom("./data/end_rsa_certreq.der"))
        @Expect(derData.size, 950)
        @Expect(derData.hashCode(), -4051599771571610980)
        let derx509 = X509CertificateRequest.decodeFromDer(derData)
        @Expect(derx509.toString(), "X509CertificateRequest(for c=CN,st=JS,l=NJ,o=HW,ou=2012,cn=cps,email=abc@123.com)")
        @Expect(derx509.hashCode(), -4051599771571610980)
    }

    @TestCase
    func test_ecdsa_private_encode_03(): Unit {
        let derData = DerBlob(File.readFrom("./data/end_ecdsa_private_key.der"))
        @Expect(derData.size, 121)
        @Expect(derData.hashCode(), 8038595102167628724)
        try {
            X509CertificateRequest.decodeFromDer(derData)
        } catch (e: Exception) {
            @Expect(e.message.contains("The field is not a sequence: DerType(class: Universal, typeIdentifier: 2, primitive: true)"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_rsa_blank_derformat_encode_04(): Unit {
        let derData = DerBlob(File.readFrom("./data/root_rsa_blank.der"))
        @Expect(derData.size, 0)
        @Expect(derData.hashCode(), 0)
        try {
            X509CertificateRequest.decodeFromDer(derData)
        } catch (e: X509Exception) {
            sum += 1
        }
        @Expect(sum, 1)
    }
}
