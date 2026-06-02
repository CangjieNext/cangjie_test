/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt 
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.fs.*
import std.math.numeric.*

@Test
class Test_bigint {
    @TestCase
    func test_add_case_01(): Unit {
        let big1 = BigInt(-2)
        let big2 = BigInt(1)
        let big3 = BigInt(0)
        @Expect(big2>=big1,true)
        big2.hashCode()
        @Expect(big3<=big2,true)
        @Expect(big3.toIntNative(overflowHandling:OverflowStrategy.Throwing).toString(),"0")
    }
}
