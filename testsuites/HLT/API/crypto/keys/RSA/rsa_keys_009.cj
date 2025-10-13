/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt  %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 

import stdx.crypto.keys.*
import stdx.crypto.digest.*
import stdx.crypto.common.*
import std.io.*
import std.crypto.digest.*

@Test
class Test_rsa_keys_009 {
    @TestCase
    func test_rsa_keys_01(): Unit {
        var rsaPri = RSAPrivateKey(1024)
        var rsaPub = RSAPublicKey(rsaPri)

        var str: String = "hello world, hello cangjie"
        var bas1 = ByteBuffer()
        var bas2 = ByteBuffer()
        var bas3 = ByteBuffer()
        bas1.write(str.toArray())

        var encOpt = OAEPOption(SHA384(), SHA512(), label: "cangjieworld")
        rsaPub.encrypt(bas1, bas2, padType: OAEP(encOpt))
        var decOpt = OAEPOption(SHA512(), SHA512(), label: "cangjieworld")
        let e = @AssertThrows[CryptoException](rsaPri.decrypt(bas2, bas3, padType: OAEP(decOpt)))
        @Expect(e.message, "Decrypt error.")
        var buf = Array<Byte>(str.size, repeat: 0)
        bas3.read(buf)
        @Expect(str.toArray() != buf)
    }
}
