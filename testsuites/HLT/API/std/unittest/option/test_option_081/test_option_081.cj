/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: m1
// (not Windows) EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt m1/src %cmp_utest_opt -o %output
// (not Windows) EXEC-PIPE-126: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// (not Windows) ASSERT: scan Permission denied

