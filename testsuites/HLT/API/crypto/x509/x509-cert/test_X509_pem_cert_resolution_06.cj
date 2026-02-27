/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ../data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %output  %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.fs.*
import stdx.crypto.x509.*

@Test
class Test_X509_pem_cert_resolution_06 {
    let pemData = String.fromUtf8(File.readFrom("./data/root_rsa.cer"))
    let pemx509 = X509Certificate.decodeFromPem(pemData)
    let pemData1 = String.fromUtf8(File.readFrom("./data/root_rsa.cer"))
    let pemx509_1 = X509Certificate.decodeFromPem(pemData1)
    let pemData2 = String.fromUtf8(File.readFrom("./data/end_ecdsa.cer"))
    let pemx509_2 = X509Certificate.decodeFromPem(pemData2)

    @TestCase
    func test_pemformat_serialnumber_01(): Unit {
        @Expect(pemx509[0].serialNumber.toString(), "25CEFDE9E6A576E10000000000000000")
        @Expect(pemx509_2[0].serialNumber.toString(), "1C35D56648F61EDBB71F3E77CE4AA68DEE459943")
    }
    @TestCase
    func test_pemformat_signaturealgorithm_02(): Unit {
        @Expect(pemx509[0].signatureAlgorithm.toString(),"Signature Algorithm: sha256WithRSAEncryption")
        @Expect(pemx509_2[0].signatureAlgorithm.toString(),"Signature Algorithm: ecdsa-with-SHA256")
    }

    @TestCase
    func test_pemformat_signature_03(): Unit {
        @Expect(pemx509[0].signature.signatureValue.size, 384)
        @Expect(pemx509[0].signature.signatureValue.hashCode(), -1521537693010147931)
        @Expect(pemx509[0].signature.hashCode(), -1521537693010147931)
        @Expect(pemx509_2[0].signature.signatureValue.size, 70)
        @Expect(pemx509_2[0].signature.signatureValue.hashCode(), 3447715071764667227)
        @Expect(pemx509_2[0].signature.hashCode(), 3447715071764667227)
        @Expect(pemx509[0].signature == pemx509_1[0].signature)
        @Expect(pemx509[0].signature != pemx509_2[0].signature)
    }

    @TestCase
    func test_pemformat_issuer_04(): Unit {
        @Expect(pemx509[0].issuer.countryName.toString(), "Some(CN)")
        @Expect(pemx509[0].issuer.provinceName.toString(), "Some(GuangDong)")
        @Expect(pemx509[0].issuer.localityName.toString(), "Some(ShenZhen)")
        @Expect(pemx509[0].issuer.organizationName.toString(), "Some(PMS Technologies Co., Ltd)")
        @Expect(pemx509[0].issuer.organizationalUnitName.toString(), "Some(OSS & Service Tools Dept)")
        @Expect(pemx509[0].issuer.commonName.toString(), "Some(OSS3.0 CA)")
        @Expect(pemx509[0].issuer.email.toString(), "None")

        @Expect(pemx509_2[0].issuer.countryName.toString(), "Some(CN)")
        @Expect(pemx509_2[0].issuer.provinceName.toString(), "Some(GD)")
        @Expect(pemx509_2[0].issuer.localityName.toString(), "Some(SZ)")
        @Expect(pemx509_2[0].issuer.organizationName.toString(), "Some(COM)")
        @Expect(pemx509_2[0].issuer.organizationalUnitName.toString(), "Some(NSP)")
        @Expect(pemx509_2[0].issuer.commonName.toString(), "Some(CA)")
        @Expect(pemx509_2[0].issuer.email.toString(), "Some(youremail@qq.com)")
    }

    @TestCase
    func test_pemformat_subject_time_05(): Unit {
        @Expect(pemx509[0].subject.countryName.toString(), "Some(CN)")
        @Expect(pemx509[0].subject.provinceName.toString(), "Some(GuangDong)")
        @Expect(pemx509[0].subject.localityName.toString(), "Some(ShenZhen)")
        @Expect(pemx509[0].subject.organizationName.toString(), "Some(PMS Technologies Co., Ltd)")
        @Expect(pemx509[0].subject.organizationalUnitName.toString(), "Some(OSS & Service Tools Dept)")
        @Expect(pemx509[0].subject.commonName.toString(), "Some(OSS3.0 CA)")
        @Expect(pemx509[0].subject.email.toString(), "None")
        @Expect(pemx509[0].notBefore.toString().contains("2021-05-23T00:00:00"))
        @Expect(pemx509[0].notAfter.toString().contains("2036-05-20T00:00:00"))

        @Expect(pemx509_2[0].subject.countryName.toString(), "Some(CN)")
        @Expect(pemx509_2[0].subject.provinceName.toString(), "Some(GD)")
        @Expect(pemx509_2[0].subject.localityName.toString(), "Some(SZ)")
        @Expect(pemx509_2[0].subject.organizationName.toString(), "Some(COM)")
        @Expect(pemx509_2[0].subject.organizationalUnitName.toString(), "Some(NSP)")
        @Expect(pemx509_2[0].subject.commonName.toString(), "Some(CLIENT)")
        @Expect(pemx509_2[0].subject.email.toString(), "Some(youremail@qq.com)")
        @Expect(pemx509_2[0].notBefore.toString().contains("2023-02-24T08:57:28"))
        @Expect(pemx509_2[0].notAfter.toString().contains("2033-02-21T08:57:28"))
    }

    @TestCase
    func test_pemformat_publicKeyalgorithm_06(): Unit {
        @Expect(pemx509[0].publicKeyAlgorithm.toString(), "Public Key Algorithm: rsaEncryption")
        @Expect(pemx509_2[0].publicKeyAlgorithm.toString(), "Public Key Algorithm: id-ecPublicKey")
        @Expect(pemx509[0].publicKeyAlgorithm == pemx509_1[0].publicKeyAlgorithm)
        @Expect(pemx509[0].publicKeyAlgorithm != pemx509_2[0].publicKeyAlgorithm)
    }
}
