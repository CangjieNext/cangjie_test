/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt  -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.crypto.keys.*
import stdx.crypto.common.*
import std.math.numeric.BigInt

@Test
class Test_rsa_generate_key {
    @TestCase
    func test_rsa_generate_key_01(): Unit {
        var sum = 0
        try {
            RSAPrivateKey(10)
        } catch (e: CryptoException) {
            sum += 1
            @Expect(e.message, "Key size is too small: '10' bits, minimum is '512' bits.")
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_rsa_generate_key_02(): Unit {
        var sum = 0
        try {
            RSAPrivateKey(16385)
        } catch (e: CryptoException) {
            sum += 1
            @Expect(e.message, "Key size is too large: '16385' bits, maximum is '16384' bits.")
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_rsa_generate_key_03(): Unit {
        var sum = 0
        try {
            RSAPrivateKey(2048, BigInt(6))
        } catch (e: CryptoException) {
            sum += 1
            @Expect(e.message, "Invalid public exponent '6': must be odd.")
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_rsa_generate_key_04(): Unit {
        var sum = 0
        try {
            RSAPrivateKey(2048, BigInt(1))
        } catch (e: CryptoException) {
            sum += 1
            @Expect(e.message, "Invalid public exponent '1': expected at least '3'.")
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_rsa_generate_key_05(): Unit {
        var sum = 0
        try {
            let exponentArray = Array<Byte>(33, repeat: 255)
            exponentArray[0] = 0
            let e = BigInt(exponentArray) + BigInt(2)
            RSAPrivateKey(2048, e)
        } catch (e: CryptoException) {
            sum += 1
            @Expect(e.message, "Invalid public exponent '115792089237316195423570985008687907853269984665640564039457584007913129639937': expected at most '115792089237316195423570985008687907853269984665640564039457584007913129639935'.")
        }
        @Expect(sum, 1)
    }
}
