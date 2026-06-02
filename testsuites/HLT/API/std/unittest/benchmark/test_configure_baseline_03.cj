/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args --bench | compare %f
// ASSERT: scan-4 NotFound

/*
 * Test description:
 *      test if baseline mode: baseline for a class and for a case
 * Test API:
 *      @Configure[baseline: casename]
 */

import std.time.*
import std.sync.*

@Test
@Configure[batchSize: 3, minDuration: Duration.nanosecond, minBatches: 1, warmup: Duration.nanosecond]
class Test_Configure_Baseline_03 {
    @Bench
    @TestCase
    @Configure[baseline: "case02"]
    @Configure[baseline: "case0"]
    func case01(): Unit {
        sleep(Duration.second * 0.01)
    }

    @Bench
    func case02(): Unit {
        sleep(Duration.second * 0.01)
    }
}

@Test
@Configure[batchSize: 3, minDuration: Duration.second, minBatches: 1, baseline: "case01"]
@Configure[baseline: "case0"]
class Test_Configure_Baseline_04 {
    @Bench
    @TestCase
    func case01(): Unit {
        sleep(Duration.second * 0.01)
    }

    @Bench
    func case02(): Unit {
        sleep(Duration.second * 0.01)
    }
}

@Test
@Configure[batchSize: 3, minDuration: Duration.second, minBatches: 1, baseline: "case01"]
class Test_Configure_Baseline_05 {
    // function testcase can not be used as baseline
    @TestCase
    func case01(): Unit {
        sleep(Duration.second * 0.01)
    }

    @Bench
    func case02(): Unit {
        sleep(Duration.second * 0.01)
    }
}
