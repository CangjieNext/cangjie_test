/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color --report-path=reports --report-format=illegalformat 2>&1 | compare %f
// ASSERT: scan Unsupported test report format: illegalformat

import std.unittest.*
import std.unittest.testmacro.*

@Test
func test() {}
