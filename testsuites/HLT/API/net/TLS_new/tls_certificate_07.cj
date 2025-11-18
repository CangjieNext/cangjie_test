/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %n.%suffix %run_utest_opt %run_args

import std.net.*
import std.fs.*
import stdx.net.tls.*
import stdx.crypto.x509.{X509Certificate,PrivateKey}
import stdx.crypto.keys.*
import std.sync.*
import std.runtime.*
import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

var sum = 0

@Test
class Test_tlscertificate_07 {
    public override func beforeEach(): Unit {
        sum = 0
    }
    @TestCase
    func test_01(): Unit {
        //pem format of privatekey.
        let pemData = String.fromUtf8(File.readFrom("./data/end_rsa_private_key.pem"))
        let pemPriKey = PrivateKey.decodeFromPem(pemData)
        @Expect(pemPriKey.toString(), "PrivateKey(1794 bytes, RSA 3072 bits)")
    }

    @TestCase
    func test_02(): Unit {
        //pem format of certificate using PrivateKey to decode.
        let pemData = String.fromUtf8(File.readFrom("./data/root_ecdsa.pem"))
        try {
            PrivateKey.decodeFromPem(pemData)
        } catch (e: Exception) {
            @Expect(e.message.contains("No supported private key entry found in PEM"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_03(): Unit {
        //pem format of privatekey file using PublicKey to decode.
        let pemData = String.fromUtf8(File.readFrom("./data/root_rsa_public_key.pem"))
        try {
            PrivateKey.decodeFromPem(pemData)
        } catch (e: Exception) {
            @Expect(e.message.contains("No supported private key entry found in PEM"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_04(): Unit {
        //pem format of text file using PrivateKey to decode.
        let pemData = String.fromUtf8(File.readFrom("./data/root_ecdsa_1.text"))
        try {
            PrivateKey.decodeFromPem(pemData)
        } catch (e: Exception) {
            @Expect(e.message.contains("Failed to parse PEM"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_05(): Unit {
        //pem format of privatekey and encodetoder then decodeder.
        let pemData = String.fromUtf8(File.readFrom("./data/end_rsa_private_key.pem"))
        let pemPriKey = PrivateKey.decodeFromPem(pemData)
        @Expect(pemPriKey.toString(), "PrivateKey(1794 bytes, RSA 3072 bits)")
        let derData = pemPriKey.encodeToDer()
        @Expect(derData.size, 1794)
        @Expect(derData.hashCode(),794757560254597261)
        let derPriKey = PrivateKey.decodeDer(derData)
        let derData1 = derPriKey.encodeToDer()
        @Expect(derPriKey.toString(), "PrivateKey(1794 bytes, RSA 3072 bits)")
        @Expect(derData.size, derData1.size)
        @Expect(derData.hashCode(), derData1.hashCode())
    }
}
