/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %output  %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.crypto.keys.*
import stdx.crypto.digest.*
import stdx.crypto.common.*
import std.io.*
import std.crypto.digest.*

@Test
class Test_rsa_keys_015 {
    @TestCase
    func test_rsa_keys_01(): Unit {
        var rsaPri = RSAPrivateKey(1024)
        var rsaPub = RSAPublicKey(rsaPri)

        var rsaPriPem = rsaPri.encodeToPem(password: Option.Some("cangjie#123"))
        let e = @AssertThrows[CryptoException](RSAPrivateKey.decodeFromPem(rsaPriPem.encode(), password: Option.Some("cangjie#1233")))
        @Expect(e.message.contains("Failed to load private key"))
    }
}
