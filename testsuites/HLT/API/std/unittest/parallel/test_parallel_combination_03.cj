/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --bench --parallel=2 2>&1 | compare %f
// ASSERT: scan UnittestCliOptionsFormatException: It is not allowed to use both --parallel and --bench at once

/*
 * Test description:
 *      test @Parallel with @Bench, not allowed now
 * Test API:
 *      @Parallel, --parallel=NUMBER|nCores|NUMBERnCores
 */

import std.time.*
import std.sync.*

@Test
@Parallel
class Test_Parallel_Combination {
    @TestCase
    func case01(): Unit {
        sleep(Duration.second * 2)
    }

    @Bench
    @Configure[minDuration: Duration.second * 2]
    func case02(): Unit {
    }
}
