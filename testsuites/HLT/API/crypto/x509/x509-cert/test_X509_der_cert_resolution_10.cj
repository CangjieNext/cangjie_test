/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix  %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %n.%suffix %run_utest_opt %run_args

import std.fs.*
import stdx.crypto.x509.*
import stdx.crypto.common.*
import stdx.crypto.keys.*

var sum = 0

@Test
class Test_X509_der_cert_resolution_10 {
    public override func beforeEach(): Unit {
        sum = 0
    }

    let derData = DerBlob(File.readFrom("./data/end_rsa.der"))
    let derx509 = X509Certificate.decodeFromDer(derData)
    let derData1 = DerBlob(File.readFrom("./data/root_ecdsa.der"))
    let derx509_1 = X509Certificate.decodeFromDer(derData1)

    @TestCase
    func test_pemformat_publickey_01(): Unit {
        @Expect(derx509.publicKey.toString(), "PublicKey(for 2.5.4.6: CN\n2.5.4.10: PMS\n2.5.4.3: Platform Cert\n)")
        @Expect(derx509_1.publicKey.toString(), "PublicKey(for 2.5.4.6: CN\n2.5.4.8: GD\n2.5.4.7: SZ\n2.5.4.10: COM\n2.5.4.11: NSP\n2.5.4.3: CA\n1.2.840.113549.1.9.1: youremail@qq.com\n)")
        let derData = derx509.publicKey.encodeToDer()
        @Expect(derData.size, 422)
        @Expect(derData.hashCode(), -5430538223583518947)
        let derData1 = derx509_1.publicKey.encodeToDer()
        @Expect(derData1.size, 91)
        @Expect(derData1.hashCode(), 9086646461133816313)
    }

    @TestCase
    func test_pemformat_dnsname_02(): Unit {
        @Expect(derx509.dnsNames, ["oss.PMS.com"])
        @Expect(derx509_1.dnsNames, Array<String>())
    }

    @TestCase
    func test_pemformat_emailaddresses_03(): Unit {
        @Expect(derx509.emailAddresses, Array<String>())
        @Expect(derx509_1.emailAddresses, Array<String>())
    }

    @TestCase
    func test_pemformat_ipaddresses_04(): Unit {
        @Expect(Array<Byte>().size, 0)
        @Expect(derx509.IPAddresses, Array<IP>())
        @Expect(derx509_1.IPAddresses, Array<IP>())
    }

    @TestCase
    func test_pemformat_keyusage_05(): Unit {
        @Expect(derx509.keyUsage.toString(), "KeyAgreement, KeyEncipherment, NonRepudiation, DigitalSignature")
        @Expect(derx509_1.keyUsage.toString(), "")
    }

    @TestCase
    func test_pemformat_extkeyusage_06(): Unit {
        @Expect(derx509.extKeyUsage.toString(), "")
        @Expect(derx509_1.extKeyUsage.toString(), "")
    }

    @TestCase
    func test_pemformat_keyUsage_07(): Unit {
        let keyusage = KeyUsage(0)
        let keyusage1 = KeyUsage(1)
        let keyusage2 = KeyUsage(2)
        let keyusage3 = KeyUsage(3)
        let keyusage4 = KeyUsage(4)
        let keyusage5 = KeyUsage(5)
        @Expect(keyusage.toString(),"")
        @Expect(keyusage1.toString(),"EncipherOnly")
        @Expect(keyusage2.toString(),"CRLSign")
        @Expect(keyusage3.toString(),"EncipherOnly, CRLSign")
        @Expect(keyusage4.toString(),"CertSign")
        @Expect(keyusage5.toString(),"EncipherOnly, CertSign")
    }

    @TestCase
    func test_pemformat_extkeyusage_08(): Unit {
        let keyusage = ExtKeyUsage(Array<UInt16>())
        let keyusage0 = ExtKeyUsage(Array<UInt16>())
        let keyusage1 = ExtKeyUsage([1u16])
        let keyusage2 = ExtKeyUsage([2u16])
        let keyusage3 = ExtKeyUsage([3u16])
        let keyusage4 = ExtKeyUsage([4u16])
        let keyusage5 = ExtKeyUsage([5u16])
        let keyusage6 = ExtKeyUsage([6u16])
        let keyusage7 = ExtKeyUsage([7u16])
        let keyusage8 = ExtKeyUsage([8u16])
        @Expect(keyusage.toString(), "")
        @Expect(keyusage0.toString(), "")
        @Expect(keyusage1.toString(), "ServerAuth")
        @Expect(keyusage2.toString(), "ClientAuth")
        @Expect(keyusage3.toString(), "EmailProtection")
        @Expect(keyusage4.toString(), "CodeSigning")
        @Expect(keyusage5.toString(), "OCSPSigning")
        @Expect(keyusage6.toString(), "TimeStamping")
        @Expect(keyusage7.toString(), "AnyKey")
        @Expect(keyusage8.toString(), "AnyKey")
    }
}
