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
    var x: Int64 = 12
    var y: Int64 = 30
    if (foo(x, y) != 42) {
        return 1
    }
    var f = foo()
    if (f != 1) {
        return 2
    }

    var n = foo(2)
    if (n != 2) {
        return 3
    }
    return 0
}
