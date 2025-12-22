/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ./data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.net.*
import std.fs.*
import stdx.net.tls.*
import stdx.crypto.x509.*
import stdx.crypto.common.*
import stdx.crypto.keys.*
import std.sync.*
import std.runtime.*
import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

var sum = 0

@Test
class Test_tlscertificate_03 {
    public override func beforeEach(): Unit {
        sum = 0
    }
    @TestCase
    func test_01(): Unit {
        //der format of publickey.
        let derData = DerBlob(File.readFrom("./data/root_rsa_public_key.der"))
        @Expect(derData.size,422)
        @Expect(derData.hashCode(),-6179307143943801750)
        let derPubKey = GeneralPublicKey.decodeDer(derData)
        let derData1  = derPubKey.encodeToDer()
        @Expect(derPubKey.toString(), "PublicKey(422 bytes)")
        @Expect(derData.size, derData1.size)
        @Expect(derData.hashCode(), derData.hashCode())
    }

    @TestCase
    func test_02(): Unit {
        //der format of certificate.
        let derData = DerBlob(File.readFrom("./data/root_ecdsa.der"))
        @Expect(derData.size,571)
        @Expect(derData.hashCode(),-2258875716169435759)
        let e = @AssertThrows[CryptoException](GeneralPublicKey.decodeDer(derData))
        @Expect(e.message.contains("Failed to load public key, it's either corrupted, or the format is unsupported:"))
    }

    @TestCase
    func test_03(): Unit {
        //der format of privatekey use PublicKey to decode.
        let derData = DerBlob(File.readFrom("./data/end_rsa_private_key.der"))
        @Expect(derData.size,1768)
        @Expect(derData.hashCode(),5801112079858918936)
        let e = @AssertThrows[CryptoException](GeneralPublicKey.decodeDer(derData))
        @Expect(e.message.contains("Failed to load public key, it's either corrupted, or the format is unsupported:"))
    }
}
