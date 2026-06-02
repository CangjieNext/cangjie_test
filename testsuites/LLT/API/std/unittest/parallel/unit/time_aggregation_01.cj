/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args --parallel=10 --no-color | compare %f
// ASSERT: scan-1 TP: default, time elapsed: 3
// ASSERT: scan-1 TCS: Tests1, time elapsed: 3
// ASSERT: scan-1 TCS: Tests2, time elapsed: 2
// ASSERT: scan-1 [ PASSED ] CASE: case11 (2
// ASSERT: scan-1 [ PASSED ] CASE: case12 (3
// ASSERT: scan-1 [ PASSED ] CASE: case21 (1
// ASSERT: scan-1 [ PASSED ] CASE: case22 (1

import std.sync.*
import std.time.*

@Test
@Parallel
class Tests1 {
    @TestCase
    func case11() {
        sleep(Duration.second * 2)
    }

    @TestCase
    func case12() {
        sleep(Duration.second * 3)
    }
}

@Test
class Tests2 {
    @TestCase
    func case21() {
        sleep(Duration.second)
    }

    @TestCase
    func case22() {
        sleep(Duration.second)
    }
}
