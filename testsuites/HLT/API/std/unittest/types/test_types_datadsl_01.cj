/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

/*
 * Test description:
 *      test types combind with dataDSL
 * Test API:
 *      @Types[]
 */

import std.time.*
import std.sync.*

@Test
class Test_Types_Data_01 {
    var count = AtomicInt64(0)

    @TestCase[a in 0 .. 10, 
 b in 0 .. 10 
]
    @Types[T in<Int64, String>]
    func case01<T>(a: Int64, b: Int64): Unit where T <: Hashable {
        @Expect(Array<T>().size, 0)
        count.fetchAdd(1)
    }

    @TestCase
    func case02(): Unit {
        @Expect(count.load(), 200)
    }
}
