/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:%compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

/*
 * Test description: Test the funcs of AtomicUInt64
 * Test API:
 *          public init(val: UInt64)
 *          public init(val: UInt64, memoryOrder: MemoryOrder)
 *          public func load(): UInt64
 *          public func load(memoryOrder: MemoryOrder): UInt64
 *          public func store(val: UInt64): Unit
 *          public func store(val: UInt64, memoryOrder: MemoryOrder): Unit
 *          public func swap(val: UInt64): UInt64
 *          public func swap(val: UInt64, memoryOrder: MemoryOrder): UInt64
 *          public func compareAndSwap(old: UInt64, new: UInt64): Bool
 *          public func compareAndSwap(old: UInt64, new: UInt64, memoryOrder1: MemoryOrder, memoryOrder2: MemoryOrder): Bool
 *          public func fetchAdd(val: UInt64): UInt64
 *          public func fetchAdd(val: UInt64, memoryOrder: MemoryOrder): UInt64
 *          public func fetchSub(val: UInt64): UInt64
 *          public func fetchSub(val: UInt64, memoryOrder: MemoryOrder): UInt64
 *          public func fetchAnd(val: UInt64): UInt64
 *          public func fetchAnd(val: UInt64, memoryOrder: MemoryOrder): UInt64
 *          public func fetchOr(val: UInt64): UInt64
 *          public func fetchOr(val: UInt64, memoryOrder: MemoryOrder): UInt64
 *          public func fetchXor(val: UInt64): UInt64
 *          public func fetchXor(val: UInt64, memoryOrder: MemoryOrder): UInt64
 */

internal import std.sync.*

func testOperation1(): UInt64 {
    var atomicUInt64 = AtomicUInt64(1)
    var a1 = atomicUInt64.fetchAdd(1)
    var a2 = atomicUInt64.fetchSub(1)
    var a3 = atomicUInt64.fetchAnd(1)
    var a4 = atomicUInt64.fetchOr(0)
    var a5 = atomicUInt64.fetchXor(0)
    var a6 = atomicUInt64.load()
    if (a1 != 1) {
        return 1
    }
    if (a2 != 2) {
        return 2
    }
    if (a3 != 1) {
        return 3
    }
    if (a4 != 1) {
        return 4
    }
    if (a5 != 1) {
        return 5
    }
    if (a6 != 1) {
        return 6
    }
    return 0
}

func testOperation2(): UInt64 {
    var atomicUInt64 = AtomicUInt64(1)
    var a1 = atomicUInt64.fetchAdd(1, memoryOrder: DefaultMemoryOrder)
    var a2 = atomicUInt64.fetchSub(1, memoryOrder: DefaultMemoryOrder)
    var a3 = atomicUInt64.fetchAnd(1, memoryOrder: DefaultMemoryOrder)
    var a4 = atomicUInt64.fetchOr(0, memoryOrder: DefaultMemoryOrder)
    var a5 = atomicUInt64.fetchXor(0, memoryOrder: DefaultMemoryOrder)
    var a6 = atomicUInt64.load(memoryOrder: DefaultMemoryOrder)
    if (a1 != 1) {
        return 1
    }
    if (a2 != 2) {
        return 2
    }
    if (a3 != 1) {
        return 3
    }
    if (a4 != 1) {
        return 4
    }
    if (a5 != 1) {
        return 5
    }
    if (a6 != 1) {
        return 6
    }
    return 0
}

func testFunction1(): UInt64 {
    var atomicUInt64 = AtomicUInt64(1)
    atomicUInt64.store(2)
    var a1 = atomicUInt64.load()
    var a2 = atomicUInt64.swap(1)
    var a3 = atomicUInt64.load()
    var a4 = atomicUInt64.compareAndSwap(a1, 2)
    if (a1 != 2) {
        return 1
    }
    if (a2 == a3) {
        return 2
    }
    if (a4) {
        return 3
    }
    return 0
}

func testFunction2(): UInt64 {
    var atomicUInt64 = AtomicUInt64(1)
    atomicUInt64.store(2, memoryOrder: DefaultMemoryOrder)
    var a1 = atomicUInt64.load(memoryOrder: DefaultMemoryOrder)
    var a2 = atomicUInt64.swap(1, memoryOrder: DefaultMemoryOrder)
    var a3 = atomicUInt64.load(memoryOrder: DefaultMemoryOrder)
    var a4 = atomicUInt64.compareAndSwap(a1, 2, successOrder: DefaultMemoryOrder, failureOrder: DefaultMemoryOrder)
    if (a1 != 2) {
        return 1
    }
    if (a2 == a3) {
        return 2
    }
    if (a4) {
        return 3
    }
    return 0
}

main(): UInt64 {
    var ret: UInt64 = 0

    ret = testOperation1()
    if (ret != 0) {
        return ret
    }

    ret = testOperation2()
    if (ret != 0) {
        return ret + 10
    }

    ret = testFunction1()
    if (ret != 0) {
        return ret + 20
    }

    ret = testFunction2()
    if (ret != 0) {
        return ret + 30
    }
    return 0
}
