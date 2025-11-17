/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt  %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.crypto.keys.*
import stdx.crypto.digest.*
import std.io.*
import std.crypto.digest.*

@Test
class Test_rsa_keys_004 {
    @TestCase
    func test_rsa_keys_01(): Unit {
        var rsaPri = RSAPrivateKey(2048)
        var rsaPub = RSAPublicKey(rsaPri)

        var str: String = "cangjie-helloworld"
        var sha224Instance = SHA224()
        var sha256Instance = SHA256()
        var sh: Array<Byte> = digest(sha224Instance, str)
        let e = @AssertThrows[CryptoException](rsaPri.sign(sha256Instance, sh, padType: PKCS1))
        @Expect(e.message, "Sign error.")
    }
}
