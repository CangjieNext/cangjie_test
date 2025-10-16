/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt  %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 

import stdx.crypto.digest.*
import stdx.crypto.common.*
import std.collection.*
import stdx.encoding.hex.*

var sum = 0

@Test
class Test_hmac_combination_02 {
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_hmac_combination_01(): Unit {
        var algorithm: HashType = HashType.SHA512
        var key: Array<UInt8> = "123".toArray()
        var hmac = HMAC(key, algorithm)
        var md: Array<Byte> = hmac.finish()
        @Expect(toHexString(md),"79a898c707f0d60e2dc22f96854c1999540f4cdfce6463f74016aa18a3d1003628d47c4e745536afabbdb90d086fad14dadf8b4927cdf55d48b4078a1e9e4525")
        try {
            hmac.finish()
        } catch (e: CryptoException) {
            @Expect(e.message, "HMAC finish failed, digest calculation has been completed.")
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_hmac_combination_02(): Unit {
        var algorithm: HashType = HashType.SHA512
        var key: Array<UInt8> = "zpstest".toArray()
        var hmac = HMAC(key, algorithm)
        var md: Array<Byte> = hmac.finish()
        @Expect(toHexString(md),"675e9e3d3796fd2ec49218437b7d351385fc8cd8cfd41e2cd401e61f856e647d827503d08c446e236bf013c50899195ce97860d66345d827ac3ed9e109a5e4e9")
        try {
            hmac.finish()
        } catch (e: CryptoException) {
            @Expect(e.message, "HMAC finish failed, digest calculation has been completed.")
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_hmac_combination_03(): Unit {
        var algorithm: HashType = HashType.SHA512
        var key: Array<UInt8> = "zpstest".toArray()
        var hmac = HMAC(key, algorithm)
        var md: Array<Byte> = hmac.finish()
        @Expect(toHexString(md),"675e9e3d3796fd2ec49218437b7d351385fc8cd8cfd41e2cd401e61f856e647d827503d08c446e236bf013c50899195ce97860d66345d827ac3ed9e109a5e4e9")
        try {
            hmac.finish()
        } catch (e: CryptoException) {
            @Expect(e.message, "HMAC finish failed, digest calculation has been completed.")
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_hmac_combination_04(): Unit {
        var algorithm: HashType = HashType.SHA512
        var key: Array<UInt8> = "#$%^&".toArray()
        var hmac = HMAC(key, algorithm)
        var md: Array<Byte> = hmac.finish()
        @Expect(toHexString(md),"813c37006af56c154eef6ea06d3a21fc7daae5c08478827ff985513d1f09337a626bb6023d91bcdb6046a0cccd7ca33f11843b64cc6e0ecd67cfc7a8b8a84bda")
        try {
            hmac.finish()
        } catch (e: CryptoException) {
            @Expect(e.message, "HMAC finish failed, digest calculation has been completed.")
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_hmac_combination_05(): Unit {
        var algorithm: HashType = HashType.SHA512
        var key: Array<UInt8> = "\0".toArray()
        var hmac = HMAC(key, algorithm)
        var md: Array<Byte> = hmac.finish()
        @Expect(toHexString(md),"b936cee86c9f87aa5d3c6f2e84cb5a4239a5fe50480a6ec66b70ab5b1f4ac6730c6c515421b327ec1d69402e53dfb49ad7381eb067b338fd7b0cb22247225d47")
        try {
            hmac.finish()
        } catch (e: CryptoException) {
            @Expect(e.message, "HMAC finish failed, digest calculation has been completed.")
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_hmac_combination_06(): Unit {
        var algorithm: HashType = HashType.SHA512
        var key: Array<UInt8> = "仓颉".toArray()
        var hmac = HMAC(key, algorithm)
        var md: Array<Byte> = hmac.finish()
        @Expect(toHexString(md),"ec114c8c4110971ba09127fc093fa87923bc5b4b7ce9924ddf31f3a6f2b5376190d127cbcfdc1cd86c418e355a1b2262677d45f69d01868ab1843d890b6bbff2")
        try {
            hmac.finish()
        } catch (e: CryptoException) {
            @Expect(e.message, "HMAC finish failed, digest calculation has been completed.")
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_hmac_combination_07(): Unit {
        var algorithm: HashType = HashType.SHA512
        var key: Array<UInt8> = [127, 0, 12, 36, 87, 98, 122, 13, 1, 2, 28, 93, 13, 10, 47, 59, 79, 99, 126, 100]
        var hmac = HMAC(key, algorithm)
        var md: Array<Byte> = hmac.finish()
        @Expect(toHexString(md),"f963e8084e728e5f24d56c6f2b39248fd62fa3c082dae82a720d68ea16d6b86afdea802adc6ac0fd9012ddebe03c2f0c454f60bb84a8540c3093a6cc1b35d38d")
        try {
            hmac.finish()
        } catch (e: CryptoException) {
            @Expect(e.message, "HMAC finish failed, digest calculation has been completed.")
            sum += 1
        }
        @Expect(sum, 1)
    }
}
