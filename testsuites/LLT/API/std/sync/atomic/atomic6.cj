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
 * Test description: Test the funcs of AtomicUInt32
 * Test API:
 *          public init(val: UInt32)
 *          public init(val: UInt32, memoryOrder: MemoryOrder)
 *          public func load(): UInt32
 *          public func load(memoryOrder: MemoryOrder): UInt32
 *          public func store(val: UInt32): Unit
 *          public func store(val: UInt32, memoryOrder: MemoryOrder): Unit
 *          public func swap(val: UInt32): UInt32
 *          public func swap(val: UInt32, memoryOrder: MemoryOrder): UInt32
 *          public func compareAndSwap(old: UInt32, new: UInt32): Bool
 *          public func compareAndSwap(old: UInt32, new: UInt32, memoryOrder1: MemoryOrder, memoryOrder2: MemoryOrder): Bool
 *          public func fetchAdd(val: UInt32): UInt32
 *          public func fetchAdd(val: UInt32, memoryOrder: MemoryOrder): UInt32
 *          public func fetchSub(val: UInt32): UInt32
 *          public func fetchSub(val: UInt32, memoryOrder: MemoryOrder): UInt32
 *          public func fetchAnd(val: UInt32): UInt32
 *          public func fetchAnd(val: UInt32, memoryOrder: MemoryOrder): UInt32
 *          public func fetchOr(val: UInt32): UInt32
 *          public func fetchOr(val: UInt32, memoryOrder: MemoryOrder): UInt32
 *          public func fetchXor(val: UInt32): UInt32
 *          public func fetchXor(val: UInt32, memoryOrder: MemoryOrder): UInt32
 */

internal import std.sync.*

func testOperation1(): UInt32 {
    var atomicUInt32 = AtomicUInt32(1)
    var a1 = atomicUInt32.fetchAdd(1)
    var a2 = atomicUInt32.fetchSub(1)
    var a3 = atomicUInt32.fetchAnd(1)
    var a4 = atomicUInt32.fetchOr(0)
    var a5 = atomicUInt32.fetchXor(0)
    var a6 = atomicUInt32.load()
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

func testOperation2(): UInt32 {
    var atomicUInt32 = AtomicUInt32(1)
    var a1 = atomicUInt32.fetchAdd(1, memoryOrder: DefaultMemoryOrder)
    var a2 = atomicUInt32.fetchSub(1, memoryOrder: DefaultMemoryOrder)
    var a3 = atomicUInt32.fetchAnd(1, memoryOrder: DefaultMemoryOrder)
    var a4 = atomicUInt32.fetchOr(0, memoryOrder: DefaultMemoryOrder)
    var a5 = atomicUInt32.fetchXor(0, memoryOrder: DefaultMemoryOrder)
    var a6 = atomicUInt32.load(memoryOrder: DefaultMemoryOrder)
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

func testFunction1(): UInt32 {
    var atomicUInt32 = AtomicUInt32(1)
    atomicUInt32.store(2)
    var a1 = atomicUInt32.load()
    var a2 = atomicUInt32.swap(1)
    var a3 = atomicUInt32.load()
    var a4 = atomicUInt32.compareAndSwap(a1, 2)
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

func testFunction2(): UInt32 {
    var atomicUInt32 = AtomicUInt32(1)
    atomicUInt32.store(2, memoryOrder: DefaultMemoryOrder)
    var a1 = atomicUInt32.load(memoryOrder: DefaultMemoryOrder)
    var a2 = atomicUInt32.swap(1, memoryOrder: DefaultMemoryOrder)
    var a3 = atomicUInt32.load(memoryOrder: DefaultMemoryOrder)
    var a4 = atomicUInt32.compareAndSwap(a1, 2, successOrder: DefaultMemoryOrder, failureOrder: DefaultMemoryOrder)
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

main(): UInt32 {
    var ret: UInt32 = 0

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
