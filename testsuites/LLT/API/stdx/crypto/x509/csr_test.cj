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

var sum = 0

@Test
class Test_X509_certificaterequest_format {
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_derformat_01(): Unit {
        let der = DerBlob(File.readFrom("./files/certsign.der"))
        @Expect(der.size, 708)
        @Expect(der.hashCode(), -6481187350559112020)
        try {
            X509CertificateRequest.decodeFromDer(der)
        } catch (e: X509Exception) {
            println(e.message)
            sum += 1
        }
        @Expect(sum, 0)
    }

    @TestCase
    func test_derformat_03(): Unit {
        let derData = DerBlob(File.readFrom("./files/test_blank.der"))
        @Expect(derData.size, 0)
        @Expect(derData.hashCode(), 0)
        try {
            X509CertificateRequest.decodeFromDer(derData)
        } catch (e: X509Exception) {
            println(e.message)
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_derformat_04(): Unit {
        let derData = DerBlob(File.readFrom("./files/test_wrong.der"))
        try {
            X509CertificateRequest.decodeFromDer(derData)
        } catch (e: X509Exception) {
            println(e.message)
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_derformat_05(): Unit {
        let derData = DerBlob(File.readFrom("./files/end_ecdsa_private_key.der"))
        @Expect(derData.size, 121)
        try {
            X509CertificateRequest.decodeFromDer(derData)
        } catch (e: Exception) {
            @Expect(e.message.contains("The field is not a sequence: DerType(class: Universal, typeIdentifier: 2, primitive: true)"))
            println(e.message)
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_derformat_06(): Unit {
        let der = DerBlob(File.readFrom("./files/certsigns.der"))
        try {
            X509CertificateRequest.decodeFromDer(der)
        } catch (e: X509Exception) {
            println(e.message)
            sum += 1
        }
        @Expect(sum, 0)
    }

    @TestCase
    func test_pemformat_01(): Unit {
        let pem = String.fromUtf8(File.readFrom("./files/certsign.csr"))
        let CSRArray = X509CertificateRequest.decodeFromPem(pem)
        @Expect(CSRArray.size != 0, true)
    }

    @TestCase
    func test_pemformat_02(): Unit {
        let pem = String.fromUtf8(File.readFrom("./files/certsigns.csr"))
        let CSRArray = X509CertificateRequest.decodeFromPem(pem)
        @Expect(CSRArray.size > 1, true)
    }

    @TestCase
    func test_pemformat_03(): Unit {
        let pem = String.fromUtf8(File.readFrom("./files/test.crt"))
        try {
            X509CertificateRequest.decodeFromPem(pem)
        } catch (e: Exception) {
            @Expect(e.message.contains("No ${PemEntry.LABEL_CERTIFICATE_REQUEST} entry found in PEM file."))
            println(e.message)
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_hashcode_01(): Unit {
        let der = DerBlob(File.readFrom("./files/certsign.der"))
        let CSR = X509CertificateRequest.decodeFromDer(der)
        let pem = String.fromUtf8(File.readFrom("./files/certsign.csr"))
        let CSRArray = X509CertificateRequest.decodeFromPem(pem)
        if (CSR.hashCode() == CSRArray[0].hashCode()) {
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_parse_subject(): Unit {
        let pem = String.fromUtf8(File.readFrom("./files/extension.csr"))
        let CSRArray = X509CertificateRequest.decodeFromPem(pem)
        @Expect(CSRArray.size != 0, true)
        let csr: X509CertificateRequest = CSRArray[0]
        println("Subject: ${csr.subject}")
    }

    @TestCase
    func test_parse_extension(): Unit {
        let pem = String.fromUtf8(File.readFrom("./files/extension.csr"))
        let CSRArray = X509CertificateRequest.decodeFromPem(pem)
        @Expect(CSRArray.size != 0, true)
        let csr: X509CertificateRequest = CSRArray[0]
        println("DNSNames: ${csr.dnsNames}")
        println("EmailAddresses: ${csr.emailAddresses}")
        println("IPAddresses: ${csr.IPAddresses}")
    }

    @TestCase
    func test_toString(): Unit {
        let pem = String.fromUtf8(File.readFrom("./files/extension.csr"))
        let CSRArray = X509CertificateRequest.decodeFromPem(pem)
        @Expect(CSRArray.size != 0, true)
        let csr: X509CertificateRequest = CSRArray[0]
        @Assert(csr.toString() == "X509CertificateRequest(for c=US,st=MN,l=Minneapolis,ou=Domain Control Validated)", true)
    }
}
