/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan TOTAL: 1
// ASSERT: regex .*PASSED.*: 0, .*SKIPPED.*: 0, ERROR: 0
// ASSERT: regex .*FAILED.*: 1, listed below:
// ASSERT: regex TCS: .*Demo.*, CASE: test

import std.unittest.*
import std.unittest.testmacro.*

@Test
public class Demo {
    @TestCase
    func test(): Unit {
        let value = ""
        @Expect(value,#"a\1"#)
    }
}
