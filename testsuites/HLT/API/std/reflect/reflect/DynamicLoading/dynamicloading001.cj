/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0 
// DEPENDENCE: module_case1
// (not CJNATIVE and not MAC) EXEC: cd module_case1 && %compiler %cmp_opt --output-type=cbclib  test_dynamicloading.cj -o test.dynamicloading.cbc
// (CJNATIVE) EXEC: cd module_case1 && %compiler %cmp_opt --output-type=dylib  test_dynamicloading.cj -o test.dynamicloading.so
// (not MAC) EXEC: %compiler %cmp_opt %f -o %output
// (not MAC) RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// (not CJNATIVE and not MAC) ASSERT: scan IllegalArgumentException
// (CJNATIVE) ASSERT: scan IllegalArgumentException

import std.reflect.*

main() {
    let m = PackageInfo.load("./module_case1/test.dynamicloading.cbc")
}
