/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0 
// DEPENDENCE: module_case1
// EXEC: cd module_case1 && %compiler %cmp_opt %compile_dylib_opt  test_dynamicloading.cj -o test.dynamicloading.so
// (not MAC) EXEC: %compiler %cmp_opt %f -o %output
// (not MAC) RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan IllegalArgumentException

import std.reflect.*

main() {
    let m = PackageInfo.load("./module_case1/test.dynamicloading.cbc")
}
