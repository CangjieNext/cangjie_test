/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../MyType
// (!(target_mac | target_ios | target_ios_simulator)) EXEC: %compiler %compilation_options %extra_options %lto_options %sanitizer_options %mock_options %optimization_options %debug_options --dy-std %compile_dylib_opt ./MyType/src/myType/*.cj -o ./MyType/libMyType.myType.%test_suffix
// (!(target_mac | target_ios | target_ios_simulator)) EXEC: cd ./MyType && %compiler %compilation_options %extra_options %lto_options %sanitizer_options %mock_options %optimization_options %debug_options --dy-std %compile_dylib_opt --module-name=MyType ./src/myType/p0/*.cj -o libMyType.myType.p0.%test_suffix
// (!(target_mac | target_ios | target_ios_simulator)) EXEC: %compiler %compilation_options %extra_options %lto_options %sanitizer_options %mock_options %optimization_options %debug_options --dy-std -o %output %f
// (!(target_mac | target_ios | target_ios_simulator)) RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 
// 反复加载同一个动态库模块。

import std.reflect.*

main(): Unit {
    PackageInfo.load("./MyType/libMyType.myType")
    PackageInfo.load("./MyType/libMyType.myType.p0")
}
