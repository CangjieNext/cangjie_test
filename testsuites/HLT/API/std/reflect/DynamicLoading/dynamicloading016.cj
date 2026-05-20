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
// (!(target_mac | target_ios | target_ios_simulator)) RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.reflect.*

main(): Int64 {
    let pkgm = PackageInfo.load("./module_case1/test.dynamicloading")
    let pkgn = PackageInfo.load("./module_case1/test1.dynamicloading_1")
    let pkgl = PackageInfo.load("./module_case1/test2.dynamicloading_2")
    let pkgh = PackageInfo.load("./module_case1/test3.dynamicloading_3")

    for (gv in pkgh.variables) {
        if (gv.name == "int8") {
            if ((gv.getValue() as Int8).getOrThrow() != 12) {
                return 1
            }

            let mutIValue = (gv.getValue() as Int8).getOrThrow()

            gv.setValue(-mutIValue)

            (gv.getValue() as Int8).getOrThrow() |> println

            if ((gv.getValue() as Int8).getOrThrow() != -12) {
                return 1
            }

            return 0
        }
    }
    return 0
}
