/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args --no-color --bench | compare %f
// ASSERT: scan NotFound
// ASSERT: scan Ratio
// ASSERT: scan-2 | case02 |
// ASSERT: scan-2 | case01 |
// ASSERT: scan-2 | case03 |

/*
 * Test description:
 *      test if baseline mode: baseline for a class and for a case
 * Test API:
 *      @Configure[baseline: casename]
 */

import std.time.*
import std.sync.*

@Test
@Configure[batchSize: 100, minBatches: 1, minDuration: Duration.second * 2]
@Configure[baseline: "case01"]
class Test_Configure_Baseline_01 {
    // baseline: case02
    @Bench
    @Configure[baseline: "case02"]
    func case01(): Unit {
        sleep(Duration.second * 0.1)
    }

    // baseline: case01
    @Bench
    func case02(): Unit {
        sleep(Duration.second * 0.1)
    }

    // baseline: case01
    @Bench
    @Configure[baseline: "case01"]
    func case03(): Unit {
        sleep(Duration.second * 0.1)
    }

    // baseline: case02
    @Bench
    @Configure[baseline: "case02"]
    func case04(): Unit {
        sleep(Duration.second * 0.1)
    }

    // baseline: none
    @Bench
    @Configure[baseline: "case0"]
    func case05(): Unit {
        sleep(Duration.second * 0.1)
    }

    // baseline: case03
    @Bench
    @Configure[baseline: "case02"]
    @Configure[baseline: "case03"]
    func case06(): Unit {
        sleep(Duration.second * 0.1)
    }
}
