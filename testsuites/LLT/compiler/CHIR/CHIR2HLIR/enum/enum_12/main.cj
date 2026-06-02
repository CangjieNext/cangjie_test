// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: pkg
// EXEC:%compiler %enableCompileDebug %compile_lib_opt pkg/pkg.cj -o pkg.%middle
// EXEC:%compiler %enableCompileDebug pkg.%middle %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
internal import pkg.*

main() {
    var b = Time.Date
    var c = Time.Hour(true, 15)
    var d = Time.Year(r'a', 5, 50)
    var res = match (d) {
        case Hour(x, y) => y
        case Date => -5
        case Year(x, y, z) => z
    }
    if (b.f() != 1 || b.val != 2 || Time.f2() != 3) {
        return 1
    }
    res - 50
}
