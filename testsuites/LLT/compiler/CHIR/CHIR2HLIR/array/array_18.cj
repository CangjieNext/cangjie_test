// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

interface I1 {}

extend<T> Array<T> <: I1 {}

main() {
    let collection: Collection<Int64> = Array<Int64>(3, {i => i})
    let ins0: I1 = Array(3, {i: Int64 => i})
    let ins1: I1 = Array<Int64>(3, {i => i})
    let ins2: ?Array<Int64> = Array<Int64>(3, {i => i})
    let ins3: ?Array<Int64> = [1]
    let arr = ins2 ?? Array<Int64>()
    if (collection.size != 3 || arr.size != 3) {
        return 1
    }
    return 0
}
