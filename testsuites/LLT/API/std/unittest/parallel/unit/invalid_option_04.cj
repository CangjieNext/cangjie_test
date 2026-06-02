/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --parallel=0.5 --no-color 2>&1 | compare %f
// ASSERT: scan UnittestOptionValidationException: Option 'parallel' (parallel.toString='0.500000') type is not valid.

@Test
func test(): Unit {}
