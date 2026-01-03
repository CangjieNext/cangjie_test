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
import stdx.crypto.common.*

var sum = 0

@Test
class Test_X509_pemformat_decode_01 {
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_correct_rsa_cert_01(): Unit {
        let pemData = String.fromUtf8(File.readFrom("./data/root_rsa.cer"))
        let pemx509 = X509Certificate.decodeFromPem(pemData)
        @Expect(pemx509[0].toString(), "X509Certificate(for=c=CN,st=GuangDong,l=ShenZhen,o=PMS Technologies Co., Ltd,ou=OSS & Service Tools Dept,cn=OSS3.0 CA, valid in ${pemx509[0].notBefore.toString()}..${pemx509[0].notAfter.toString()}, issued by c=CN,st=GuangDong,l=ShenZhen,o=PMS Technologies Co., Ltd,ou=OSS & Service Tools Dept,cn=OSS3.0 CA)")
        @Expect(pemx509[0].hashCode(), -1277195204321811497)
    }

    @TestCase
    func test_correct_rsa_cert_02(): Unit {
        let pemData = String.fromUtf8(File.readFrom("./data/end_rsa.cer"))
        let pemx509 = X509Certificate.decodeFromPem(pemData)
        @Expect(pemx509[0].toString(), "X509Certificate(for=c=CN,o=PMS,cn=Platform Cert, valid in ${pemx509[0].notBefore.toString()}..${pemx509[0].notAfter.toString()}, issued by c=CN,st=GuangDong,l=ShenZhen,o=PMS Technologies Co., Ltd,ou=OSS & Service Tools Dept,cn=OSS3.0 CA)")
        @Expect(pemx509[0].hashCode(), -8062992863771515701)
    }

    @TestCase
    func test_correct_rsa_private_03(): Unit {
        let pemData = String.fromUtf8(File.readFrom("./data/end_rsa_private_key.pem"))
        try {
            X509Certificate.decodeFromPem(pemData)
        } catch (e: X509Exception) {
            @Expect(e.message.contains("No CERTIFICATE entry found in PEM file"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_correct_ecdsa_cert_04(): Unit {
        let pemData = String.fromUtf8(File.readFrom("./data/root_ecdsa.cer"))
        let pemx509 = X509Certificate.decodeFromPem(pemData)
        @Expect(pemx509[0].toString(), "X509Certificate(for=c=CN,st=GD,l=SZ,o=COM,ou=NSP,cn=CA,email=youremail@qq.com, valid in ${pemx509[0].notBefore.toString()}..${pemx509[0].notAfter.toString()}, issued by c=CN,st=GD,l=SZ,o=COM,ou=NSP,cn=CA,email=youremail@qq.com)")
        @Expect(pemx509[0].hashCode(), -2258875716169435759)
    }

    @TestCase
    func test_correct_ecdsa_cert_05(): Unit {
        let pemData = String.fromUtf8(File.readFrom("./data/end_ecdsa.cer"))
        let pemx509 = X509Certificate.decodeFromPem(pemData)
        @Expect(pemx509[0].toString(), "X509Certificate(for=c=CN,st=GD,l=SZ,o=COM,ou=NSP,cn=CLIENT,email=youremail@qq.com, valid in ${pemx509[0].notBefore.toString()}..${pemx509[0].notAfter.toString()}, issued by c=CN,st=GD,l=SZ,o=COM,ou=NSP,cn=CA,email=youremail@qq.com)")
        @Expect(pemx509[0].hashCode(), 2044565281879382708)
    }

    @TestCase
    func test_correct_ecdsa_private_06(): Unit {
        let pemData = String.fromUtf8(File.readFrom("./data/end_ecdsa_private_key.pem"))
        try {
            X509Certificate.decodeFromPem(pemData)
        } catch (e: X509Exception) {
            @Expect(e.message.contains("No CERTIFICATE entry found in PEM file"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_blank_cert_07(): Unit {
        let pemData = String.fromUtf8(File.readFrom("./data/root_rsa_blank.cer"))
        try {
            X509Certificate.decodeFromPem(pemData)
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
            X509Certificate.decodeFromPem(pemData)
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
            X509Certificate.decodeFromPem(pemData)
        } catch (e: CryptoException) {
            @Expect(e.message.contains("Failed to parse base64 encoded PEM body"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_expired_cert_10(): Unit {
        let pemData = String.fromUtf8(File.readFrom("./data/end_ecdsa_2.cer"))
        let pemx509 = X509Certificate.decodeFromPem(pemData)
        @Expect(pemx509[0].toString(), "X509Certificate(for=c=CN,st=GD,l=SZ,o=COM,ou=NSP,cn=CLIENT,email=youremail@qq.com, valid in ${pemx509[0].notBefore.toString()}..${pemx509[0].notAfter.toString()}, issued by c=CN,st=GD,l=SZ,o=COM,ou=NSP,cn=CA,email=youremail@qq.com)")
        @Expect(pemx509[0].hashCode(), -100953180573305957)
    }

    @TestCase
    func test_error_path_cert_11(): Unit {
        try {
            X509Certificate.decodeFromPem(String.fromUtf8(File.readFrom("./data/end_ecdsa_3.cer")))
        } catch (e: FSException) {
            @Expect(e.message.contains("does not exist or permission denied"))
            sum += 1
        }
        @Expect(sum, 1)
    }
}
