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
 * Test description: Test the funcs of AtomicUInt16
 * Test API:
 *          public init(val: UInt16)
 *          public init(val: UInt16, memoryOrder: MemoryOrder)
 *          public func load(): UInt16
 *          public func load(memoryOrder: MemoryOrder): UInt16
 *          public func store(val: UInt16): Unit
 *          public func store(val: UInt16, memoryOrder: MemoryOrder): Unit
 *          public func swap(val: UInt16): UInt16
 *          public func swap(val: UInt16, memoryOrder: MemoryOrder): UInt16
 *          public func compareAndSwap(old: UInt16, new: UInt16): Bool
 *          public func compareAndSwap(old: UInt16, new: UInt16, memoryOrder1: MemoryOrder, memoryOrder2: MemoryOrder): Bool
 *          public func fetchAdd(val: UInt16): UInt16
 *          public func fetchAdd(val: UInt16, memoryOrder: MemoryOrder): UInt16
 *          public func fetchSub(val: UInt16): UInt16
 *          public func fetchSub(val: UInt16, memoryOrder: MemoryOrder): UInt16
 *          public func fetchAnd(val: UInt16): UInt16
 *          public func fetchAnd(val: UInt16, memoryOrder: MemoryOrder): UInt16
 *          public func fetchOr(val: UInt16): UInt16
 *          public func fetchOr(val: UInt16, memoryOrder: MemoryOrder): UInt16
 *          public func fetchXor(val: UInt16): UInt16
 *          public func fetchXor(val: UInt16, memoryOrder: MemoryOrder): UInt16
 */

internal import std.sync.*

func testOperation1(): UInt16 {
    var atomicUInt16 = AtomicUInt16(1)
    var a1 = atomicUInt16.fetchAdd(1)
    var a2 = atomicUInt16.fetchSub(1)
    var a3 = atomicUInt16.fetchAnd(1)
    var a4 = atomicUInt16.fetchOr(0)
    var a5 = atomicUInt16.fetchXor(0)
    var a6 = atomicUInt16.load()
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

func testOperation2(): UInt16 {
    var atomicUInt16 = AtomicUInt16(1)
    var a1 = atomicUInt16.fetchAdd(1, memoryOrder: DefaultMemoryOrder)
    var a2 = atomicUInt16.fetchSub(1, memoryOrder: DefaultMemoryOrder)
    var a3 = atomicUInt16.fetchAnd(1, memoryOrder: DefaultMemoryOrder)
    var a4 = atomicUInt16.fetchOr(0, memoryOrder: DefaultMemoryOrder)
    var a5 = atomicUInt16.fetchXor(0, memoryOrder: DefaultMemoryOrder)
    var a6 = atomicUInt16.load(memoryOrder: DefaultMemoryOrder)
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

func testFunction1(): UInt16 {
    var atomicUInt16 = AtomicUInt16(1)
    atomicUInt16.store(2)
    var a1 = atomicUInt16.load()
    var a2 = atomicUInt16.swap(1)
    var a3 = atomicUInt16.load()
    var a4 = atomicUInt16.compareAndSwap(a1, 2)
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

func testFunction2(): UInt16 {
    var atomicUInt16 = AtomicUInt16(1)
    atomicUInt16.store(2, memoryOrder: DefaultMemoryOrder)
    var a1 = atomicUInt16.load(memoryOrder: DefaultMemoryOrder)
    var a2 = atomicUInt16.swap(1, memoryOrder: DefaultMemoryOrder)
    var a3 = atomicUInt16.load(memoryOrder: DefaultMemoryOrder)
    var a4 = atomicUInt16.compareAndSwap(a1, 2, successOrder: DefaultMemoryOrder, failureOrder: DefaultMemoryOrder)
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

main(): UInt16 {
    var ret: UInt16 = 0

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
