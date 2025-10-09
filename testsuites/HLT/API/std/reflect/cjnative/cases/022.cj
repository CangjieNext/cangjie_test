/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../MyType
// (not MAC) EXEC: cd ./MyType && %compiler %cmp_opt --output-type=dylib --module-name=MyType ./src/myType/*.cj -o libMyType_myType.%test_suffix
// (not MAC) EXEC: %compiler %cmp_opt -o %output %f
// (not MAC) RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// (not MAC) ASSERT: scan IllegalArgumentException
// 反复加载同一个动态库模块。

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
    // ModuleInfo.load("./libxxx.")
    // 包名不合法。
    // ModuleInfo.load("./libxxx.123b")
    // 模块名称或包名称中含有下划线。
    // 动态模块名称合法，但不存在。
    PackageInfo.load("./libxxx.xxx")

    // ModuleInfo.load(".../libxxx")
}
