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
// ASSERT: scan-9 count = 1
// ASSERT: scan-9 num = 1

/*
 * Test description:
 *      test types combination for a case
 * Test API:
 *      @Types[]
 */

import std.sync.*

@Test
@Types[T in<Int64, Float64, String>, U in<Int64, Float64, String>]
class Test_Types_Setup_01<T, U> where T <: Hashable, U <: Hashable {
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
    func case01(): Unit {
        @Expect(Array<T>().size, 0)
        @Expect(Array<T>().size, Array<U>().size)
    }
}
