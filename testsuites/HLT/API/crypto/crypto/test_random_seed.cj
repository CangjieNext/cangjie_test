/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

/*
 * Test description: Test the Random.seed with new getseed method
 * Test API: public open prop var seed: UInt64
 */

import std.random.*
import std.math.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class Test_Random_Seed {
    //init()方法创建random实例,seed随时间增长
    @TestCase
    func case1(): Unit {
        var r1 = Random()
        var r2 = Random()
        var seed1 = r1.seed
        var seed2 = r2.seed
    }

    //init(seed：UInt64), seed = 0
    @TestCase
    func case2(): Unit {
        var r1 = Random(0)
        @Expect(r1.seed, UInt64(0))
    }

    //init(seed：UInt64), seed = UInt64.Max
    @TestCase
    func case3(): Unit {
        var r1 = Random(UInt64.Max)
        @Expect(r1.seed, UInt64.Max)
    }
}
