/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0 
// DEPENDENCE: module_case1
// (!(target_mac | target_ios | target_ios_simulator)) EXEC: cd module_case1 && %compiler %compilation_options %extra_options %lto_options %sanitizer_options %mock_options %optimization_options %debug_options --dy-std %compile_dylib_opt  test_dynamicloading.cj -o test.dynamicloading.%test_suffix
// (!(target_mac | target_ios | target_ios_simulator)) EXEC: cd module_case1 && %compiler %compilation_options %extra_options %lto_options %sanitizer_options %mock_options %optimization_options %debug_options --dy-std %compile_dylib_opt  test1_dynamicloading_1.cj -o test1.dynamicloading_1.%test_suffix
// (!(target_mac | target_ios | target_ios_simulator)) EXEC: cd module_case1 && %compiler %compilation_options %extra_options %lto_options %sanitizer_options %mock_options %optimization_options %debug_options --dy-std %compile_dylib_opt  test2_dynamicloading_2.cj -o test2.dynamicloading_2.%test_suffix
// (!(target_mac | target_ios | target_ios_simulator)) EXEC: cd module_case1 && %compiler %compilation_options %extra_options %lto_options %sanitizer_options %mock_options %optimization_options %debug_options --dy-std %compile_dylib_opt  test3_dynamicloading_3.cj -o test3.dynamicloading_3.%test_suffix
// (!(target_mac | target_ios | target_ios_simulator)) EXEC: %compiler %compilation_options %extra_options %lto_options %sanitizer_options %mock_options %optimization_options %debug_options --dy-std %f -o %output
// (!(target_mac | target_ios | target_ios_simulator)) RUN-EXEC: %run %run_opt %output %run_args 2>&1

import std.reflect.*
import std.fs.*
import std.sync.*
import std.collection.*

main(): Int64 {
    var fut = ArrayList<PackageInfo>()

    fut.add(PackageInfo.load("./module_case1/test.dynamicloading"))
    fut.add(PackageInfo.load("./module_case1/test1.dynamicloading_1"))
    fut.add(PackageInfo.load("./module_case1/test2.dynamicloading_2"))
    fut.add(PackageInfo.load("./module_case1/test3.dynamicloading_3"))
    if (fut[0].name != "demo" || fut[0].version != "" || fut[0].qualifiedName != "test.demo") {
        return 1
    }

    if (fut[1].name != "test" || fut[1].version != "" || fut[1].qualifiedName != "test1.test") {
        return 1
    }

    if (fut[2].name != "test" || fut[2].version != "" || fut[2].qualifiedName != "test2.test") {
        return 1
    }

    if (fut[3].name != "test" || fut[3].version != "" || fut[3].qualifiedName != "test3.aa.bb.cc.dd.test") {
        return 1
    }

    return 0
}
