/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:%compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: scan OK

/*
 * Test description: Test the funcs of GenericAtomic operation
 * Test API:
 *          public func fetchAnd(val: T, memoryOrder!: MemoryOrder = DefaultMemoryOrder): T
 *          public func fetchOr(val: T, memoryOrder!: MemoryOrder = DefaultMemoryOrder): T
 *          public func fetchXor(val: T, memoryOrder!: MemoryOrder = DefaultMemoryOrder): T
 */

internal import std.sync.*

main(): Int64 {
    var genericAtomic = AtomicInt64(1)
    var g1 = genericAtomic.fetchAnd(1)
    var g2 = genericAtomic.fetchOr(0)
    var g3 = genericAtomic.fetchXor(0)
    if (g1 != 1) {
        return 1
    }
    if (g2 != 1) {
        return 2
    }
    if (g2 != 1) {
        return 3
    }
    print("OK")
    return 0
}
