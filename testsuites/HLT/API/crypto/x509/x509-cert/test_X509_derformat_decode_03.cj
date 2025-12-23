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
import stdx.crypto.common.*
import stdx.crypto.keys.*

var sum = 0

@Test
class Test_X509_derformat_decode_03 {
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_correct_rsa_cert_encode_01(): Unit {
        let derData = DerBlob(File.readFrom("./data/root_rsa.der"))
        @Expect(derData.size, 1596)
        @Expect(derData.hashCode(), -1277195204321811497)
        let derx509 = X509Certificate.decodeFromDer(derData)
        @Expect(derx509.toString(), "X509Certificate(for=c=CN,st=GuangDong,l=ShenZhen,o=PMS Technologies Co., Ltd,ou=OSS & Service Tools Dept,cn=OSS3.0 CA, valid in ${derx509.notBefore.toString()}..${derx509.notAfter.toString()}, issued by c=CN,st=GuangDong,l=ShenZhen,o=PMS Technologies Co., Ltd,ou=OSS & Service Tools Dept,cn=OSS3.0 CA)")
        @Expect(derx509.hashCode(), -1277195204321811497)
    }

    @TestCase
    func test_compare_derblob_02(): Unit {
        let derData = DerBlob(File.readFrom("./data/root_ecdsa.der"))
        let derData1 = DerBlob(File.readFrom("./data/root_ecdsa.der"))
        let derData2 = DerBlob(File.readFrom("./data/end_ecdsa_private_key.der"))
        @Expect(derData == derData1)
        @Expect(derData != derData2)
        @Expect(derData1 != derData2)
    }

    @TestCase
    func test_correct_ecdsa_cert_encode_03(): Unit {
        let derData = DerBlob(File.readFrom("./data/root_ecdsa.der"))
        @Expect(derData.size, 571)
        @Expect(derData.hashCode(), -2258875716169435759)
        let derx509 = X509Certificate.decodeFromDer(derData)
        @Expect(derx509.toString(), "X509Certificate(for=c=CN,st=GD,l=SZ,o=COM,ou=NSP,cn=CA,email=youremail@qq.com, valid in ${derx509.notBefore.toString()}..${derx509.notAfter.toString()}, issued by c=CN,st=GD,l=SZ,o=COM,ou=NSP,cn=CA,email=youremail@qq.com)")
        @Expect(derx509.hashCode(), -2258875716169435759)
    }

    @TestCase
    func test_ecdsa_private_encode_04(): Unit {
        let derData = DerBlob(File.readFrom("./data/end_ecdsa_private_key.der"))
        @Expect(derData.size, 121)
        @Expect(derData.hashCode(), 8038595102167628724)
        try {
            X509Certificate.decodeFromDer(derData)
        } catch (e: Exception) {
            @Expect(e.message.contains("The field is not a sequence: DerType(class: Universal, typeIdentifier: 2, primitive: true)"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_rsa_blank_derformat_encode_05(): Unit {
        let derData = DerBlob(File.readFrom("./data/root_rsa_blank.der"))
        @Expect(derData.size, 0)
        @Expect(derData.hashCode(), 0)
        try {
            X509Certificate.decodeFromDer(derData)
        } catch (e: X509Exception) {
            sum += 1
        }
        @Expect(sum, 1)
    }
}
