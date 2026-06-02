/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --death-aware --no-color | compare %f
// ASSERT: scan-1 PASSED: 0, SKIPPED: 0, ERROR: 1
// ASSERT: scan-1 FAILED: 1

import std.unittest.*
import std.unittest.testmacro.*
import std.process.*
import std.collection.*

@Test
func crashingOne(): Unit {
    Process.current.exit(42)
}

@Test
func withFailingPowerAssert(): Unit {
    @PowerAssert([1, 2] == [1])
}
