/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ../data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix  %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %n.%suffix %run_utest_opt %run_args

import std.fs.*
import stdx.crypto.x509.*


@Test
class Test_X509_der_cert_resolution_09 {
    let derData = DerBlob(File.readFrom("./data/end_rsa.der"))
    let derx509 = X509Certificate.decodeFromDer(derData)
    let derData1 = DerBlob(File.readFrom("./data/end_rsa.der"))
    let derx509_1 = X509Certificate.decodeFromDer(derData1)
    let derData2 = DerBlob(File.readFrom("./data/root_ecdsa.der"))
    let derx509_2 = X509Certificate.decodeFromDer(derData2)

    @TestCase
    func test_pemformat_serialnumber_01(): Unit {
        @Expect(derx509.serialNumber.toString(), "25CEFDE9E6A576E10000000000000001")
        @Expect(derx509_2.serialNumber.toString(), "69B7041D98395A11B31D6B4C204810B278CB518E")
    }

    @TestCase
    func test_pemformat_signaturealgorithm_02(): Unit {
        @Expect(derx509.signatureAlgorithm.toString(),"Signature Algorithm: sha256WithRSAEncryption")
        @Expect(derx509_2.signatureAlgorithm.toString(),"Signature Algorithm: ecdsa-with-SHA256")
    }

    @TestCase
    func test_pemformat_signature_03(): Unit {
        @Expect(derx509.signature.signatureValue.size, 384)
        @Expect(derx509.signature.signatureValue.hashCode(), 2844605819000409274)
        @Expect(derx509.signature.hashCode(), 2844605819000409274)
        @Expect(derx509_2.signature.signatureValue.size, 71)
        @Expect(derx509_2.signature.signatureValue.hashCode(), -8084642043731459645)
        @Expect(derx509_2.signature.hashCode(), -8084642043731459645)
        @Expect(derx509.signature == derx509_1.signature)
        @Expect(derx509.signature != derx509_2.signature)
    }

    @TestCase
    func test_pemformat_issuer_04(): Unit {
        @Expect(derx509.issuer.countryName.toString(), "Some(CN)")
        @Expect(derx509.issuer.provinceName.toString(), "Some(GuangDong)")
        @Expect(derx509.issuer.localityName.toString(), "Some(ShenZhen)")
        @Expect(derx509.issuer.organizationName.toString(), "Some(PMS Technologies Co., Ltd)")
        @Expect(derx509.issuer.organizationalUnitName.toString(), "Some(OSS & Service Tools Dept)")
        @Expect(derx509.issuer.commonName.toString(), "Some(OSS3.0 CA)")
        @Expect(derx509.issuer.email.toString(), "None")

        @Expect(derx509_2.issuer.countryName.toString(), "Some(CN)")
        @Expect(derx509_2.issuer.provinceName.toString(), "Some(GD)")
        @Expect(derx509_2.issuer.localityName.toString(), "Some(SZ)")
        @Expect(derx509_2.issuer.organizationName.toString(), "Some(COM)")
        @Expect(derx509_2.issuer.organizationalUnitName.toString(), "Some(NSP)")
        @Expect(derx509_2.issuer.commonName.toString(), "Some(CA)")
        @Expect(derx509_2.issuer.email.toString(), "Some(youremail@qq.com)")
    }

    @TestCase
    func test_pemformat_subject_time_05(): Unit {
        @Expect(derx509.subject.countryName.toString(), "Some(CN)")
        @Expect(derx509.subject.provinceName.toString(), "None")
        @Expect(derx509.subject.localityName.toString(), "None")
        @Expect(derx509.subject.organizationName.toString(), "Some(PMS)")
        @Expect(derx509.subject.organizationalUnitName.toString(), "None")
        @Expect(derx509.subject.commonName.toString(), "Some(Platform Cert)")
        @Expect(derx509.subject.email.toString(), "None")
        @Expect(derx509.notBefore.toString().contains("2021-05-23T00:00:00"))
        @Expect(derx509.notAfter.toString().contains("2031-05-22T00:00:00"))

        @Expect(derx509_2.subject.countryName.toString(), "Some(CN)")
        @Expect(derx509_2.subject.provinceName.toString(), "Some(GD)")
        @Expect(derx509_2.subject.localityName.toString(), "Some(SZ)")
        @Expect(derx509_2.subject.organizationName.toString(), "Some(COM)")
        @Expect(derx509_2.subject.organizationalUnitName.toString(), "Some(NSP)")
        @Expect(derx509_2.subject.commonName.toString(), "Some(CA)")
        @Expect(derx509_2.subject.email.toString(), "Some(youremail@qq.com)")
        @Expect(derx509_2.notBefore.toString().contains("2023-02-24T08:57:01"))
        @Expect(derx509_2.notAfter.toString().contains("2033-02-21T08:57:01"))
    }

    @TestCase
    func test_pemformat_publicKeyalgorithm_06(): Unit {
        @Expect(derx509.publicKeyAlgorithm.toString(), "Public Key Algorithm: rsaEncryption")
        @Expect(derx509_2.publicKeyAlgorithm.toString(), "Public Key Algorithm: id-ecPublicKey")
        @Expect(derx509.publicKeyAlgorithm == derx509_1.publicKeyAlgorithm)
        @Expect(derx509.publicKeyAlgorithm != derx509_2.publicKeyAlgorithm)
    }
}
