/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-42: %run %run_opt %output %run_utest_opt %run_args --no-color | compare %f
// ASSERT: scan-not Summary

internal import std.process.*

@Test
func crash() {
    Process.current.exit(42)
}
