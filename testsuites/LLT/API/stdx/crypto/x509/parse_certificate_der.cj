/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./files
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.fs.*
import stdx.crypto.x509.*

var sum = 0

@Test
class Test_X509_certificate_pemformat {
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_derformat_encode_02(): Unit {
        let derData = DerBlob(File.readFrom("./files/test_blank.der"))
        @Expect(derData.size, 0)
        @Expect(derData.hashCode(), 0)
        try {
            X509Certificate.decodeFromDer(derData)
        } catch (e: X509Exception) {
            println(e.message)
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_derformat_encode_03(): Unit {
        let derData = DerBlob(File.readFrom("./files/test_wrong.der"))
        try {
            X509Certificate.decodeFromDer(derData)
        } catch (e: X509Exception) {
            println(e.message)
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_derformat_encode_04(): Unit {
        let derData = DerBlob(File.readFrom("./files/end_ecdsa_private_key.der"))
        @Expect(derData.size, 121)
        try {
            X509Certificate.decodeFromDer(derData)
        } catch (e: Exception) {
            @Expect(e.message.contains("The field is not a sequence: DerType(class: Universal, typeIdentifier: 2, primitive: true)"))
            println(e.message)
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_derformat_encode_05(): Unit {
        let derData = DerBlob(File.readFrom("./files/certsign.der"))
        try {
            X509Certificate.decodeFromDer(derData)
        } catch (e: Exception) {
            @Expect(e.message.contains("X509Cert init failed: signatureAlgorithm must contain the same algorithm identifier as the signature field in the sequence tbsCertificate."))
            println(e.message)
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_derformat_encode_06(): Unit {
        let derData = DerBlob(File.readFrom("./files/version1.der"))
        try {
            let cert = X509Certificate.decodeFromDer(derData)
            @Assert(cert.subject.toString() == "o=VeriSign Trust Network,ou=VeriSign, Inc.,ou=VeriSign Time Stamping Service Root,ou=NO LIABILITY ACCEPTED, (c)97 VeriSign, Inc.", true)
        } catch (e: Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }
}
