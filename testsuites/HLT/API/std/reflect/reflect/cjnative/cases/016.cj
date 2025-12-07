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
// (not MAC) EXEC: cd ./MyType && %compiler %cmp_opt --output-type=dylib --module-name=MyType ./src/myType/p0/*.cj -o libMyType_myType.p0.%test_suffix
// (not MAC) EXEC: %compiler %cmp_opt -o %output %f
// (not MAC) RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 
// 反复加载同一个动态库模块。

import std.reflect.*

main(): Unit {
    PackageInfo.load("./MyType/libMyType_myType")
    PackageInfo.load("./MyType/libMyType_myType.p0")
}
