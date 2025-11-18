/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ./data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// (not Windows and not OHOS)RUN-EXEC: %run_stdx %n.%suffix %run_args
// (Windows and OHOS)RUN-EXEC: dos2unix "./data/end_ecdsa.pem" && dos2unix "./data/end_ecdsa_private_key.pem" && %run_stdx %n.%suffix %run_utest_opt %run_args

import std.net.*
import std.fs.*
import stdx.net.tls.*
import stdx.crypto.x509.{X509Certificate,Pem}
import std.sync.*
import std.time.*
import std.runtime.*
import std.unittest.*
import std.unittest.testmacro.*

var sum = 0
@When[os != "Windows"]
let pemDatatest1 = String.fromUtf8(File.readFrom("./data/end_ecdsa.pem"))
@When[os != "Windows"]
let pemDatatest2 = String.fromUtf8(File.readFrom("./data/end_ecdsa_private_key.pem"))
@When[os == "Windows"]
let pemDatatest1 = String.fromUtf8(File.readFrom("./data/end_ecdsa_win.pem"))
@When[os == "Windows"]
let pemDatatest2 = String.fromUtf8(File.readFrom("./data/end_ecdsa_private_key_win.pem"))

@Test
class Test_tlscertificate_05 {
    public override func beforeEach(): Unit {
        sum = 0
    }
    @TestCase
    func test_01(): Unit {
        //pem format to query.
        let pemData = String.fromUtf8(File.readFrom("./data/end_ecdsa.pem"))
        let pemFormat = Pem.decode(pemData)
        @Expect(pemFormat.isEmpty(), false)
        @Expect(pemFormat.size, 1)
        @Expect(pemFormat.toString(), "CERTIFICATE")
    }

    @TestCase
    func test_02(): Unit {
        //pem format use the blank.
        let pemData = "./data/end_ecdsa.pem"
        try {
            Pem.decode(pemData)
        } catch (e: Exception) {
            @Expect(e.message.contains("Failed to parse PEM"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_03(): Unit {
        //pem format decode and then encode.
        let pemFormat = Pem.decode(pemDatatest1)
        let pemFormat1 = pemFormat.encode()
        @Expect(pemFormat1, pemDatatest1)
        @Expect(pemFormat.isEmpty(), false)
        @Expect(pemFormat.size, 1)
        @Expect(pemFormat.toString(), "CERTIFICATE")
    }

    @TestCase
    func test_04(): Unit {
        //pem format key.
        let pemFormat = Pem.decode(pemDatatest2)
        let pemFormat1 = pemFormat.encode()
        @Expect(pemFormat1, pemDatatest2)
        @Expect(pemFormat.isEmpty(), false)
        @Expect(pemFormat.size, 1)
        @Expect(pemFormat.toString(), "PRIVATE KEY")
    }

    @TestCase
    func test_05(): Unit {
        //text format to input.
        let pemData = String.fromUtf8(File.readFrom("./data/root_ecdsa_1.text"))
        try {
            Pem.decode(pemData)
        } catch (e: Exception) {
            @Expect(e.message.contains("Failed to parse PEM"))
            sum += 1
        }
        @Expect(sum, 1)
    }
}
