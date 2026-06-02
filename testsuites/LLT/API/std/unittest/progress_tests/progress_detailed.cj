/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args --no-color 2>&1 | compare %f

// Check groups status
// ASSERT: regex 📦 group ([\w\.]+)(\s+)(\d+)(\d+)\% \[(\|)*(\-)*\] ([✓✗\s])(\s)+\(\d\d\:\d\d\:\d\d\)

// Check test cases status
// ASSERT: regex 🧪 test(\s+)([\w\.]+)(\s+)\(\d\d\:\d\d\:\d\d\)

// Check failed case line:
// ASSERT: regex FAIL ([\w\.]+)

// Check status line
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
