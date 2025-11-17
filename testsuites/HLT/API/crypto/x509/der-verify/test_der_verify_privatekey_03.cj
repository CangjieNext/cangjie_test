/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ../data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix  %f %cmp_utest_opt
// (not Windows and not OHOS)RUN-EXEC: %run_stdx %n.%suffix %run_utest_opt %run_args
// (Windows and OHOS)RUN-EXEC: dos2unix "./data/root_ecdsa_1.text" &&  dos2unix "./data/end_rsa_private_key.pem" && dos2unix "./data/enc_pkcs8_end_rsa_private_key.pem" && dos2unix "./data/enc_128_end_rsa_private_key.pem" && %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.fs.*
import stdx.crypto.x509.*
import stdx.crypto.keys.*
import stdx.net.tls.*

var sum = 0
@When[os != "Windows"]
let size_1: Int64 = 739
@When[os != "Windows"]
let hashcode_1: Int64 = -7301495605456071079
@When[os != "Windows"]
let size_2: Int64 = 2484
@When[os != "Windows"]
let hashcode_2: Int64 = 5467726208696582013
@When[os != "Windows"]
let size_3: Int64 = 2654
@When[os != "Windows"]
let hashcode_3: Int64 = 4639342298987907298
@When[os != "Windows"]
let size_4: Int64 = 2654
@When[os != "Windows"]
let hashcode_4: Int64 = -8485645259421134084
@When[os == "Windows"]
let size_1: Int64 = 740
@When[os == "Windows"]
let hashcode_1: Int64 = -4985434884623583954
@When[os == "Windows"]
let size_2: Int64 = 2524
@When[os == "Windows"]
let hashcode_2: Int64 = -3798095016340870513
@When[os == "Windows"]
let size_3: Int64 = 2696
@When[os == "Windows"]
let hashcode_3: Int64 = 7576773108109875108
@When[os == "Windows"]
let size_4: Int64 = 2696
@When[os == "Windows"]
let hashcode_4: Int64 = -437362270461150354

@Test
class Test_der_verify_privatekey_03 {
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_verify_blank_prikey_01(): Unit {
        let derData = DerBlob(File.readFrom("./data/root_rsa_blank.der"))
        @Expect(derData.size, 0)
        @Expect(derData.hashCode(), 0)
        try {
            PrivateKey.decodeDer(derData)
        } catch (e: X509Exception) {
            @Expect(e.message.contains("Predicate failed: length > 0"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_verify_text_prikey_02(): Unit {
        let derData = DerBlob(File.readFrom("./data/root_ecdsa_1.text"))
        @Expect(derData.size, size_1)
        @Expect(derData.hashCode(), hashcode_1)
        try {
            PrivateKey.decodeDer(derData)
        } catch (e: X509Exception) {
            @Expect(e.message.contains("Failed to load private key, it's either corrupted, password is wrong or the format is unsupported"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_verify_pem_prikey_03(): Unit {
        let derData = DerBlob(File.readFrom("./data/end_rsa_private_key.pem"))
        @Expect(derData.size, size_2)
        @Expect(derData.hashCode(), hashcode_2)
        try {
            PrivateKey.decodeDer(derData)
        } catch (e: X509Exception) {
            @Expect(e.message.contains("Failed to load private key, it's either corrupted, password is wrong or the format is unsupported"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_verify_garble_prikey_04(): Unit {
        let derData = DerBlob(File.readFrom("./data/end_rsa_garble.der"))
        @Expect(derData.size, 274)
        @Expect(derData.hashCode(), -7707562200049764554)
        try {
            PrivateKey.decodeDer(derData)
        } catch (e: X509Exception) {
            @Expect(e.message.contains("Failed to load private key, it's either corrupted, password is wrong or the format is unsupported"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_verify_correct_prikey_05(): Unit {
        let derData = DerBlob(File.readFrom("./data/end_rsa_private_key.der"))
        @Expect(derData.size, 1768)
        @Expect(derData.hashCode(), 5801112079858918936)
        let derpri = PrivateKey.decodeDer(derData)
        @Expect(derpri.toString(),"PrivateKey(1768 bytes, RSA 3072 bits)")
    }

    @TestCase
    func test_verify_cert_prikey_06(): Unit {
        let derData = DerBlob(File.readFrom("./data/root_rsa.der"))
        @Expect(derData.size, 1596)
        @Expect(derData.hashCode(), -1277195204321811497)
        try {
            PrivateKey.decodeDer(derData)
        } catch (e: X509Exception) {
            @Expect(e.message.contains("Failed to load private key, it's either corrupted, password is wrong or the format is unsupported"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_verify_public_prikey_07(): Unit {
        let derData = DerBlob(File.readFrom("./data/root_rsa_public_key.der"))
        @Expect(derData.size, 422)
        @Expect(derData.hashCode(), -6179307143943801750)
        try {
            PrivateKey.decodeDer(derData)
        } catch (e: X509Exception) {
            @Expect(e.message.contains("Failed to load private key, it's either corrupted, password is wrong or the format is unsupported"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_verify_pwd_prikey_08(): Unit {
        let derData = DerBlob(File.readFrom("./data/enc_pkcs8_end_rsa_private_key.pem"))
        @Expect(derData.size, size_3)
        @Expect(derData.hashCode(), hashcode_3)
        try {
            PrivateKey.decodeDer(derData, password:"456")
        } catch (e: X509Exception) {
            @Expect(e.message.contains("Failed to load private key, the password is incorrect or the key is corrupted"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_verify_pwd_prikey_09(): Unit {
        let derData = DerBlob(File.readFrom("./data/enc_128_end_rsa_private_key.pem"))
        @Expect(derData.size, size_4)
        @Expect(derData.hashCode(), hashcode_4)
        try {
            PrivateKey.decodeDer(derData, password:"#$")
        } catch (e: X509Exception) {
            @Expect(e.message.contains("Failed to load private key, the password is incorrect or the key is corrupted"))
            sum += 1
        }
        @Expect(sum, 1)
    }
}
