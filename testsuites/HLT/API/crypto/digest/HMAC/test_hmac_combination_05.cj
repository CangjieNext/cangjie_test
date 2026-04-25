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
class Test_hmac_combination_05 {
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_hmac_combination_01(): Unit {
        var algorithm: HashType = HashType.SHA512
        var key: Array<UInt8> = "123".toArray()
        var hmac = HMAC(key, algorithm)
        hmac.write(key)
        hmac.reset()
        var md: Array<Byte> = hmac.finish()
        @Expect(toHexString(md),"79a898c707f0d60e2dc22f96854c1999540f4cdfce6463f74016aa18a3d1003628d47c4e745536afabbdb90d086fad14dadf8b4927cdf55d48b4078a1e9e4525")
    }

    @TestCase
    func test_hmac_combination_02(): Unit {
        var algorithm: HashType = HashType.SHA512
        var key: Array<UInt8> = "123".toArray()
        var data: Array<Byte> = "zpstest".toArray()
        var hmac = HMAC(key, algorithm)
        hmac.write(data)
        hmac.reset()
        var md: Array<Byte> = hmac.finish()
        @Expect(toHexString(md),"79a898c707f0d60e2dc22f96854c1999540f4cdfce6463f74016aa18a3d1003628d47c4e745536afabbdb90d086fad14dadf8b4927cdf55d48b4078a1e9e4525")
    }

    @TestCase
    func test_hmac_combination_03(): Unit {
        var algorithm: HashType = HashType.SHA512
        var key: Array<UInt8> = "zpstest".toArray()
        var data: Array<Byte> = "zpstest".toArray()
        var hmac = HMAC(key, algorithm)
        hmac.write(data)
        hmac.reset()
        var md: Array<Byte> = hmac.finish()
        @Expect(toHexString(md),"675e9e3d3796fd2ec49218437b7d351385fc8cd8cfd41e2cd401e61f856e647d827503d08c446e236bf013c50899195ce97860d66345d827ac3ed9e109a5e4e9")
    }

    @TestCase
    func test_hmac_combination_04(): Unit {
        var algorithm: HashType = HashType.SHA512
        var key: Array<UInt8> = "zpstest".toArray()
        var data: Array<UInt8> = "#$%^&".toArray()
        var hmac = HMAC(key, algorithm)
        hmac.write(data)
        hmac.reset()
        var md: Array<Byte> = hmac.finish()
        @Expect(toHexString(md),"675e9e3d3796fd2ec49218437b7d351385fc8cd8cfd41e2cd401e61f856e647d827503d08c446e236bf013c50899195ce97860d66345d827ac3ed9e109a5e4e9")
    }

    @TestCase
    func test_hmac_combination_05(): Unit {
        var algorithm: HashType = HashType.SHA512
        var key: Array<UInt8> = "123".toArray()
        var data: Array<UInt8> = "\0".toArray()
        var hmac = HMAC(key, algorithm)
        hmac.write(data)
        hmac.reset()
        var md: Array<Byte> = hmac.finish()
        @Expect(toHexString(md),"79a898c707f0d60e2dc22f96854c1999540f4cdfce6463f74016aa18a3d1003628d47c4e745536afabbdb90d086fad14dadf8b4927cdf55d48b4078a1e9e4525")
    }

    @TestCase
    func test_hmac_combination_06(): Unit {
        var algorithm: HashType = HashType.SHA512
        var key: Array<UInt8> = "123".toArray()
        var data: Array<UInt8> = "仓颉".toArray()
        var hmac = HMAC(key, algorithm)
        hmac.write(data)
        hmac.reset()
        var md: Array<Byte> = hmac.finish()
        @Expect(toHexString(md),"79a898c707f0d60e2dc22f96854c1999540f4cdfce6463f74016aa18a3d1003628d47c4e745536afabbdb90d086fad14dadf8b4927cdf55d48b4078a1e9e4525")
    }

    @TestCase
    func test_hmac_combination_07(): Unit {
        var algorithm: HashType = HashType.SHA512
        var key: Array<UInt8> = "仓颉".toArray()
        var data: Array<UInt8> = [127, 0, 12, 36, 87, 98, 122, 13, 1, 2, 28, 93, 13, 10, 47, 59, 79, 99, 126, 100]
        var hmac = HMAC(key, algorithm)
        hmac.write(data)
        hmac.reset()
        var md: Array<Byte> = hmac.finish()
        @Expect(toHexString(md),"ec114c8c4110971ba09127fc093fa87923bc5b4b7ce9924ddf31f3a6f2b5376190d127cbcfdc1cd86c418e355a1b2262677d45f69d01868ab1843d890b6bbff2")
    }

    @TestCase
    func test_hmac_combination_08(): Unit {
        var algorithm: HashType = HashType.SHA512
        var key: Array<UInt8> = "仓颉".toArray()
        var data: Array<UInt8> = [127, 0, 12, 36, 87, 98, 122, 13, 1, 2, 28, 93, 13, 10, 47, 59, 79, 99, 126, 100]
        var dara1: Array<UInt8> = "zps123&^&".toArray()
        var dara2: Array<UInt8> = "123456".toArray()
        var dara3: Array<UInt8> = "abcdefg".toArray()
        var dara4: Array<UInt8> = "ABCDEFG".toArray()
        var dara5: Array<UInt8> = "#$%^&".toArray()
        var dara6: Array<UInt8> = "ABCabc123".toArray()
        var dara7: Array<UInt8> = "鸿蒙".toArray()
        var dara8: Array<UInt8> = "zps@qq.com".toArray()
        var dara9: Array<UInt8> = "仓颉test".toArray()
        var hmac = HMAC(key, algorithm)
        hmac.write(data)
        hmac.reset()
        var md: Array<Byte> = hmac.finish()
        @Expect(toHexString(md),"ec114c8c4110971ba09127fc093fa87923bc5b4b7ce9924ddf31f3a6f2b5376190d127cbcfdc1cd86c418e355a1b2262677d45f69d01868ab1843d890b6bbff2")
    }
}
