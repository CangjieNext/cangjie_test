/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args --no-color --parallel=2 --verbose 2>&1 | compare %f
// ASSERT: scan [SKIPPED ] CASE: case01
// ASSERT: scan case02
// ASSERT: scan a = 4
// ASSERT: scan-not case03
// ASSERT: scan case04<String>

/*
 * Test description:
 *      test @Parallel with @Skip, @Bench, @Types...
 * Test API:
 *      @Parallel, --parallel=NUMBER|nCores|NUMBERnCores
 */

import std.time.*
import std.sync.*

@Test
@Parallel
class Test_Parallel_Combination {
    @TestCase
    @Skip
    func case01(): Unit {
        sleep(Duration.second * 2)
    }

    @TestCase[a in 0 .. 5 
]
    func case02(a: Int64): Unit {
        println("a = ${a}")
        sleep(Duration.second * 2)
    }

    @Bench
    func case03(): Unit {
    }

    @TestCase
    @Types[T in<Int64, Float64, String>]
    func case04<T>(): Unit where T <: Hashable {
        @Expect(Array<T>().size, 0)
    }
}
