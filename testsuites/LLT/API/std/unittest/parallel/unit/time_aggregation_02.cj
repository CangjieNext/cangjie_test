/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args --parallel=3
// ASSERT: scan-1 TCS: TestParallel, time elapsed: 6

import std.time.*
import std.sync.*

@Test
@Parallel
class TestParallel {
    @TestCase[x in [ 0, 1, 2 ]]
    func case01(x: Int64): Unit {
        sleep(Duration.second * 2)
    }

    @TestCase
    func case02(): Unit {
        sleep(Duration.second * 2)
    }
}
