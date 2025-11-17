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
import stdx.crypto.keys.*
import std.io.*

@Test
class Test_X509_certificaterequest_init {
    let x509Name = X509Name(
        countryName: "CN",
        provinceName: "beijing",
        localityName: "haidian",
        organizationName: "organization",
        organizationalUnitName: "organization unit",
        commonName: "x509",
        email: "test@email.com"
    )
    let ip1: IP = [8u8, 8u8, 8u8, 8u8]
    let ip2: IP = [255u8, 1u8, 255u8, 1u8, 0u8, 1u8, 0u8, 1u8, 0u8, 8u8, 0u8, 8u8, 0u8, 8u8, 0u8, 8u8]
    let ip3: IP = [8u8, 8u8, 8u8, 8u8, 8u8]

    let rsaPrivateKeyPem = String.fromUtf8(readToEnd(File("./files/end_rsa_private_key.pem", Read)))
    let rsaPrivateKey = PrivateKey.decodeFromPem(rsaPrivateKeyPem)
    let rsaPublicKeyPem = String.fromUtf8(readToEnd(File("./files/end_rsa_public_key.pem", Read)))
    let rsaPublicKey = PublicKey.decodeFromPem(rsaPublicKeyPem)

    let ecDer = DerBlob(File.readFrom("./files/end_ecdsa_private_key.der"))
    let ec = PrivateKey.decodeDer(ecDer)

    let dsaPem = String.fromUtf8(readToEnd(File("./files/dsa_private_key.pem", Read)))
    let dsa = PrivateKey.decodeFromPem(dsaPem)

    @TestCase
    func createCSR_01(): Unit {
        let csrInfo = X509CertificateRequestInfo(
            subject: x509Name,
            dnsNames: ["a.com", "b.com"],
            IPAddresses: [ip1, ip2],
            emailAddresses: ["1", "1@a.com"]
        );
        let csr = X509CertificateRequest(rsaPrivateKey, certificateRequestInfo: csrInfo, signatureAlgorithm: MD5WithRSA)
        // compare pem string between raw publickey and parse from CSR
        @Assert(csr.publicKey.encodeToPem().encode() == rsaPublicKey.encodeToPem().encode(), true)
        @Assert(csr.subject.toString() == x509Name.toString(), true)
        @Assert(csr.dnsNames == ["a.com", "b.com"], true)
        @Assert(csr.IPAddresses[0] == ip1, true)
        @Assert(csr.IPAddresses[1] == ip2, true)
        @Assert(csr.emailAddresses == ["1", "1@a.com"], true)
        @Assert(csr.signatureAlgorithm.toString() == "Signature Algorithm: md5WithRSAEncryption", true)
    }


    @TestCase
    func createCSR_02(): Unit {
        let csrInfo = X509CertificateRequestInfo(
            dnsNames: ["a.com", "b.com"],
            IPAddresses: [ip1, ip2],
            emailAddresses: ["1", "1@a.com"]
        );
        let csr = X509CertificateRequest(rsaPrivateKey, certificateRequestInfo: csrInfo, signatureAlgorithm: SHA512WithRSA)
        @Assert(csr.subject.toString() == "", true)
        @Assert(csr.dnsNames == ["a.com", "b.com"], true)
        @Assert(csr.IPAddresses[0] == ip1, true)
        @Assert(csr.IPAddresses[1] == ip2, true)
        @Assert(csr.emailAddresses == ["1", "1@a.com"], true)
        @Assert(csr.signatureAlgorithm.toString() == "Signature Algorithm: sha512WithRSAEncryption", true)
    }

    @TestCase
    func createCSR_03(): Unit {
        let csr = X509CertificateRequest(rsaPrivateKey, signatureAlgorithm: SHA384WithRSA)
        @Assert(csr.subject.toString() == "", true)
        @Assert(csr.dnsNames == Array<String>(), true)
        @Assert(csr.IPAddresses == Array<IP>(), true)
        @Assert(csr.emailAddresses == Array<String>(), true)
        @Assert(csr.signatureAlgorithm.toString() == "Signature Algorithm: sha384WithRSAEncryption", true)
    }

    @TestCase
    func createCSR_04(): Unit {
        let csr = X509CertificateRequest(ec)
        @Assert(csr.subject.toString() == "", true)
        @Assert(csr.dnsNames == Array<String>(), true)
        @Assert(csr.IPAddresses == Array<IP>(), true)
        @Assert(csr.emailAddresses == Array<String>(), true)
        @Assert(csr.signatureAlgorithm.toString() == "Signature Algorithm: ecdsa-with-SHA256", true)
    }

    @TestCase
    func createCSR_05(): Unit {
        let csr = X509CertificateRequest(dsa)
        @Assert(csr.subject.toString() == "", true)
        @Assert(csr.dnsNames == Array<String>(), true)
        @Assert(csr.IPAddresses == Array<IP>(), true)
        @Assert(csr.emailAddresses == Array<String>(), true)
        @Assert(csr.signatureAlgorithm.toString() == "Signature Algorithm: dsa_with_SHA256", true)
    }

    @TestCase
    func createCSR_06(): Unit {
        let csrInfo = X509CertificateRequestInfo(
            dnsNames: ["a.com", "b.com"],
            emailAddresses: ["1", "1@a.com"]
        );
        let csr = X509CertificateRequest(rsaPrivateKey, certificateRequestInfo: csrInfo, signatureAlgorithm: SHA512WithRSA)
        @Assert(csr.subject.toString() == "", true)
        @Assert(csr.dnsNames == ["a.com", "b.com"], true)
        @Assert(csr.emailAddresses == ["1", "1@a.com"], true)
        @Assert(csr.signatureAlgorithm.toString() == "Signature Algorithm: sha512WithRSAEncryption", true)
    }

    @TestCase
    func createCSR_error_01(): Unit {
        try {
            let csrInfo = X509CertificateRequestInfo(IPAddresses: [ip1, ip3])
        } catch (e: X509Exception) {
            @Expect(e.message.contains("Illegal IP address"))
            println(e.message)
        }
    }

    @TestCase
    func createCSR_error_02(): Unit {
        try {
            let csr = X509CertificateRequest(ec, signatureAlgorithm: SHA384WithRSA)
        } catch (e: X509Exception) {
            @Expect(e.message.contains("Private key type not match to signatureAlgorithm"))
            println(e.message)
        }
    }

    @TestCase
    func createCSR_error_03(): Unit {
        try {
            let csr = X509CertificateRequest(ec, signatureAlgorithm: UnknownSignatureAlgorithm)
        } catch (e: X509Exception) {
            @Expect(e.message.contains("X509 create certificate failed: Not supported UnknownSignatureAlgorithm."))
            println(e.message)
        }
    }
}
