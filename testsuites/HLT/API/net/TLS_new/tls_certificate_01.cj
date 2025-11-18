/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ./data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// (not Windows and not OHOS)RUN-EXEC: %run_stdx %n.%suffix %run_utest_opt %run_args
// (Windows and OHOS)RUN-EXEC: dos2unix "./data/root_ecdsa.pem" && dos2unix "./data/root_ecdsa.cer" && %run_stdx %n.%suffix %run_utest_opt %run_args
import std.net.*
import std.fs.*
import stdx.net.tls.*
import stdx.crypto.x509.{X509Certificate,DerBlob, PrivateKey}
import std.sync.*
import std.time.*
import std.runtime.*
import std.unittest.*
import std.unittest.testmacro.*

var sum = 0
@When[os != "Windows"]
let size_1: Int64 = 830
@When[os != "Windows"]
let hashcode_1: Int64 = 8033946155882567229
@When[os == "Windows"]
let size_1: Int64 = 844
@When[os == "Windows"]
let hashcode_1: Int64 = 8502360684707140801

@Test
class Test_tlscertificate_01 {
    public override func beforeEach(): Unit {
        sum = 0
    }
    @TestCase
    func test_01(): Unit {
        //der format to query.
        let derData = DerBlob(File.readFrom("./data/root_ecdsa.der"))
        @Expect(derData.size,571)
        @Expect(derData.hashCode(), -2258875716169435759)
    }
    @TestCase
    func test_02(): Unit {
        //der format to compare.
        let derData = DerBlob(File.readFrom("./data/root_ecdsa.der"))
        let derData1 = DerBlob(File.readFrom("./data/root_ecdsa.der"))
        let derData2 = DerBlob(File.readFrom("./data/end_ecdsa_private_key.der"))
        @Expect(derData == derData1)
        @Expect(derData != derData2)
        @Expect(derData1 != derData2)
    }

    @TestCase
    func test_03(): Unit {
        //pem format of pem.
        let derData = DerBlob(File.readFrom("./data/root_ecdsa.pem"))
        @Expect(derData.size, size_1)
        @Expect(derData.hashCode(), hashcode_1)
    }

    @TestCase
    func test_04(): Unit {
        //pem format to compare.
        let derData = DerBlob(File.readFrom("./data/root_ecdsa.pem"))
        let derData1 = DerBlob(File.readFrom("./data/root_ecdsa.pem"))
        let derData2 = DerBlob(File.readFrom("./data/root_ecdsa.der"))
        @Expect(derData == derData1)
        @Expect(derData != derData2)
        @Expect(derData1 != derData2)
    }

    @TestCase
    func test_05(): Unit {
        //pem format of cer.
        let derData = DerBlob(File.readFrom("./data/root_ecdsa.cer"))
        @Expect(derData.size, size_1)
        @Expect(derData.hashCode(), hashcode_1)
    }

    @TestCase
    func test_06(): Unit {
        //pem format of error parameter.
        try {
            DerBlob(File.readFrom(""))
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("empty"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_07(): Unit {
        //pem format of error parameter.
        try {
            DerBlob(File.readFrom("\0"))
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("null character"))
            sum += 1
        }
        @Expect(sum, 1)
    }
}
