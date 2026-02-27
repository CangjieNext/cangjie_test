/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %output  %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.crypto.keys.*
import stdx.crypto.digest.*
import std.convert.*
import std.crypto.digest.*
import std.math.numeric.*
import std.math.*

@Test
class Test_key_ecdsa_curve_009 {
    @TestCase
    func test_key_ecdsa_curve_01(): Unit {
        var ecPri = ECDSAPrivateKey(BP256)
        var ecPub = ECDSAPublicKey(ecPri)

        var str: String = "helloworld"
        var sha512Instance = SHA512()
        var md: Array<Byte> = digest(sha512Instance, str)

        var sig = ecPri.sign(md)
        @Expect(ecPub.verify(md, sig), true)
    }

    @TestCase
    func test_key_ecdsa_curve_02(): Unit {
        var ecPri = ECDSAPrivateKey(BP320)
        var ecPub = ECDSAPublicKey(ecPri)

        var str: String = "helloworld"
        var sha512Instance = SHA512()
        var md: Array<Byte> = digest(sha512Instance, str)

        var sig = ecPri.sign(md)
        @Expect(ecPub.verify(md, sig), true)
    }

    @TestCase
    func test_key_ecdsa_curve_03(): Unit {
        var ecPri = ECDSAPrivateKey(BP384)
        var ecPub = ECDSAPublicKey(ecPri)

        var str: String = "helloworld"
        var sha512Instance = SHA512()
        var md: Array<Byte> = digest(sha512Instance, str)

        var sig = ecPri.sign(md)
        @Expect(ecPub.verify(md, sig), true)
    }

    @TestCase
    func test_key_ecdsa_curve_04(): Unit {
        var ecPri = ECDSAPrivateKey(BP512)
        var ecPub = ECDSAPublicKey(ecPri)

        var str: String = "helloworld"
        var sha512Instance = SHA512()
        var md: Array<Byte> = digest(sha512Instance, str)

        var sig = ecPri.sign(md)
        @Expect(ecPub.verify(md, sig), true)
    }
}
