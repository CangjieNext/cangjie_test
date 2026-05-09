/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %stdx-package  %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run_stdx %output %run_utest_opt %run_args
import stdx.crypto.crypto.*
import std.collection.*
import std.math.*

var lib: UInt32 = 0
var count = 0

@Test
class Test_random_nextUInt32_max_01 {
    @TestCase
    func test_random_nextUInt32_max_01(): Unit {
        var r1: SecureRandom = SecureRandom()
        var r2: SecureRandom = SecureRandom(priv: true)

        try {
            r1.nextUInt32(lib)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument.")
            count += 1
        }
        @Expect(count, 1)
        try {
            r2.nextUInt32(lib)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument.")
            count += 1
        }
        @Expect(count, 2)
    }
}
