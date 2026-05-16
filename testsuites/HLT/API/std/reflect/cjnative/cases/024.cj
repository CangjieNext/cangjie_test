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
// (!(target_mac | target_ios | target_ios_simulator)) EXEC: %compiler %compilation_options %extra_options %lto_options %sanitizer_options %mock_options %optimization_options %debug_options --dy-std -o %output %f
// (!(target_mac | target_ios | target_ios_simulator)) RUN-EXEC: %run %run_opt %output %run_args

import std.reflect.*

main(): Unit {
    // 非法动态模块名称。
    // 不以lib开头。
    // ModuleInfo.load("./xxx")
    // lib之后的模块名非法。
    // ModuleInfo.load("./lib123b")
    // 模块合法但之后不跟随下划线
    // ModuleInfo.load("./libxxx")
    // 下划线后无至少一个包名。
    // ModuleInfo.load("./libxxx_")
    // 包名不合法。
    // ModuleInfo.load("./libxxx_123b")
    // 模块名称或包名称中含有下划线。
    // 动态模块名称合法，但不存在。
    // ModuleInfo.load("./libxxx_xxx")
    // 路径非法。
    // ModuleInfo.load(".../libxxx")
    PackageInfo.load("./MyType/libMyType.myType")
}
