// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
package test.memory

internal import std.collection.*

public class AllocUnit {
    var alloc_array: ArrayList<Int8>
    AllocUnit(Length: Int64) {
        alloc_array = ArrayList<Int8>(Length, {x: Int64 => Int8(0)})
    }
}

open class Thread {}

var Threads = ArrayList<Int64>()

main() {
    return 0
}
