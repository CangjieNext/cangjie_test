/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Error: std.testrunner executable is expected to
// ASSERT: scan Exception

// NOTE: tests for message produced by cjpm test runner

package std.testrunner

import std.unittest.testRunnerEntryMain

main() { testRunnerEntryMain() }