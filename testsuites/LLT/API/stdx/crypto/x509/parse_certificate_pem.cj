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

import std.fs.File
import stdx.crypto.x509.*
import stdx.crypto.common.*

@Test
class Test_X509_certificate_parser {
    private func open_file(readPath: String): X509Certificate {
        let pem = String.fromUtf8(File.readFrom(readPath))
        println(pem)
        let certificates = X509Certificate.decodeFromPem(pem)
        @Expect(certificates.size != 0, true)
        @Expect(certificates[0].IPAddresses, Array<IP>())
        certificates[0]
    }

    private func print_info(cert: X509Certificate): Unit {
        println(cert)
        println("Serial Number: ${cert.serialNumber}")
        println("Subject: ${cert.subject}")
        println("Issuer: ${cert.issuer}")
        println("NotBefore: ${cert.notBefore}")
        println("NotAfter: ${cert.notAfter}")
        println(cert.signatureAlgorithm)
        let signature = cert.signature
        println(signature.hashCode())
        println(cert.publicKeyAlgorithm)
        let pubKey = cert.publicKey
        println(pubKey.encodeToPem().encode())
    }

    @TestCase
    func test_parse_certificate_01(): Unit {
        let cert = open_file("./files/root_rsa.cer")
        print_info(cert)
    }

    @TestCase
    func test_parse_certificate_02(): Unit {
        let cert = open_file("./files/roots.crt")
        print_info(cert)
    }

    @TestCase
    func test_parse_certificate_03(): Unit {
        let cert = open_file("./files/version1.crt")
        print_info(cert)
    }

    @TestCase
    func test_parse_certificate_04(): Unit {
        let cert = open_file("./files/version1_2.crt")
        print_info(cert)
    }

    @TestCase
    func test_parse_certificate_05(): Unit {
        let cert = open_file("./files/x509_rsa_sha1.crt")
        print_info(cert)
    }

    @TestCase
    func test_parse_certificate_06(): Unit {
        let cert = open_file("./files/X509_rsa_sha384.crt")
        print_info(cert)
    }

    @TestCase
    func test_parse_certificate_07(): Unit {
        let cert = open_file("./files/x509_rsa_sha512.crt")
        print_info(cert)
    }

    @TestCase
    func test_parse_certificate_08(): Unit {
        let cert = open_file("./files/x509_escda_sha1.crt")
        print_info(cert)
    }

    @TestCase
    func test_parse_certificate_09(): Unit {
        let cert = open_file("./files/x509_escda_sha384.crt")
        print_info(cert)
    }

    @TestCase
    func test_parse_certificate_10(): Unit {
        let cert = open_file("./files/x509_escda_sha512.crt")
        print_info(cert)
    }

    @TestCase
    func test_parse_certificate_11(): Unit {
        let cert1 = open_file("./files/x509_escda_sha512.crt")
        let cert2 = open_file("./files/x509_escda_sha384.crt")
        if (cert1.signatureAlgorithm == cert2.signatureAlgorithm) {
            println("signatureAlgorithm is same")
        }
        if (cert1.signatureAlgorithm != cert2.signatureAlgorithm) {
            println("signatureAlgorithm not same")
        }

        if (cert1.signature == cert2.signature) {
            println("signature is same")
        }
        if (cert1.signature != cert2.signature) {
            println("signature not same")
        }

        if (cert1.publicKeyAlgorithm == cert2.publicKeyAlgorithm) {
            println("publicKeyAlgorithm is same")
        }
        if (cert1.publicKeyAlgorithm != cert2.publicKeyAlgorithm) {
            println("publicKeyAlgorithm not same")
        }
    }

    @TestCase
    func test_parse_certificate_12(): Unit {
        let cert = open_file("./files/x509_dsa_sha1.crt")
        print_info(cert)
    }

    @TestCase
    func test_parse_certificate_13(): Unit {
        let cert = open_file("./files/x509_dsa_sha256.crt")
        print_info(cert)
    }

    @TestCase
    func test_parse_certificate_14(): Unit {
        let pem = String.fromUtf8(File.readFrom("./files/ec.crt"))
        let certificates = X509Certificate.decodeFromPem(pem)
        let cert = certificates[0]
        print_info(cert)
    }

    @TestCase
    // Signature algorithm is RSASSA-PSS(Unknown algorithm)
    func test_parse_certificate_15(): Unit {
        let cert = open_file("./files/ca.cer")
        print_info(cert)
    }

    @TestCase
    // PEM Header is -----BEGIN TRUSTED CERTIFICATE-----
    func test_parse_certificate_16(): Unit {
        let cert = open_file("./files/cert.trust.crt")
        print_info(cert)
    }

    @TestCase
    func test_error(): Unit {
        let readPath = "./files/end_rsa_private_key.pem"
        let pem = String.fromUtf8(File.readFrom(readPath))
        try {
            X509Certificate.decodeFromPem(pem)
        } catch (e: X509Exception) {
            @Expect(e.message.contains("No CERTIFICATE entry found in PEM file"))
        }
    }

    @TestCase
    func test_certificate_email(): Unit {
        let readPath = "./files/email-certificate.crt"
        let pem = String.fromUtf8(File.readFrom(readPath))
        let certificates = X509Certificate.decodeFromPem(pem)
        let cert = certificates[0]
        @Assert(cert.emailAddresses[0] == "test@huawei.com", true)
    }

    @TestCase
    func test_certificate_extensions(): Unit {
        let readPath = "./files/test.crt"
        let pem = String.fromUtf8(File.readFrom(readPath))
        let certificates = X509Certificate.decodeFromPem(pem)
        let cert = certificates[0]
        @Assert(cert.dnsNames == ["yourdomain.com", "www.yourdomain.com", "api.yourdomain.com"], true)
        @Assert(cert.emailAddresses == ["admin@yourdomain.com", "support@yourdomain.com"], true)
        @Assert(cert.IPAddresses == [[192, 168, 1, 1], [10, 0, 0, 1]], true)
        @Assert(cert.keyUsage.toString() == "DataEncipherment, KeyEncipherment, NonRepudiation, DigitalSignature", true)
        @Assert(cert.extKeyUsage.toString() == "ServerAuth, ClientAuth, CodeSigning, EmailProtection", true)
    }

    @TestCase
    func test_read_and_write_certificate(): Unit {
        let readPath = "./files/root_rsa.cer"
        let pem = String.fromUtf8(File.readFrom(readPath))
        let certificates = X509Certificate.decodeFromPem(pem)
        for (i in 0..certificates.size) {
            println("The ${i}th certificate is ${certificates[i]}")
        }
        var pemEntry = certificates[0].encodeToPem()
        pemEntry.header("11111")
        pemEntry.header("22222").next()
        print(pemEntry.toString())
        @Assert(pemEntry.label == PemEntry.LABEL_CERTIFICATE, true)
    }
}
