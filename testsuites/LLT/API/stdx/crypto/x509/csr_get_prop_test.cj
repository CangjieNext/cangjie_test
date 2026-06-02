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
import stdx.crypto.common.*

@Test
class Test_X509_certificaterequest_format {
    @TestCase
    func test_get_prop_01(): Unit {
        let pemFormat = String.fromUtf8(File.readFrom("./files/certsign.csr"))
        let CSRArray = X509CertificateRequest.decodeFromPem(pemFormat)
        @Assert(CSRArray[0].signatureAlgorithm.toString() == "Signature Algorithm: sha256WithRSAEncryption", true)
        @Assert(CSRArray[0].signature.hashCode() ==  1408614260593661796, true)
        @Assert(CSRArray[0].publicKeyAlgorithm.toString() == "Public Key Algorithm: rsaEncryption", true)
        @Assert(CSRArray[0].publicKey.toString() == "PublicKey(for 2.5.4.6: CN\n2.5.4.8: SH\n2.5.4.7: SH\n2.5.4.10: XJ\n2.5.4.11: XJ\n2.5.4.3: LDW XJ\n)", true)
    }

    @TestCase
    func test_get_prop_02(): Unit {
        let derFormat = File.readFrom("./files/x509_csr_der_format.der")
        let CSRArray = X509CertificateRequest.decodeFromDer(DerBlob(derFormat))
        @Assert(CSRArray.signatureAlgorithm.toString() == "Signature Algorithm: sha256WithRSAEncryption", true)
        @Assert(CSRArray.signature.hashCode() ==  -5343442491409636980, true)
        @Assert(CSRArray.publicKeyAlgorithm.toString() == "Public Key Algorithm: rsaEncryption", true)
        @Assert(CSRArray.publicKey.toString() == "PublicKey(for 2.5.4.6: we\n2.5.4.8: qw\n2.5.4.7: werd\n2.5.4.10: qw\n2.5.4.11: sd\n2.5.4.3: as\n1.2.840.113549.1.9.1: sd\n)", true)
    }

    @TestCase
    func test_get_prop_03(): Unit {
        let pemFormat = String.fromUtf8(File.readFrom("./files/x509_csr_all_algorithm.csr"))
        let CSRArray = X509CertificateRequest.decodeFromPem(pemFormat)
        //signatureAlgorithm: shawith256, publicKeyAlgorithm: rsa
        @Assert(CSRArray[0].signatureAlgorithm.toString() == "Signature Algorithm: sha256WithRSAEncryption", true)
        @Assert(CSRArray[0].signature.hashCode() ==  -8372137439364880279, true)
        @Assert(CSRArray[0].publicKeyAlgorithm.toString() == "Public Key Algorithm: rsaEncryption", true)
        @Assert(CSRArray[0].publicKey.toString() == "PublicKey(for 2.5.4.6: er\n2.5.4.8: qwe\n2.5.4.7: sad\n2.5.4.10: as\n2.5.4.11: we\n2.5.4.3: wqe\n1.2.840.113549.1.9.1: we\n)", true)
        //signatureAlgorithm: shawith512, publicKeyAlgorithm: rsa
        @Assert(CSRArray[1].signatureAlgorithm.toString() == "Signature Algorithm: sha512WithRSAEncryption", true)
        @Assert(CSRArray[1].signature.hashCode() ==  -4507685712875137780, true)
        @Assert(CSRArray[1].publicKeyAlgorithm.toString() == "Public Key Algorithm: rsaEncryption", true)
        @Assert(CSRArray[1].publicKey.toString() == "PublicKey(for 2.5.4.6: wr\n2.5.4.8: awrf\n2.5.4.7: qwe\n2.5.4.10: ewr\n2.5.4.11: wr\n2.5.4.3: war\n1.2.840.113549.1.9.1: qwer\n)", true)
        //signatureAlgorithm: shawith384, publicKeyAlgorithm: rsa
        @Assert(CSRArray[2].signatureAlgorithm.toString() == "Signature Algorithm: sha384WithRSAEncryption", true)
        @Assert(CSRArray[2].signature.hashCode() ==  -7418336555933804603, true)
        @Assert(CSRArray[2].publicKeyAlgorithm.toString() == "Public Key Algorithm: rsaEncryption", true)
        @Assert(CSRArray[2].publicKey.toString() == "PublicKey(for 2.5.4.6: er\n2.5.4.8: wqe\n2.5.4.7: erf\n2.5.4.10: sadf\n2.5.4.11: we\n2.5.4.3: wqe\n1.2.840.113549.1.9.1: asd\n)", true)
        //signatureAlgorithm: DSAWithSHA1, publicKeyAlgorithm: dsa
        @Assert(CSRArray[3].signatureAlgorithm.toString() == "Signature Algorithm: dsa_with_SHA1", true)
        @Assert(CSRArray[3].signature.hashCode() == 763993317831140893, true)
        @Assert(CSRArray[3].publicKeyAlgorithm.toString() == "Public Key Algorithm: dsaEncryption", true)
        @Assert(CSRArray[3].publicKey.toString() == "PublicKey(for 2.5.4.6: er\n2.5.4.8: saf\n2.5.4.7: sad\n2.5.4.10: sdf\n2.5.4.11: asf\n2.5.4.3: asf\n1.2.840.113549.1.9.1: saf\n)", true)
        //signatureAlgorithm: DSAWithSHA256, publicKeyAlgorithm: dsa
        @Assert(CSRArray[4].signatureAlgorithm.toString() == "Signature Algorithm: dsa_with_SHA256", true)
        @Assert(CSRArray[4].signature.hashCode() == -1367817299573384504, true)
        @Assert(CSRArray[4].publicKeyAlgorithm.toString() == "Public Key Algorithm: dsaEncryption", true)
        @Assert(CSRArray[4].publicKey.toString() == "PublicKey(for 2.5.4.6: WE\n2.5.4.8: SAD\n2.5.4.7: SD\n2.5.4.10: ASD\n2.5.4.11: we\n2.5.4.3: we\n1.2.840.113549.1.9.1: ad\n)", true)
        //signatureAlgorithm: ESCDAWithSHA1, publicKeyAlgorithm: escda
        @Assert(CSRArray[5].signatureAlgorithm.toString() == "Signature Algorithm: ecdsa-with-SHA1", true)
        @Assert(CSRArray[5].signature.hashCode() == -5914880210452564005, true)
        @Assert(CSRArray[5].publicKeyAlgorithm.toString() == "Public Key Algorithm: id-ecPublicKey", true)
        @Assert(CSRArray[5].publicKey.toString() == "PublicKey(for 2.5.4.6: ER\n2.5.4.8: WAR\n2.5.4.7: wesfd\n2.5.4.10: we\n2.5.4.11: asf\n2.5.4.3: asd\n1.2.840.113549.1.9.1: asd\n)", true)
        //signatureAlgorithm: ESCDAWithSHA256, publicKeyAlgorithm: escda
        @Assert(CSRArray[6].signatureAlgorithm.toString() == "Signature Algorithm: ecdsa-with-SHA256", true)
        @Assert(CSRArray[6].signature.hashCode() == -568033758633262236, true)
        @Assert(CSRArray[6].publicKeyAlgorithm.toString() == "Public Key Algorithm: id-ecPublicKey", true)
        @Assert(CSRArray[6].publicKey.toString() == "PublicKey(for 2.5.4.6: wa\n2.5.4.8: we\n2.5.4.7: we\n2.5.4.10: wr\n2.5.4.11: sae\n2.5.4.3: asd\n1.2.840.113549.1.9.1: asd\n)", true)
        // signatureAlgorithm: ESCDAWithSHA384, publicKeyAlgorithm: escda
        @Assert(CSRArray[7].signatureAlgorithm.toString() == "Signature Algorithm: ecdsa-with-SHA384", true)
        @Assert(CSRArray[7].signature.hashCode() == -5730909569560375525, true)
        @Assert(CSRArray[7].publicKeyAlgorithm.toString() == "Public Key Algorithm: id-ecPublicKey", true)
        @Assert(CSRArray[7].publicKey.toString() == "PublicKey(for 2.5.4.6: er\n2.5.4.8: we\n2.5.4.7: we\n2.5.4.10: we\n2.5.4.11: wr\n2.5.4.3: we\n1.2.840.113549.1.9.1: asd\n)", true)
        // signatureAlgorithm: ESCDAWithSHA512, publicKeyAlgorithm: escda
        @Assert(CSRArray[8].signatureAlgorithm.toString() == "Signature Algorithm: ecdsa-with-SHA512", true)
        @Assert(CSRArray[8].signature.hashCode() == 2147943344584463221, true)
        @Assert(CSRArray[8].publicKeyAlgorithm.toString() == "Public Key Algorithm: id-ecPublicKey", true)
        @Assert(CSRArray[8].publicKey.toString() == "PublicKey(for 2.5.4.6: qw\n2.5.4.8: qw\n2.5.4.7: we\n2.5.4.10: as\n2.5.4.11: ad\n2.5.4.3: sd\n1.2.840.113549.1.9.1: sd\n)", true)
        // signatureAlgorithm: MD2WithRSA, publicKeyAlgorithm: RSA
        @Assert(CSRArray[9].signatureAlgorithm.toString() == "Signature Algorithm: md5WithRSAEncryption", true)
        @Assert(CSRArray[9].signature.hashCode() == 1654869541087368817, true)
        @Assert(CSRArray[9].publicKeyAlgorithm.toString() == "Public Key Algorithm: rsaEncryption", true)
        @Assert(CSRArray[9].publicKey.toString() == "PublicKey(for 2.5.4.6: Co\n2.5.4.8: St\n2.5.4.7: Lo\n2.5.4.10: Or\n2.5.4.11: Orga\n2.5.4.3: Comm\n)", true)
    }
}
