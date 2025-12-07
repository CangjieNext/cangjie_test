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
// (not CJNATIVE and not MAC) EXEC: cd module_case1 && %compiler %cmp_opt --output-type=cbclib  test1_dynamicloading_1.cj -o test1.dynamicloading_1.cbc
// (not CJNATIVE and not MAC) EXEC: cd module_case1 && %compiler %cmp_opt --output-type=cbclib  test2_dynamicloading_2.cj -o test2.dynamicloading_2.cbc
// (CJNATIVE) EXEC: cd module_case1 && %compiler %cmp_opt --output-type=dylib  test_dynamicloading.cj -o test.dynamicloading.%test_suffix
// (CJNATIVE) EXEC: cd module_case1 && %compiler %cmp_opt --output-type=dylib  test1_dynamicloading_1.cj -o test1.dynamicloading_1.%test_suffix
// (CJNATIVE) EXEC: cd module_case1 && %compiler %cmp_opt --output-type=dylib  test2_dynamicloading_2.cj -o test2.dynamicloading_2.%test_suffix
// (not MAC) EXEC: %compiler %cmp_opt %f -o %output
// (not MAC) RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.reflect.*

main(): Int64 {
    let pkgm = PackageInfo.load("./module_case1/test.dynamicloading")
    let pkgn = PackageInfo.load("./module_case1/test1.dynamicloading_1")
    let pkgl = PackageInfo.load("./module_case1/test2.dynamicloading_2")
    if (pkgm.name != "demo" || pkgn.name != "test" || pkgl.name != "test") {
        return 1
    }
    if (pkgm.qualifiedName != "test.demo" || pkgn.qualifiedName != "test1.test" || pkgl.qualifiedName != "test2.test") {
        return 1
    }
    return 0
}
