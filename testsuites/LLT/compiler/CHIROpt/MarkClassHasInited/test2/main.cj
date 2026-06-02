// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg
// EXEC:%compiler %cmp_opt %compile_lib_opt pkg/pkg.cj -o pkg.%middle
// EXEC:%compiler %cmp_opt pkg.%middle %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

internal import std.runtime.*
internal import pkg.*

main(): Int64 {
    for (loop in 0..10) {
        subHandle()
        GC()
    }
    sleep(Duration.millisecond * 200)
    if (cnt < 1) {
        return 1
    }
    println(cnt)
    return 0
}
