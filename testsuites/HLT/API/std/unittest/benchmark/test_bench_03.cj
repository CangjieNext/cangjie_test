/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args --bench 2>&1 | compare %f
// ASSERT: scan running benchmark case01
// ASSERT: scan running benchmark case02
// ASSERT: scan Err%

/*
 * Test description:
 *      test @Bench with int64, this paremeter not work now
 * Test API:
 *      @Bench
 */

import std.sync.*
import std.time.*

@Test
class Test_Bench_01 {
    var count1 = AtomicInt64(0)
    var count2 = AtomicInt64(0)

    public override func afterAll(): Unit {
        if (count1.load() >= 6 && count1.load() <= 7) {
            println("running benchmark case01")
        }
        if (count2.load() >= 11 && count2.load() <= 12) {
            println("running benchmark case02")
        }
    }

    @Bench[1000]
    @Configure[minBatches: 5]
    func case01(): Unit {
        sleep(Duration.second)
        count1.fetchAdd(1)
    }

    @TestCase
    @Bench[1000]
    func case02(): Unit {
        sleep(Duration.second)
        count2.fetchAdd(1)
    }
}
