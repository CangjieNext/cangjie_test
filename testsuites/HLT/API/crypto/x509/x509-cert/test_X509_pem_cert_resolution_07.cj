/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %output  %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.fs.*
import stdx.crypto.x509.*

var sum = 0

@Test
class Test_X509_pem_cert_resolution_07 {
    public override func beforeEach(): Unit {
        sum = 0
    }
    let pemData = String.fromUtf8(File.readFrom("./data/root_rsa.cer"))
    let pemx509 = X509Certificate.decodeFromPem(pemData)
    let pemData1 = String.fromUtf8(File.readFrom("./data/end_ecdsa.cer"))
    let pemx509_1 = X509Certificate.decodeFromPem(pemData1)

    @TestCase
    func test_pemformat_publickey_01(): Unit {
        @Expect(pemx509[0].publicKey.toString(), "PublicKey(for 2.5.4.6: CN\n2.5.4.8: GuangDong\n2.5.4.7: ShenZhen\n2.5.4.10: PMS Technologies Co., Ltd\n2.5.4.11: OSS & Service Tools Dept\n2.5.4.3: OSS3.0 CA\n)")
        @Expect(pemx509_1[0].publicKey.toString(), "PublicKey(for 2.5.4.6: CN\n2.5.4.8: GD\n2.5.4.7: SZ\n2.5.4.10: COM\n2.5.4.11: NSP\n2.5.4.3: CLIENT\n1.2.840.113549.1.9.1: youremail@qq.com\n)")
        let derData = pemx509[0].publicKey.encodeToDer()
        @Expect(derData.size, 422)
        @Expect(derData.hashCode(), -6179307143943801750)
        let derData1 = pemx509_1[0].publicKey.encodeToDer()
        @Expect(derData1.size, 91)
        @Expect(derData1.hashCode(), 423537171913754868)
    }

    @TestCase
    func test_pemformat_dnsname_02(): Unit {
        @Expect(pemx509[0].dnsNames, Array<String>())
        @Expect(pemx509_1[0].dnsNames, ["oss.PMS.com"])
    }

    @TestCase
    func test_pemformat_emailaddresses_03(): Unit {
        @Expect(pemx509[0].emailAddresses, ["defaultca"])
        @Expect(pemx509_1[0].emailAddresses, Array<String>())
    }

    @TestCase
    func test_pemformat_ipaddresses_04(): Unit {
        @Expect(Array<Byte>().size, 0)
        @Expect(pemx509[0].IPAddresses, Array<IP>())
        @Expect(pemx509[0].IPAddresses, Array<IP>())
    }

    @TestCase
    func test_pemformat_keyusage_05(): Unit {
        @Expect(pemx509[0].keyUsage.toString(),"CRLSign, CertSign")
        @Expect(pemx509_1[0].keyUsage.toString(),"")
    }

    @TestCase
    func test_pemformat_extkeyusage_06(): Unit {
        @Expect(pemx509[0].extKeyUsage.toString(), "")
        @Expect(pemx509_1[0].extKeyUsage.toString(), "")
    }

    @TestCase
    func test_pemformat_keyUsage_07(): Unit {
        let keyusage = KeyUsage(0)
        let keyusage1 = KeyUsage(1)
        let keyusage2 = KeyUsage(2)
        let keyusage3 = KeyUsage(3)
        let keyusage4 = KeyUsage(4)
        let keyusage5 = KeyUsage(5)
        @Expect(keyusage.toString(), "")
        @Expect(keyusage1.toString(), "EncipherOnly")
        @Expect(keyusage2.toString(), "CRLSign")
        @Expect(keyusage3.toString(), "EncipherOnly, CRLSign")
        @Expect(keyusage4.toString(),"CertSign")
        @Expect(keyusage5.toString(), "EncipherOnly, CertSign")
    }

    @TestCase
    func test_pemformat_extkeyusage_08(): Unit {
        let keyusage = ExtKeyUsage(Array<UInt16>())
        let keyusage0 = ExtKeyUsage([0u16])
        let keyusage1 = ExtKeyUsage([1u16])
        let keyusage2 = ExtKeyUsage([2u16])
        let keyusage3 = ExtKeyUsage([3u16])
        let keyusage4 = ExtKeyUsage([4u16])
        let keyusage5 = ExtKeyUsage([5u16])
        let keyusage6 = ExtKeyUsage([6u16])
        let keyusage7 = ExtKeyUsage([7u16])
        let keyusage8 = ExtKeyUsage([8u16])
        @Expect(keyusage.toString(), "")
        @Expect(keyusage0.toString(), "AnyKey")
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
