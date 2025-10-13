/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %cmp_utest_opt  %f -o %output
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.crypto.keys.*
import stdx.crypto.common.*
import std.crypto.digest.*
import std.random.*
import stdx.crypto.x509.*
import stdx.crypto.digest.CryptoException
import stdx.crypto.digest.*

@Test
public class Test_SM2PrivateKey_Illegal {
    @TestCase
    func test_decrypt() {
        SM2PrivateKey().decrypt(Array<Byte>())
        @ExpectThrows[CryptoException](SM2PrivateKey().decrypt([1u8, 2u8, 3u8]))
    }

    @TestCase
    func test_encodeToDer_Pem() {
        @ExpectThrows[CryptoException](SM2PrivateKey().encodeToDer(password: ""))
        @ExpectThrows[CryptoException](SM2PrivateKey().encodeToPem(password: ""))
    }

    @TestCase
    func test_decodeDer() {
        let blob0 = SM2PrivateKey().encodeToDer(password: "12345")
        @ExpectThrows[CryptoException](SM2PrivateKey.decodeDer(blob0, password: "1234512345"))
        @ExpectThrows[CryptoException](SM2PrivateKey.decodeDer(blob0, password: ""))
        println(SM2PrivateKey.decodeDer(blob0, password: "12345").toString())
    }

    @TestCase
    func test_decodePem() {
        let blob0 = SM2PrivateKey().encodeToPem(password: "12345").encode()
        @ExpectThrows[CryptoException](SM2PrivateKey.decodeFromPem(blob0, password: "1234512345"))
        @ExpectThrows[CryptoException](SM2PrivateKey.decodeFromPem(blob0, password: ""))
        println(SM2PrivateKey.decodeFromPem(blob0, password: "12345").toString())
    }
}

@Test
public class Test_SM2PublicKey_Illegal {
    @TestCase[str in [ "123", "abc", "ABC", "1234512345XyzAbc1234512345XyzAbc" ] 
]
    func test_init(str: String) {
        let pri0 = SM2PrivateKey()
        let pri1 = SM2PrivateKey.decodeDer(pri0.encodeToDer(password: str), password: str)
        let pub0 = SM2PublicKey(pri0)
        let pub1 = SM2PublicKey(pri1)
    }

    func RandomData(): Array<Byte> {
        var rand = Random()
        var arr = Array<UInt8>(100, repeat: 0)
        for (i in 0..100) {
            arr[i] = rand.nextUInt8(94) + UInt8(32)
        }
        return arr
    }

    @TestCase
    func test_verify() {
        let arr = RandomData()
        println("test_verify: ${arr}")
        let pri0 = SM2PrivateKey()
        let pub0 = SM2PublicKey(pri0)
        @Expect(pub0.verify(arr, pri0.sign(arr)))
    }

    @TestCase
    func test_encrypt() {
        SM2PublicKey(SM2PrivateKey()).encrypt(Array<Byte>())
        let arr = RandomData()
        println("test_encrypt: ${arr}")
        let pri0 = SM2PrivateKey()
        let pub0 = SM2PublicKey(pri0)
        @Expect(pub0.encrypt(arr) != arr)
        @Expect(pri0.decrypt(pub0.encrypt(arr)), arr)
    }
}
