/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --death-aware --no-color | compare %f
// ASSERT: scan-1 PASSED: 2, SKIPPED: 0, ERROR: 1
// ASSERT: scan-1 Hello from test1
// ASSERT: scan-1 Hello from test2

internal import std.process.*

@Test
func test1() {
    print("Hello from test1\n", flush: true)
}

@Test
func crash() {
    Process.current.exit(42)
}

@Test
func test2() {
    print("Hello from test2\n", flush: true)
}
