/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %output  %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.fs.*
import stdx.crypto.x509.*
import stdx.crypto.common.*
import stdx.crypto.keys.*

var sum = 0

@Test
class Test_X509_pemformat_encode_02 {
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_correct_ecdsa_cert_encode_01(): Unit {
        let derData = DerBlob(File.readFrom("./data/end_ecdsa_certreq.der"))
        let derx509 = X509CertificateRequest.decodeFromDer(derData)
        let derx509_1 = derx509.encodeToDer()
        //@Expect(derx509_1.toString(),"PEM CERTIFICATE REQUEST (318 bytes)")
        @Expect(derx509_1, derData)
    }

    @TestCase
    func test_correct_rsa_cert_encode_04(): Unit {
        //let pemData = String.fromUtf8(File.readFrom("./data/end_rsa_certreq.der"))
        let derData = DerBlob(File.readFrom("./data/end_rsa_certreq.der"))
        let derx509 = X509CertificateRequest.decodeFromDer(derData)
        let derx509_1 = derx509.encodeToDer()
        //@Expect(pemx509_1.toString(),"PEM CERTIFICATE REQUEST (950 bytes)")
        @Expect(derx509_1, derData)
    }
}
