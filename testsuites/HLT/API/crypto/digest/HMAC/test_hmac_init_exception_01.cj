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
class Test_hmac_init_exception_01 {
    public override func beforeEach(): Unit {
        sum = 0
    }
    @TestCase
    func test_hmac_init_exception_01(): Unit {
        var algorithm: HashType = HashType.SHA512
        var key: Array<UInt8> = "".toArray()
        try {
            HMAC(key, algorithm)
        } catch (e: CryptoException) {
            @Expect(e.message,"The key cannot be empty.")
            sum += 1
        }
        @Expect(sum, 1)
    }
}
