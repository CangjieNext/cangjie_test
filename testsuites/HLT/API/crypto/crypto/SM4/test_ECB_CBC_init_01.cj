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

import stdx.crypto.crypto.*
import stdx.crypto.digest.*

@Test
class Test_ECB_CBC_init_01 {
    @TestCase
    func test_ECB_init_01(): Unit {
        let e = @AssertThrows[CryptoException](SM4(OperationMode.ECB,Array<Byte>(),paddingMode:PaddingMode.PKCS7Padding))
        @Expect(e.message, "Invalid key size.")
    }

    @TestCase
    func test_ECB_init_02(): Unit {
        let e = @AssertThrows[CryptoException](SM4(OperationMode.ECB,'123456789123456789'.toArray(),paddingMode:PaddingMode.PKCS7Padding))
        @Expect(e.message, "Invalid key size.")
    }

    @TestCase
    func test_ECB_init_03(): Unit {
        let e = @AssertThrows[CryptoException](SM4(OperationMode.ECB,'1234567891234567'.toArray(),paddingMode:PaddingMode.PKCS7Padding, tagSize: 100))
        @Expect(e.message, "Invalid tag size.")
    }

    @TestCase
    func test_ECB_init_04(): Unit {
        let e = @AssertThrows[CryptoException](SM4(OperationMode.ECB,'1234567891234567'.toArray(),paddingMode:PaddingMode.PKCS7Padding, tagSize: 17))
        @Expect(e.message, "Invalid tag size.")
    }

    @TestCase
    func test_ECB_init_05(): Unit {
        let sm4_ecb = SM4(OperationMode.ECB, '1234567891234567'.toArray(), paddingMode: PaddingMode.PKCS7Padding)
        @Expect(sm4_ecb.aad, Array<Byte>())
        @Expect(sm4_ecb.blockSize, 16)
        @Expect(sm4_ecb.keySize, 16)
        @Expect(sm4_ecb.key, '1234567891234567'.toArray())
        @Expect(sm4_ecb.iv, Array<Byte>())
        @Expect(sm4_ecb.ivSize, 0)
        @Expect(sm4_ecb.tagSize, 16)
        @Expect(sm4_ecb.optMode, OperationMode.ECB)
        @Expect(sm4_ecb.paddingMode, PaddingMode.PKCS7Padding)
    }

    @TestCase
    func test_ECB_init_06(): Unit {
        let sm4_ecb = SM4(OperationMode.ECB, '1234567891234567'.toArray(), paddingMode: PaddingMode.NoPadding)
        @Expect(sm4_ecb.aad, Array<Byte>())
        @Expect(sm4_ecb.blockSize, 16)
        @Expect(sm4_ecb.keySize, 16)
        @Expect(sm4_ecb.key, '1234567891234567'.toArray())
        @Expect(sm4_ecb.iv, Array<Byte>())
        @Expect(sm4_ecb.ivSize, 0)
        @Expect(sm4_ecb.tagSize, 16)
        @Expect(sm4_ecb.optMode, OperationMode.ECB)
        @Expect(sm4_ecb.paddingMode, PaddingMode.NoPadding)
    }

    @TestCase
    func test_ECB_init_07(): Unit {
        let sm4_ecb = SM4(OperationMode.ECB, '1234567891234567'.toArray(), paddingMode: PaddingMode.NoPadding,
            tagSize: 12)
        @Expect(sm4_ecb.aad, Array<Byte>())
        @Expect(sm4_ecb.blockSize, 16)
        @Expect(sm4_ecb.keySize, 16)
        @Expect(sm4_ecb.key, '1234567891234567'.toArray())
        @Expect(sm4_ecb.iv, Array<Byte>())
        @Expect(sm4_ecb.ivSize, 0)
        @Expect(sm4_ecb.tagSize, 12)
        @Expect(sm4_ecb.optMode, OperationMode.ECB)
        @Expect(sm4_ecb.paddingMode, PaddingMode.NoPadding)
    }

    @TestCase
    func test_CBC_init_08(): Unit {
        let e = @AssertThrows[CryptoException](SM4(OperationMode.CBC,Array<Byte>(),paddingMode:PaddingMode.PKCS7Padding))
        @Expect(e.message, "Invalid key size.")
    }

    @TestCase
    func test_CBC_init_09(): Unit {
        let e = @AssertThrows[CryptoException](SM4(OperationMode.CBC,'123456789123456789'.toArray(),paddingMode:PaddingMode.PKCS7Padding))
        @Expect(e.message, "Invalid key size.")
    }

    @TestCase
    func test_CBC_init_10(): Unit {
        let e = @AssertThrows[CryptoException](SM4(OperationMode.CBC,'1234567891234567'.toArray(),iv:'1234567891234567'.toArray(),paddingMode:PaddingMode.PKCS7Padding, tagSize: 100))
        @Expect(e.message, "Invalid tag size.")
    }

    @TestCase
    func test_CBC_init_11(): Unit {
        let e = @AssertThrows[CryptoException](SM4(OperationMode.CBC,'1234567891234567'.toArray(),iv:'1234567891234567'.toArray(),paddingMode:PaddingMode.PKCS7Padding, tagSize: 17))
        @Expect(e.message, "Invalid tag size.")
    }

    @TestCase
    func test_CBC_init_12(): Unit {
        let e = @AssertThrows[CryptoException](SM4(OperationMode.CBC,'1234567891234567'.toArray(),iv:'123456789123456'.toArray(),paddingMode:PaddingMode.PKCS7Padding, tagSize: 100))
        @Expect(e.message, "Invalid iv size.")
    }

    @TestCase
    func test_CBC_init_13(): Unit {
        let e = @AssertThrows[CryptoException](SM4(OperationMode.CBC,'1234567891234567'.toArray(),iv:''.toArray(),paddingMode:PaddingMode.PKCS7Padding, tagSize: 17))
        @Expect(e.message, "Invalid iv size.")
    }

    @TestCase
    func test_CBC_init_14(): Unit {
        let sm4_cbc = SM4(OperationMode.CBC, '1234567891234567'.toArray(), iv: '1234567891234567'.toArray(),
            paddingMode: PaddingMode.PKCS7Padding)
        @Expect(sm4_cbc.aad, Array<Byte>())
        @Expect(sm4_cbc.blockSize, 16)
        @Expect(sm4_cbc.keySize, 16)
        @Expect(sm4_cbc.key, '1234567891234567'.toArray())
        @Expect(sm4_cbc.iv, '1234567891234567'.toArray())
        @Expect(sm4_cbc.ivSize, 16)
        @Expect(sm4_cbc.tagSize, 16)
        @Expect(sm4_cbc.optMode, OperationMode.CBC)
        @Expect(sm4_cbc.paddingMode, PaddingMode.PKCS7Padding)
    }

    @TestCase
    func test_CBC_init_15(): Unit {
        let sm4_cbc = SM4(OperationMode.CBC, '1234567891234567'.toArray(), iv: '1234567891234567'.toArray(),
            paddingMode: PaddingMode.NoPadding)
        @Expect(sm4_cbc.aad, Array<Byte>())
        @Expect(sm4_cbc.blockSize, 16)
        @Expect(sm4_cbc.keySize, 16)
        @Expect(sm4_cbc.key, '1234567891234567'.toArray())
        @Expect(sm4_cbc.iv, '1234567891234567'.toArray())
        @Expect(sm4_cbc.ivSize, 16)
        @Expect(sm4_cbc.tagSize, 16)
        @Expect(sm4_cbc.optMode, OperationMode.CBC)
        @Expect(sm4_cbc.paddingMode, PaddingMode.NoPadding)
    }

    @TestCase
    func test_CBC_init_16(): Unit {
        let sm4_cbc = SM4(OperationMode.CBC, '1234567891234567'.toArray(), iv: '1234567891234567'.toArray(),
            paddingMode: PaddingMode.NoPadding, tagSize: 12)
        @Expect(sm4_cbc.aad, Array<Byte>())
        @Expect(sm4_cbc.blockSize, 16)
        @Expect(sm4_cbc.keySize, 16)
        @Expect(sm4_cbc.key, '1234567891234567'.toArray())
        @Expect(sm4_cbc.iv, '1234567891234567'.toArray())
        @Expect(sm4_cbc.ivSize, 16)
        @Expect(sm4_cbc.tagSize, 12)
        @Expect(sm4_cbc.optMode, OperationMode.CBC)
        @Expect(sm4_cbc.paddingMode, PaddingMode.NoPadding)
    }
}
