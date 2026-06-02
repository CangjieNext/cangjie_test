/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-1: %run %run_opt %output --progress-brief %run_args --no-color --parallel 2>&1 | compare %f

// Check no groups status
// ASSERT: scan-not 📦 group

// Check no test cases status
// ASSERT: scan-not 🧪 test

// Check summary line
// ASSERT: regex passed: (\d)+, failed: (\d)+(\s)+(\d)+\% \[(\|)*(\-)*\](\s)+(\d)+\/(\d)+ \(\d\d\:\d\d\:\d\d\)

import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
func dummyTest() {
    for (i in 0..=10) {
        @Assert(i != 10)
    }
}

@Test[a in [ 0, 10, 1000 ]]
func paramTest(a: Int64) {
    sleep(a * Duration.millisecond)
    @Assert(a != 1000)
}
