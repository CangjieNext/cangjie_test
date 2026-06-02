// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: pkg
// EXEC:%compiler %enableCompileDebug %compile_lib_opt pkg/pkg.cj -o pkg/pkg.%middle
// EXEC:%compiler %enableCompileDebug pkg/pkg.%middle %n.cj --import-path pkg -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
internal import pkg.*

main(): Int64 {
    let a = Test(1)
    let b = a.add(1)
    var c = a.add(5)
    if (b != 2) {
        return 1
    }
    if (c != 6) {
        return 1
    }
    if (a.toInt64() != 1) {
        return 1
    }
    return 0
}
