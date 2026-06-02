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

main() {
    var x: Int64 = 1
    var y: Int64 = 3
    var a: Int64 = 10
    var b: Int64 = 20
    var c: Int64 = foo(a, b)
    if (foo(x, y) != 4) {
        return foo(x, y)
    }
    if (c != 30) {
        return c
    }
    return 0
}
