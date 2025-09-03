/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix   %f %cmp_utest_opt
// (not Windows and not OHOS)RUN-EXEC: %run_stdx %n.%suffix %run_utest_opt %run_args
// (Windows and OHOS)RUN-EXEC: dos2unix "./data/root_rsa_simple.cer" &&  dos2unix "./data/root_ecdsa.cer" &&  dos2unix "./data/root_ecdsa.der" && dos2unix "./data/root_rsa.der" && %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.fs.*
import stdx.crypto.x509.*
import stdx.crypto.common.*
import stdx.crypto.keys.*

var sum = 0
@When[os != "Windows"]
let pemData1 = String.fromUtf8(File.readFrom("./data/root_rsa_simple.cer"))
@When[os != "Windows"]
let pemData2 = String.fromUtf8(File.readFrom("./data/root_ecdsa.cer"))
@When[os == "Windows"]
let pemData1 = String.fromUtf8(File.readFrom("./data/root_rsa_simple_win.cer"))
@When[os == "Windows"]
let pemData2 = String.fromUtf8(File.readFrom("./data/root_ecdsa_win.cer"))

@Test
class Test_X509_derformat_pemformat_cross_05 {
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_rsa_pemformat_decode_derformat_encode_01(): Unit {
        let pemData = String.fromUtf8(File.readFrom("./data/root_rsa.cer"))
        let pemx509 = X509Certificate.decodeFromPem(pemData)
        let derData = pemx509[0].encodeToDer()
        let derData1 = DerBlob(File.readFrom("./data/root_rsa.der"))
        @Expect(derData1.size, derData.size)
        @Expect(derData1.body, derData.body)
        @Expect(derData1.hashCode(), derData.hashCode())
    }

    @TestCase
    func test_rsa_derformat_decode_pemformat_encode_02(): Unit {
        let derData = DerBlob(File.readFrom("./data/root_rsa.der"))
        @Expect(derData.size, 1596)
        @Expect(derData.hashCode(), -1277195204321811497)
        let derx509 = X509Certificate.decodeFromDer(derData)
        let pemData = derx509.encodeToPem()
        @Expect(pemData.encode(),pemData1)
    }

    @TestCase
    func test_ecdsa_pemformat_decode_derformat_encode_03(): Unit {
        let pemData = String.fromUtf8(File.readFrom("./data/root_ecdsa.cer"))
        let pemx509 = X509Certificate.decodeFromPem(pemData)
        let derData = pemx509[0].encodeToDer()
        let derData1 = DerBlob(File.readFrom("./data/root_ecdsa.der"))
        @Expect(derData1.size, derData.size)
        @Expect(derData1.body, derData.body)
        @Expect(derData1.hashCode(), derData.hashCode())
    }

    @TestCase
    func test_ecdsa_derformat_decode_pemformat_encode_04(): Unit {
        let derData = DerBlob(File.readFrom("./data/root_ecdsa.der"))
        @Expect(derData.size, 571)
        @Expect(derData.hashCode(), -2258875716169435759)
        let derx509 = X509Certificate.decodeFromDer(derData)
        let pemData = derx509.encodeToPem()
        @Expect(pemData.encode(),pemData2)
    }
}
