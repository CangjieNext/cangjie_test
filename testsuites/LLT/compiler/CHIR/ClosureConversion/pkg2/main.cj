// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: pkg/pkg.cj
// (DEBUG_OPTION)EXEC:%compiler pkg.cj %compile_lib_opt -o pkg.%middle
// (DEBUG_OPTION)EXEC-PIPE-0:%compiler %debugCHIROpt pkg.%middle %n.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION)ASSERT: scan The imported func foo from package pkg was closure converted
// (DEBUG_OPTION)EXEC-PIPE-0: %run %output

internal import pkg.*

func goo<T>() {
    bar<Int64>(1, foo)
    return 1
}

func bar<T>(b: Int64, a: () -> T) {
    a()
    return 0
}

main() {
    bar<Int64>(1, foo)
    0
}
