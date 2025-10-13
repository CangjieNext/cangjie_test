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
import stdx.crypto.crypto.*
import stdx.crypto.common.*
import std.time.*

var sum = 0

@Test
class Test_X509_certreq_pem_decode_01 {
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_correct_certreq_ecdsa_01(): Unit {
        let pemData = String.fromUtf8(File.readFrom("./data/end_ecdsa_certreq.pem"))
        let pemx509 = X509CertificateRequest.decodeFromPem(pemData)
        @Expect(pemx509[0].hashCode(), -1520706448488126973)
    }

    @TestCase
    func test_correct_certreq_rsa_02(): Unit {
        let pemData = String.fromUtf8(File.readFrom("./data/end_rsa_certreq.pem"))
        let pemx509 = X509CertificateRequest.decodeFromPem(pemData)
        @Expect(pemx509[0].toString(), "X509CertificateRequest(for c=CN,st=JS,l=NJ,o=HW,ou=2012,cn=cps,email=abc@123.com)")
        @Expect(pemx509[0].hashCode(), -4051599771571610980)
    }

    @TestCase
    func test_correct_rsa_private_03(): Unit {
        let pemData = String.fromUtf8(File.readFrom("./data/end_rsa_private_key.pem"))
        try {
            X509CertificateRequest.decodeFromPem(pemData)
        } catch (e: X509Exception) {
            @Expect(e.message.contains("No CERTIFICATE REQUEST entry found in PEM file"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_correct_ecdsa_cert_04(): Unit {
        let pemData = String.fromUtf8(File.readFrom("./data/root_ecdsa.cer"))
        try {
            X509CertificateRequest.decodeFromPem(pemData)
        } catch (e: X509Exception) {
            @Expect(e.message.contains("No CERTIFICATE REQUEST entry found in PEM file"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_correct_ecdsa_cert_05(): Unit {
        let pemData = String.fromUtf8(File.readFrom("./data/end_ecdsa.cer"))
        try {
            X509CertificateRequest.decodeFromPem(pemData)
        } catch (e: X509Exception) {
            @Expect(e.message.contains("No CERTIFICATE REQUEST entry found in PEM file"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_correct_ecdsa_private_06(): Unit {
        let pemData = String.fromUtf8(File.readFrom("./data/end_ecdsa_private_key.pem"))
        try {
            X509CertificateRequest.decodeFromPem(pemData)
        } catch (e: X509Exception) {
            @Expect(e.message.contains("No CERTIFICATE REQUEST entry found in PEM file"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_blank_cert_07(): Unit {
        let pemData = String.fromUtf8(File.readFrom("./data/root_rsa_blank.cer"))
        try {
            X509CertificateRequest.decodeFromPem(pemData)
        } catch (e: CryptoException) {
            @Expect(e.message.contains("Pem is empty"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_txtformat_cert_08(): Unit {
        let pemData = String.fromUtf8(File.readFrom("./data/root_ecdsa_1.text"))
        try {
            X509CertificateRequest.decodeFromPem(pemData)
        } catch (e: CryptoException) {
            @Expect(e.message.contains("Failed to parse PEM"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_error_pemformat_cert_09(): Unit {
        let pemData = String.fromUtf8(File.readFrom("./data/end_ecdsa_1.cer"))
        try {
            X509CertificateRequest.decodeFromPem(pemData)
        } catch (e: CryptoException) {
            @Expect(e.message.contains("Failed to parse base64 encoded PEM body"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_error_path_cert_10(): Unit {
        try {
            X509CertificateRequest.decodeFromPem(String.fromUtf8(File.readFrom("./data/end_ecdsa_3.cer")))
        } catch (e: FSException) {
            @Expect(e.message.contains("The file does not exist or permission denied"))
            sum += 1
        }
        @Expect(sum, 1)
    }
}
