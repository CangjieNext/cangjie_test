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
// (not Windows and not OHOS)RUN-EXEC: %run_stdx %output %run_utest_opt %run_args
// (Windows and OHOS)RUN-EXEC: dos2unix "./data/root_ecdsa_1.text" &&  dos2unix "./data/root_rsa_public_key.pem" && %run %run_opt %output %run_utest_opt %run_args

import std.fs.*
import stdx.crypto.x509.*
import stdx.crypto.common.*
import stdx.crypto.keys.*
import stdx.net.tls.*

var sum = 0
@When[os != "Windows"]
let size_1: Int64 = 739
@When[os != "Windows"]
let hashcode_1: Int64 = -7301495605456071079
@When[os != "Windows"]
let size_2: Int64 = 625
@When[os != "Windows"]
let hashcode_2: Int64 = -4113800932902903503
@When[os == "Windows"]
let size_1: Int64 = 740
@When[os == "Windows"]
let hashcode_1: Int64 = -4985434884623583954
@When[os == "Windows"]
let size_2: Int64 = 636
@When[os == "Windows"]
let hashcode_2: Int64 = -2681732735912488094

@Test
class Test_der_verify_GeneralPublicKey_02 {
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_verify_blank_cert_01(): Unit {
        let derData = DerBlob(File.readFrom("./data/root_rsa_blank.der"))
        @Expect(derData.size, 0)
        @Expect(derData.hashCode(), 0)
        try {
            GeneralPublicKey.decodeDer(derData)
        } catch (e: CryptoException) {
            @Expect(e.message.contains("Predicate failed"))
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
            GeneralPublicKey.decodeDer(derData)
        } catch (e: CryptoException) {
            @Expect(e.message.contains("Failed to load public key, it's either corrupted, or the format is unsupported"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_verify_pem_cert_03(): Unit {
        let derData = DerBlob(File.readFrom("./data/root_rsa_public_key.pem"))
        @Expect(derData.size, size_2)
        @Expect(derData.hashCode(), hashcode_2)
        try {
            GeneralPublicKey.decodeDer(derData)
        } catch (e: CryptoException) {
            @Expect(e.message.contains("Failed to load public key, it's either corrupted, or the format is unsupported"))
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
            GeneralPublicKey.decodeDer(derData)
        } catch (e: CryptoException) {
            @Expect(e.message.contains("Failed to load public key, it's either corrupted, or the format is unsupported"))
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
            GeneralPublicKey.decodeDer(derData)
        } catch (e: CryptoException) {
            @Expect(e.message.contains("Failed to load public key, it's either corrupted, or the format is unsupported"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_verify_certificate_06(): Unit {
        let derData = DerBlob(File.readFrom("./data/root_rsa.der"))
        @Expect(derData.size, 1596)
        @Expect(derData.hashCode(), -1277195204321811497)
        try {
            GeneralPublicKey.decodeDer(derData)
        } catch (e: CryptoException) {
            @Expect(e.message.contains("Failed to load public key, it's either corrupted, or the format is unsupported"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_verify_public_cert_07(): Unit {
        let derData = DerBlob(File.readFrom("./data/root_rsa_public_key.der"))
        @Expect(derData.size, 422)
        @Expect(derData.hashCode(), -6179307143943801750)
        let derpub = GeneralPublicKey.decodeDer(derData)
        @Expect(derpub.toString(), "PublicKey(422 bytes)")
    }
}
