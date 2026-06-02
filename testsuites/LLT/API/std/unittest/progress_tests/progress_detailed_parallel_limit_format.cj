/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args --no-color --parallel=3 --progress-entries-limit=-1 2>&1 | compare %f

// ASSERT: scan Wrong --progressEntriesLimit option argument format. Provided: -1. Parameter format: non-negative integer value

import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class Test1 {
    @TestCase
    func test1() {}
}
