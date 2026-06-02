// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

internal import std.sync.*

main(): Int64 {
    let test = AtomicInt16(2)
    var x = test.fetchAdd(3, memoryOrder: DefaultMemoryOrder)
    if (test.load() == 5) {
        return 0
    }
    return 1
}
