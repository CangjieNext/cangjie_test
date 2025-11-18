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
// RUN-EXEC: %run_stdx %n.%suffix %run_utest_opt %run_args

import std.net.*
import std.fs.*
import stdx.net.tls.*
import stdx.crypto.x509.{X509Certificate,DerBlob, PrivateKey}
import std.sync.*
import std.argopt.*
import std.runtime.*
import std.unittest.*
import std.unittest.testmacro.*

var sum = 0

@Test
class Test_tlscertificate_02 {
    public override func beforeEach(): Unit {
        sum = 0
    }
    @TestCase
    func test_01(): Unit {
        //der format to query.
        let derData = DerBlob(File.readFrom("./data/root_ecdsa.der"))
        @Expect(derData.size,571)
        @Expect(derData.hashCode(),-2258875716169435759)
        let derCert = X509Certificate.decodeFromDer(derData)
        @Expect(derCert.hashCode(),-2258875716169435759)
    }

    @TestCase
    func test_02(): Unit {
        //der format to decode and encode.
        let derData = DerBlob(File.readFrom("./data/root_ecdsa.der"))
        @Expect(derData.size,571)
        @Expect(derData.hashCode(),-2258875716169435759)
        let derCert = X509Certificate.decodeFromDer(derData)
        let derData1 = derCert.encodeToDer()
        @Expect(derData1.size, derData.size)
        @Expect(derData1.body, derData.body)
        @Expect(derData1.hashCode(), derData.hashCode())
    }

    @TestCase
    func test_03(): Unit {
        //der format to decode and encode and then decode.
        let derData = DerBlob(File.readFrom("./data/root_ecdsa.der"))
        @Expect(derData.size,571)
        @Expect(derData.hashCode(),-2258875716169435759)
        let derCert = X509Certificate.decodeFromDer(derData)
        let derData1 = derCert.encodeToDer()
        let derCert1 = X509Certificate.decodeFromDer(derData1)
        @Expect(derCert.hashCode(), derCert1.hashCode())
    }

    @TestCase
    func test_04(): Unit {
        //verify the certificate is equal
        let derData = DerBlob(File.readFrom("./data/root_ecdsa.der"))
        @Expect(derData.size,571)
        @Expect(derData.hashCode(),-2258875716169435759)
        let derCert = X509Certificate.decodeFromDer(derData)
        let derData1 = derCert.encodeToDer()
        let derCert1 = X509Certificate.decodeFromDer(derData1)
        @Expect(derCert == derCert1)
    }

    @TestCase
    func test_05(): Unit {
        //verify the certificate is equal
        let derData = DerBlob(File.readFrom("./data/root_ecdsa.der"))
        let derCert = X509Certificate.decodeFromDer(derData)
        let pemData = String.fromUtf8(File.readFrom("./data/root_ecdsa.pem"))
        let pemCert = X509Certificate.decodeFromPem(pemData)[0]
        @Expect(derCert == pemCert)
    }

    @TestCase
    func test_06(): Unit {
        //verify the certificate is not equal
        let derData = DerBlob(File.readFrom("./data/root_ecdsa.der"))
        let derCert = X509Certificate.decodeFromDer(derData)
        let pemData = String.fromUtf8(File.readFrom("./data/end_ecdsa.pem"))
        let pemCert = X509Certificate.decodeFromPem(pemData)[0]
        @Expect(derCert != pemCert)
    }

    @TestCase
    func test_07(): Unit {
        //error format to generate certificate.
        let derData = DerBlob(File.readFrom("./data/root_ecdsa.pem"))
        try {
            X509Certificate.decodeFromDer(derData)
        } catch (e: Exception) {
            @Expect(e.message.contains("The field is not a sequence"))
            sum += 1
        }
        @Expect(sum, 1)
    }
}
