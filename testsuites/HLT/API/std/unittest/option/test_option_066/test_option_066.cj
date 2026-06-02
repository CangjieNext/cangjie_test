/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: p1 p2
// EXEC: %compiler %cmp_opt  --output-type=staticlib -p p1 -o p1.%middle
// EXEC: %compiler %cmp_opt -p p2 p1.%middle %cmp_utest_opt -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: regex (.*FAIL.*) CASE: caseD
// ASSERT: regex (.*FAIL.*) CASE: caseE
// ASSERT: regex (.*FAIL.*) CASE: caseF
