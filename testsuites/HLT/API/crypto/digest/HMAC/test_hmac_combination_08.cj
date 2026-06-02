/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl  %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.crypto.digest.*
import std.collection.*
import stdx.encoding.hex.*

var sum = 0

@Test
class Test_hmac_combination_08 {
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_hmac_combination_01(): Unit {
        var algorithm: HashType = HashType.SHA512
        var key: Array<UInt8> = "123".toArray()
        var hmac = HMAC(key, algorithm)
        hmac.reset()
        hmac.write(key)
        var md: Array<Byte> = hmac.finish()
        @Expect(toHexString(md),"0634fd04380bbaf5069c8c46a74c7d21df7414888d980c27a16d5e262cb8c9059139c212d0926000faf026e483904cefae2f5e9d9bd5f51fbc2ac4c4de518115")
    }

    @TestCase
    func test_hmac_combination_02(): Unit {
        var algorithm: HashType = HashType.SHA512
        var key: Array<UInt8> = "123".toArray()
        var data: Array<Byte> = "zpstest".toArray()
        var hmac = HMAC(key, algorithm)
        hmac.reset()
        hmac.write(data)
        var md: Array<Byte> = hmac.finish()
        @Expect(toHexString(md),"dedfda55f0ef319751a7a616bd4a9bc35e699dad8adcb93646d8c5232c20c05ae3f52405034f6a1fd2d4fed6d770e701a989c15aa764dd161a7fa7b7789d966c")
    }

    @TestCase
    func test_hmac_combination_03(): Unit {
        var algorithm: HashType = HashType.SHA512
        var key: Array<UInt8> = "zpstest".toArray()
        var data: Array<Byte> = "zpstest".toArray()
        var hmac = HMAC(key, algorithm)
        hmac.reset()
        hmac.write(data)
        var md: Array<Byte> = hmac.finish()
        @Expect(toHexString(md),"6b4edca9c9c047514519b33d9adb277bc18f7576c831c08c2d7dee016ac17f0168ae2bbb95c8ef7a7a636927c0fe99c1d50c09e967340767fc01fd52674b6bfa")
    }

    @TestCase
    func test_hmac_combination_04(): Unit {
        var algorithm: HashType = HashType.SHA512
        var key: Array<UInt8> = "zpstest".toArray()
        var data: Array<UInt8> = "#$%^&".toArray()
        var hmac = HMAC(key, algorithm)
        hmac.reset()
        hmac.write(data)
        var md: Array<Byte> = hmac.finish()
        @Expect(toHexString(md),"68c14c8129c5580521a6ccfb8e88f6e1eb9c164ad5c06243a4cab99228d7e6b18db01e4900e707da5ee1fa10f29b10e7c8f14733ac791ca558eae9f5e567658d")
    }

    @TestCase
    func test_hmac_combination_05(): Unit {
        var algorithm: HashType = HashType.SHA512
        var key: Array<UInt8> = "123".toArray()
        var data: Array<UInt8> = "\0".toArray()
        var hmac = HMAC(key, algorithm)
        hmac.reset()
        hmac.write(data)
        var md: Array<Byte> = hmac.finish()
        @Expect(toHexString(md),"0627610897da770da07afd4fde19035da97dd09bb03742bdff4037efa45d3a701efc53207c7e2c3a5ecbcd065df5f43e6cf70adcdae1edc7bd939134c88aa3e0")
    }

    @TestCase
    func test_hmac_combination_06(): Unit {
        var algorithm: HashType = HashType.SHA512
        var key: Array<UInt8> = "123".toArray()
        var data: Array<UInt8> = "仓颉".toArray()
        var hmac = HMAC(key, algorithm)
        hmac.reset()
        hmac.write(data)
        var md: Array<Byte> = hmac.finish()
        @Expect(toHexString(md),"7fe05971cf60923123c5b148af039e26a72e00609373df405d60cd1336156e08c1fe7528654cb245d882e7537bfcb2bb7033ef53bebbb2d19b2e235c32cb2254")
    }

    @TestCase
    func test_hmac_combination_07(): Unit {
        var algorithm: HashType = HashType.SHA512
        var key: Array<UInt8> = "仓颉".toArray()
        var data: Array<UInt8> = [127, 0, 12, 36, 87, 98, 122, 13, 1, 2, 28, 93, 13, 10, 47, 59, 79, 99, 126, 100]
        var hmac = HMAC(key, algorithm)
        hmac.reset()
        hmac.write(data)
        var md: Array<Byte> = hmac.finish()
        @Expect(toHexString(md),"c645ac51eb8bd139fa74af7bf2f3007401a864eb6452fcb191be42277ffe48af91d190583ebd1a66ff8cc86d133499f8b916630f733834e84d5abef409c777af")
    }

    @TestCase
    func test_hmac_combination_08(): Unit {
        var algorithm: HashType = HashType.SHA512
        var key: Array<UInt8> = "仓颉".toArray()
        var data0: Array<UInt8> = [127, 0, 12, 36, 87, 98, 122, 13, 1, 2, 28, 93, 13, 10, 47, 59, 79, 99, 126, 100]
        var data1: Array<UInt8> = "zps123&^&".toArray()
        var data2: Array<UInt8> = "123456".toArray()
        var data3: Array<UInt8> = "abcdefg".toArray()
        var data4: Array<UInt8> = "ABCDEFG".toArray()
        var data5: Array<UInt8> = "#$%^&".toArray()
        var data6: Array<UInt8> = "ABCabc123".toArray()
        var data7: Array<UInt8> = "鸿蒙".toArray()
        var data8: Array<UInt8> = "zps@qq.com".toArray()
        var data9: Array<UInt8> = "仓颉test".toArray()
        var hmac = HMAC(key, algorithm)
        hmac.reset()
        hmac.write(data0)
        hmac.write(data1)
        hmac.write(data2)
        hmac.write(data3)
        hmac.write(data4)
        hmac.write(data5)
        hmac.write(data6)
        hmac.write(data7)
        hmac.write(data8)
        hmac.write(data9)
        var md: Array<Byte> = hmac.finish()
        @Expect(toHexString(md),"672bc7f635e0a2b14ff881f3d8e1ba576c6eda438992aa71321c670b37ee2ee0c5de957802404647a9717a6d32f1097256bbc14fd36733656289cd779203394f")
    }
}
