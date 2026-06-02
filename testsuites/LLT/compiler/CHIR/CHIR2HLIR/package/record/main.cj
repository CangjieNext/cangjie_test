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
    var n: Rectangle = Rectangle(10, 20, {a: Int32 => return a + 1})
    let res = n.width + n.length
    var a = n.f(99)
    var b = n.count()
    if (res + a + b != 150) {
        return 1
    }

    var test = rA()
    if (test.a != 2) {
        return 2
    }
    if (test.b != 3) {
        return 3
    }
    if (test.f1() != 6) {
        return 5
    }
    return 0
}
