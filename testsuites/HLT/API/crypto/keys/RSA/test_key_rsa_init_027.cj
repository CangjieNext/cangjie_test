/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %output  %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.crypto.keys.*
import stdx.crypto.digest.*
import stdx.crypto.common.*
import std.io.*
import std.crypto.digest.*
import std.math.numeric.*
import std.math.*

@Test
class Test_key_rsa_init_027 {
    @TestCase
    func test_key_rsa_init_01(): Unit {
        try {
            RSAPrivateKey(511, BigInt("5"))
            @Expect(false)
        } catch (e: CryptoException) {
            @Expect(e.message, "Key size too small, low security level.")
        }
    }

    @TestCase
    func test_key_rsa_init_02(): Unit {
        try {
            RSAPrivateKey(Int32.Min, BigInt("3"))
            @Expect(false)
        } catch (e: CryptoException) {
            @Expect(e.message, "Key size too small, low security level.")
        }
    }

    @TestCase
    func test_key_rsa_init_03(): Unit {
        try {
            RSAPrivateKey(16385, BigInt("3"))
            @Expect(false)
        } catch (e: CryptoException) {
            @Expect(e.message, "Key size too long.")
        }
    }

    @TestCase
    func test_key_rsa_init_04(): Unit {
        try {
            RSAPrivateKey(512, BigInt("0"))
            @Expect(false)
        } catch (e: CryptoException) {
            @Expect(e.message, "Public exponent value is invalid because it is an even number.")
        }
    }

    @TestCase
    func test_key_rsa_init_05(): Unit {
        try {
            RSAPrivateKey(512, BigInt("1"))
            @Expect(false)
        } catch (e: CryptoException) {
            @Expect(e.message, "Public exponent value is too small.")
        }
    }

    @TestCase
    func test_key_rsa_init_06(): Unit {
        try {
            RSAPrivateKey(512, BigInt("2"))
            @Expect(false)
        } catch (e: CryptoException) {
            @Expect(e.message, "Public exponent value is invalid because it is an even number.")
        }
    }

    @TestCase
    func test_key_rsa_init_07(): Unit {
        try {
            RSAPrivateKey(512, BigInt("4"))
            @Expect(false)
        } catch (e: CryptoException) {
            @Expect(e.message, "Public exponent value is invalid because it is an even number.")
        }
    }
}
