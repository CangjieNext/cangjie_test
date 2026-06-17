/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// LEVEL: 2
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --death-aware --no-color | compare %f
// ASSERT: scan Test process was killed by the test framework
// ASSERT: scan got stuck during static initialization
// TIMEOUT: 30

import std.time.*

let _ = {
    =>
    sleep(Duration.second * 15)
    0
}()

@Test
func neverRuns() {}
