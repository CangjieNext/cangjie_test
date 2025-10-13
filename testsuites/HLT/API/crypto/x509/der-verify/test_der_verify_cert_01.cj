/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix  %f %cmp_utest_opt
// (not Windows and not OHOS)RUN-EXEC: %run_stdx %n.%suffix %run_utest_opt %run_args
// (Windows and OHOS)RUN-EXEC: dos2unix "./data/root_ecdsa_1.text" &&  dos2unix "./data/root_ecdsa.cer" && %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.fs.*
import stdx.crypto.x509.*
import stdx.crypto.common.*

var sum = 0
@When[os != "Windows"]
let size_1: Int64 = 739
@When[os != "Windows"]
let hashcode_1: Int64 = -7301495605456071079
@When[os != "Windows"]
let size_2: Int64 = 830
@When[os != "Windows"]
let hashcode_2: Int64 = 8033946155882567229
@When[os == "Windows"]
let size_1: Int64 = 740
@When[os == "Windows"]
let hashcode_1: Int64 = -4985434884623583954
@When[os == "Windows"]
let size_2: Int64 = 844
@When[os == "Windows"]
let hashcode_2: Int64 = 8502360684707140801

@Test
class Test_der_verify_cert_01 {
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_verify_blank_cert_01(): Unit {
        let derData = DerBlob(File.readFrom("./data/root_rsa_blank.der"))
        @Expect(derData.size, 0)
        @Expect(derData.hashCode(), 0)
        try {
            X509Certificate.decodeFromDer(derData)
        } catch (e: X509Exception) {
            @Expect(e.message.contains("X509 init failed: The content is empty"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_verify_text_cert_02(): Unit {
        let derData = DerBlob(File.readFrom("./data/root_ecdsa_1.text"))
        @Expect(derData.size, size_1)
        @Expect(derData.hashCode(), hashcode_1)
        try {
            X509Certificate.decodeFromDer(derData)
        } catch (e: X509Exception) {
            @Expect(e.message.contains("The field is not a sequence"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_verify_pem_cert_03(): Unit {
        let derData = DerBlob(File.readFrom("./data/root_ecdsa.cer"))
        @Expect(derData.size, size_2)
        @Expect(derData.hashCode(), hashcode_2)
        try {
            X509Certificate.decodeFromDer(derData)
        } catch (e: X509Exception) {
            @Expect(e.message.contains("The field is not a sequence"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_verify_garble_cert_04(): Unit {
        let derData = DerBlob(File.readFrom("./data/end_rsa_garble.der"))
        @Expect(derData.size, 274)
        @Expect(derData.hashCode(), -7707562200049764554)
        try {
            X509Certificate.decodeFromDer(derData)
        } catch (e: X509Exception) {
            @Expect(e.message.contains("X509 parse derfield failed"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_verify_private_cert_05(): Unit {
        let derData = DerBlob(File.readFrom("./data/end_rsa_private_key.der"))
        @Expect(derData.size, 1768)
        @Expect(derData.hashCode(), 5801112079858918936)
        try {
            X509Certificate.decodeFromDer(derData)
        } catch (e: X509Exception) {
            @Expect(e.message.contains("The field is not a sequence"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_verify_public_cert_06(): Unit {
        let derData = DerBlob(File.readFrom("./data/root_rsa_public_key.der"))
        @Expect(derData.size, 422)
        @Expect(derData.hashCode(), -6179307143943801750)
        try {
            X509Certificate.decodeFromDer(derData)
        } catch (e: X509Exception) {
            @Expect(e.message.contains("The field is not a sequence"))
            sum += 1
        }
        @Expect(sum, 1)
    }
}
