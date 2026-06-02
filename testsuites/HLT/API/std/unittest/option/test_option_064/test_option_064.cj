/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -p p1 %cmp_utest_opt -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: regex (.*PASS.*) CASE: caseA
// ASSERT: regex (.*PASS.*) CASE: caseB
// ASSERT: regex (.*PASS.*) CASE: caseC
