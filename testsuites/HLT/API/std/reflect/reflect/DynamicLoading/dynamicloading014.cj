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
// (not CJNATIVE and not MAC)  EXEC: cd module_case1 && %compiler %cmp_opt --output-type=cbclib  test3_dynamicloading_3.cj -o test3.dynamicloading_3.cbc
// (CJNATIVE) EXEC: cd module_case1 && %compiler %cmp_opt --output-type=dylib  test_dynamicloading.cj -o test.dynamicloading.%test_suffix
// (CJNATIVE) EXEC: cd module_case1 && %compiler %cmp_opt --output-type=dylib  test1_dynamicloading_1.cj -o test1.dynamicloading_1.%test_suffix
// (CJNATIVE) EXEC: cd module_case1 && %compiler %cmp_opt --output-type=dylib  test2_dynamicloading_2.cj -o test2.dynamicloading_2.%test_suffix
// (CJNATIVE) EXEC: cd module_case1 && %compiler %cmp_opt --output-type=dylib  test3_dynamicloading_3.cj -o test3.dynamicloading_3.%test_suffix
// (not MAC) EXEC: %compiler %cmp_opt %f -o %output
// (not MAC) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1

import std.reflect.*

main() {
    let m = PackageInfo.load("./module_case1/test.dynamicloading")
    let n = PackageInfo.load("./module_case1/test1.dynamicloading_1")
    let l = PackageInfo.load("./module_case1/test2.dynamicloading_2")
    let q = PackageInfo.load("./module_case1/test3.dynamicloading_3")
    // if (pkgm != pkgm || pkgm != pkgmm) {
    //     return 1
    // }

    // if (pkgn != pkgn || pkgn != pkgnn) {
    //     return 1
    // }

    // if (pkgl != pkgl || pkgl != pkgll) {
    //     return 1
    // }

    // if (pkgn != pkgl || pkgn != pkgll || pkgnn != pkgl || pkgnn != pkgll) {
    //     return 1
    // }

    // if (pkgq == pkgl || pkgq == pkgm || pkgq == pkgn) {
    //     return 1
    // }
    return 0
}
