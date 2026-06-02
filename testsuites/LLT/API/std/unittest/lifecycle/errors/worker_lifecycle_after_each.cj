/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args --no-color --timeout-each=1s | compare %f
// ASSERT: scan PASSED: 0, SKIPPED: 0, ERROR: 1
// ASSERT: scan After each step failed.
// ASSERT: scan Exception: def
// ASSERT: scan-not Exception: abc

import std.unittest.*
import std.unittest.testmacro.*

@Test
@Timeout[Duration.second]
class Tests2 {
    var d = 0

    @BeforeEach
    func before(): Unit {
        d = 1
    }

    @AfterEach
    func after(): Unit {
        if (d != 1) {
            throw Exception("abc")
        }
        throw Exception("def")
    }

    @TestCase
    func f() {
    }
}
