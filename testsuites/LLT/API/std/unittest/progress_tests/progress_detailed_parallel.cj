/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_args --no-color --parallel=2 2>&1 | compare %f

// Check groups status
// ASSERT: regex-begin 📦 group default(\s+)(\d+)(\d+)\% \[(\|)*(\-)*\] ([✓✗\s])(\s)+\(\d\d\:\d\d\:\d\d\)

// Check test cases status
// ASSERT: regex-next 🧪 test(\s+)([\w\.]+)(\s+)\(\d\d\:\d\d\:\d\d\)
// ASSERT: regex-next 🧪 test(\s+)([\w\.]+)(\s+)\(\d\d\:\d\d\:\d\d\)

// Check empty line in place of error case
// ASSERT: regex-next $(\s*)^

// Check status line
// ASSERT: regex-next passed: (\d+), failed: 0(\s+)(\d+)\% \[(\|)*(\-)*\](\s+)(\d+)\/(\d+) \(\d\d\:\d\d\:\d\d\)

import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class Base {
    @TestCase
    func test1() {
        sleep(600 * Duration.millisecond)
    }

    @TestCase
    func test2() {
        sleep(600 * Duration.millisecond)
    }
}

@Test
class Another {
    @TestCase
    func other1() {
        sleep(600 * Duration.millisecond)
    }

    @TestCase
    func other2() {
        sleep(600 * Duration.millisecond)
    }
}
