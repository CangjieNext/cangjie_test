/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args | compare %f
// ASSERT: scan count = 1
// ASSERT: scan num = 9

/*
 * Test description:
 *      test types using with beforeeach and beforeall
 * Test API:
 *      @Types[]
 */

import std.sync.*

@Test
class Test_Types_Setup_01 {
    var count = AtomicInt64(0)
    var num = AtomicInt64(0)

    public override func beforeAll(): Unit {
        count.fetchAdd(1)
    }

    public override func beforeEach(): Unit {
        num.fetchAdd(1)
    }

    public override func afterAll(): Unit {
        println("count = ${count.load()}")
        println("num = ${num.load()}")
    }

    @TestCase
    @Types[T in<Int64, Float64, String>, U in<Int64, Float64, String>]
    func case01<T, U>(): Unit where T <: Hashable, U <: Hashable {
        @Expect(Array<T>().size, 0)
        @Expect(Array<T>().size, Array<U>().size)
    }
}
