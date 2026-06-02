/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args --bench --no-color | compare %f
// ASSERT: scan-not OverflowException
// ASSERT: scan PASSED: 1

import std.time.*
import std.sync.*

@Test
@Configure[minDuration: Duration.nanosecond, minBatches: 1, warmup: Duration.nanosecond]
@Configure[randomSeed: -1000]
class NegativeRandomSeedShouldNotCauseFailures {
    @Bench
    @Configure[randomSeed: -2000]
    func f(): Unit {
        sleep(Duration.nanosecond)
    }
}
