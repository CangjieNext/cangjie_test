/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../helpers
// EXEC: %compiler %cmp_opt %pkg_opt -Woff=all -p helpers %compile_lib_opt --output p.%middle
// EXEC: %compiler %cmp_opt p.%middle %n.cj -o %output --test
// RUN-EXEC-PIPE-1: %run %run_opt %output --no-color 2>&1 | compare %f
// ASSERT: scan StackOverflow
// ASSERT: scan [ ERROR  ] CASE: infinite
// ASSERT: scan PASSED: 0, SKIPPED: 0, ERROR: 1
// ASSERT: scan TCS: TestCase_infinite, CASE: infinite

import std.error_test_util.*

@Test
func infinite() {
    let e2: Exception = @AssertThrows[Exception](infiniteRecursion(0))
    @Assert(e2 is Exception)
}
