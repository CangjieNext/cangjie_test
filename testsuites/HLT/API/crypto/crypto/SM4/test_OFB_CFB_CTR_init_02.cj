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

import stdx.crypto.crypto.*
import stdx.crypto.digest.*
import stdx.crypto.common.*

var sum = 0

@Test
class Test_OFB_CFB_CTR_init_02 {
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_init_01(): Unit {
        let e = @AssertThrows[CryptoException](SM4(OperationMode.OFB,Array<Byte>(),paddingMode:PaddingMode.PKCS7Padding))
        let e1 = @AssertThrows[CryptoException](SM4(OperationMode.CFB,Array<Byte>(),paddingMode:PaddingMode.PKCS7Padding))
        let e2 = @AssertThrows[CryptoException](SM4(OperationMode.CTR,Array<Byte>(),paddingMode:PaddingMode.PKCS7Padding))
        @Expect(e.message, "Invalid key size.")
        @Expect(e1.message, "Invalid key size.")
        @Expect(e2.message, "Invalid key size.")
    }

    @TestCase
    func test_init_02(): Unit {
        let e = @AssertThrows[CryptoException](SM4(OperationMode.OFB,'123456789123456789'.toArray(),paddingMode:PaddingMode.PKCS7Padding))
        let e1 = @AssertThrows[CryptoException](SM4(OperationMode.CFB,'123456789123456789'.toArray(),paddingMode:PaddingMode.PKCS7Padding))
        let e2 = @AssertThrows[CryptoException](SM4(OperationMode.CTR,'123456789123456789'.toArray(),paddingMode:PaddingMode.PKCS7Padding))
        @Expect(e.message, "Invalid key size.")
        @Expect(e1.message, "Invalid key size.")
        @Expect(e2.message, "Invalid key size.")
    }

    @TestCase
    func test_init_03(): Unit {
        let e = @AssertThrows[CryptoException](SM4(OperationMode.OFB,'1234567891234567'.toArray(),iv:'1234567891234567'.toArray(),paddingMode:PaddingMode.PKCS7Padding, tagSize: 100))
        let e1 = @AssertThrows[CryptoException](SM4(OperationMode.CFB,'1234567891234567'.toArray(),iv:'1234567891234567'.toArray(),paddingMode:PaddingMode.PKCS7Padding, tagSize: 100))
        let e2 = @AssertThrows[CryptoException](SM4(OperationMode.CTR,'1234567891234567'.toArray(),iv:'1234567891234567'.toArray(),paddingMode:PaddingMode.PKCS7Padding, tagSize: 100))
        @Expect(e.message, "Invalid tag size.")
        @Expect(e1.message, "Invalid tag size.")
        @Expect(e2.message, "Invalid tag size.")
    }

    @TestCase
    func test_init_04(): Unit {
        let e = @AssertThrows[CryptoException](SM4(OperationMode.OFB,'1234567891234567'.toArray(),iv:'1234567891234567'.toArray(),paddingMode:PaddingMode.PKCS7Padding, tagSize: 17))
        let e1 = @AssertThrows[CryptoException](SM4(OperationMode.CFB,'1234567891234567'.toArray(),iv:'1234567891234567'.toArray(),paddingMode:PaddingMode.PKCS7Padding, tagSize: 17))
        let e2 = @AssertThrows[CryptoException](SM4(OperationMode.CTR,'1234567891234567'.toArray(),iv:'1234567891234567'.toArray(),paddingMode:PaddingMode.PKCS7Padding, tagSize: 17))
        @Expect(e.message, "Invalid tag size.")
        @Expect(e1.message, "Invalid tag size.")
        @Expect(e2.message, "Invalid tag size.")
    }

    @TestCase
    func test_init_05(): Unit {
        let e = @AssertThrows[CryptoException](SM4(OperationMode.OFB,'1234567891234567'.toArray(),iv:'123456789123456'.toArray(),paddingMode:PaddingMode.PKCS7Padding, tagSize: 100))
        let e1 = @AssertThrows[CryptoException](SM4(OperationMode.CFB,'1234567891234567'.toArray(),iv:'123456789123456'.toArray(),paddingMode:PaddingMode.PKCS7Padding, tagSize: 100))
        let e2 = @AssertThrows[CryptoException](SM4(OperationMode.CTR,'1234567891234567'.toArray(),iv:'123456789123456'.toArray(),paddingMode:PaddingMode.PKCS7Padding, tagSize: 100))
        @Expect(e.message, "Invalid iv size.")
        @Expect(e1.message, "Invalid iv size.")
        @Expect(e2.message, "Invalid iv size.")
    }

    @TestCase
    func test_init_06(): Unit {
        let e = @AssertThrows[CryptoException](SM4(OperationMode.OFB,'1234567891234567'.toArray(),iv:''.toArray(),paddingMode:PaddingMode.PKCS7Padding, tagSize: 17))
        let e1 = @AssertThrows[CryptoException](SM4(OperationMode.CFB,'1234567891234567'.toArray(),iv:''.toArray(),paddingMode:PaddingMode.PKCS7Padding, tagSize: 17))
        let e2 = @AssertThrows[CryptoException](SM4(OperationMode.CTR,'1234567891234567'.toArray(),iv:''.toArray(),paddingMode:PaddingMode.PKCS7Padding, tagSize: 17))
        @Expect(e.message, "Invalid iv size.")
        @Expect(e1.message, "Invalid iv size.")
        @Expect(e2.message, "Invalid iv size.")
    }

    @TestCase
    func test_init_07(): Unit {
        let sm4_ofb = SM4(OperationMode.OFB, '1234567891234567'.toArray(), iv: '1234567891234567'.toArray(),
            paddingMode: PaddingMode.PKCS7Padding)
        let sm4_cfb = SM4(OperationMode.CFB, '1234567891234567'.toArray(), iv: '1234567891234567'.toArray(),
            paddingMode: PaddingMode.PKCS7Padding)
        let sm4_ctr = SM4(OperationMode.CTR, '1234567891234567'.toArray(), iv: '1234567891234567'.toArray(),
            paddingMode: PaddingMode.PKCS7Padding)
        @Expect(sm4_ofb.aad, Array<Byte>())
        @Expect(sm4_ofb.blockSize, 16)
        @Expect(sm4_ofb.keySize, 16)
        @Expect(sm4_ofb.key, '1234567891234567'.toArray())
        @Expect(sm4_ofb.iv, '1234567891234567'.toArray())
        @Expect(sm4_ofb.ivSize, 16)
        @Expect(sm4_ofb.tagSize, 16)
        @Expect(sm4_ofb.optMode, OperationMode.OFB)
        @Expect(sm4_ofb.paddingMode, PaddingMode.PKCS7Padding)

        @Expect(sm4_cfb.aad, Array<Byte>())
        @Expect(sm4_cfb.blockSize, 16)
        @Expect(sm4_cfb.keySize, 16)
        @Expect(sm4_cfb.key, '1234567891234567'.toArray())
        @Expect(sm4_cfb.iv, '1234567891234567'.toArray())
        @Expect(sm4_cfb.ivSize, 16)
        @Expect(sm4_cfb.tagSize, 16)
        @Expect(sm4_cfb.optMode, OperationMode.CFB)
        @Expect(sm4_cfb.paddingMode, PaddingMode.PKCS7Padding)

        @Expect(sm4_ctr.aad, Array<Byte>())
        @Expect(sm4_ctr.blockSize, 16)
        @Expect(sm4_ctr.keySize, 16)
        @Expect(sm4_ctr.key, '1234567891234567'.toArray())
        @Expect(sm4_ctr.iv, '1234567891234567'.toArray())
        @Expect(sm4_ctr.ivSize, 16)
        @Expect(sm4_ctr.tagSize, 16)
        @Expect(sm4_ctr.optMode, OperationMode.CTR)
        @Expect(sm4_ctr.paddingMode, PaddingMode.PKCS7Padding)
    }

    @TestCase
    func test_init_08(): Unit {
        let sm4_ofb = SM4(OperationMode.OFB, '1234567891234567'.toArray(), iv: '1234567891234567'.toArray(),
            paddingMode: PaddingMode.NoPadding)
        let sm4_cfb = SM4(OperationMode.CFB, '1234567891234567'.toArray(), iv: '1234567891234567'.toArray(),
            paddingMode: PaddingMode.NoPadding)
        let sm4_ctr = SM4(OperationMode.CTR, '1234567891234567'.toArray(), iv: '1234567891234567'.toArray(),
            paddingMode: PaddingMode.NoPadding)
        @Expect(sm4_ofb.aad, Array<Byte>())
        @Expect(sm4_ofb.blockSize, 16)
        @Expect(sm4_ofb.keySize, 16)
        @Expect(sm4_ofb.key, '1234567891234567'.toArray())
        @Expect(sm4_ofb.iv, '1234567891234567'.toArray())
        @Expect(sm4_ofb.ivSize, 16)
        @Expect(sm4_ofb.tagSize, 16)
        @Expect(sm4_ofb.optMode, OperationMode.OFB)
        @Expect(sm4_ofb.paddingMode, PaddingMode.NoPadding)

        @Expect(sm4_cfb.aad, Array<Byte>())
        @Expect(sm4_cfb.blockSize, 16)
        @Expect(sm4_cfb.keySize, 16)
        @Expect(sm4_cfb.key, '1234567891234567'.toArray())
        @Expect(sm4_cfb.iv, '1234567891234567'.toArray())
        @Expect(sm4_cfb.ivSize, 16)
        @Expect(sm4_cfb.tagSize, 16)
        @Expect(sm4_cfb.optMode, OperationMode.CFB)
        @Expect(sm4_cfb.paddingMode, PaddingMode.NoPadding)

        @Expect(sm4_ctr.aad, Array<Byte>())
        @Expect(sm4_ctr.blockSize, 16)
        @Expect(sm4_ctr.keySize, 16)
        @Expect(sm4_ctr.key, '1234567891234567'.toArray())
        @Expect(sm4_ctr.iv, '1234567891234567'.toArray())
        @Expect(sm4_ctr.ivSize, 16)
        @Expect(sm4_ctr.tagSize, 16)
        @Expect(sm4_ctr.optMode, OperationMode.CTR)
        @Expect(sm4_ctr.paddingMode, PaddingMode.NoPadding)
    }

    @TestCase
    func test_init_09(): Unit {
        let sm4_ofb = SM4(OperationMode.OFB, '1234567891234567'.toArray(), iv: '1234567891234567'.toArray(),
            paddingMode: PaddingMode.NoPadding, tagSize: 12)
        let sm4_cfb = SM4(OperationMode.CFB, '1234567891234567'.toArray(), iv: '1234567891234567'.toArray(),
            paddingMode: PaddingMode.NoPadding, tagSize: 12)
        let sm4_ctr = SM4(OperationMode.CTR, '1234567891234567'.toArray(), iv: '1234567891234567'.toArray(),
            paddingMode: PaddingMode.NoPadding, tagSize: 12)
        @Expect(sm4_ofb.aad, Array<Byte>())
        @Expect(sm4_ofb.blockSize, 16)
        @Expect(sm4_ofb.keySize, 16)
        @Expect(sm4_ofb.key, '1234567891234567'.toArray())
        @Expect(sm4_ofb.iv, '1234567891234567'.toArray())
        @Expect(sm4_ofb.ivSize, 16)
        @Expect(sm4_ofb.tagSize, 12)
        @Expect(sm4_ofb.optMode, OperationMode.OFB)
        @Expect(sm4_ofb.paddingMode, PaddingMode.NoPadding)

        @Expect(sm4_cfb.aad, Array<Byte>())
        @Expect(sm4_cfb.blockSize, 16)
        @Expect(sm4_cfb.keySize, 16)
        @Expect(sm4_cfb.key, '1234567891234567'.toArray())
        @Expect(sm4_cfb.iv, '1234567891234567'.toArray())
        @Expect(sm4_cfb.ivSize, 16)
        @Expect(sm4_cfb.tagSize, 12)
        @Expect(sm4_cfb.optMode, OperationMode.CFB)
        @Expect(sm4_cfb.paddingMode, PaddingMode.NoPadding)

        @Expect(sm4_ctr.aad, Array<Byte>())
        @Expect(sm4_ctr.blockSize, 16)
        @Expect(sm4_ctr.keySize, 16)
        @Expect(sm4_ctr.key, '1234567891234567'.toArray())
        @Expect(sm4_ctr.iv, '1234567891234567'.toArray())
        @Expect(sm4_ctr.ivSize, 16)
        @Expect(sm4_ctr.tagSize, 12)
        @Expect(sm4_ctr.optMode, OperationMode.CTR)
        @Expect(sm4_ctr.paddingMode, PaddingMode.NoPadding)
    }
}
