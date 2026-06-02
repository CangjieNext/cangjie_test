// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: pkga pkgb
// EXEC:%compiler %enableCompileDebug %compile_lib_opt pkga/pkga.cj -o pkga.%middle
// EXEC:%compiler %enableCompileDebug %compile_lib_opt pkga.%middle pkgb/pkgb.cj -o pkgb.%middle
// EXEC:%compiler %enableCompileDebug pkga.%middle pkgb.%middle %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
internal import pkga.*
internal import pkgb.*

main() {
    var b = Time<Int64>.Date;
    var c = Time<Int64>.Hour(true, 9)
    var d = Time<Int64>.Year(r'a', 5, 50)
    var res = match (c) {
        case Hour(x, y) => y
        case Date => -5
        case Year(x, y, z) => z
        case _ => -1
    }
    if (b.f() != 1 || b.val != 2 || Time<Int64>.f2() != 3) {
        return 1
    }
    res + foo2() - 99
}
