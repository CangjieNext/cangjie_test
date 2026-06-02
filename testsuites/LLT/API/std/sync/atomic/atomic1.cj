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
 * Test description: Test the funcs of AtomicInt16
 * Test API:
 *          public init(val: Int16)
 *          public init(val: Int16, memoryOrder: MemoryOrder)
 *          public func load(): Int16
 *          public func load(memoryOrder: MemoryOrder): Int16
 *          public func store(val: Int16): Unit
 *          public func store(val: Int16, memoryOrder: MemoryOrder): Unit
 *          public func swap(val: Int16): Int16
 *          public func swap(val: Int16, memoryOrder: MemoryOrder): Int16
 *          public func compareAndSwap(old: Int16, new: Int16): Bool
 *          public func compareAndSwap(old: Int16, new: Int16, memoryOrder1: MemoryOrder, memoryOrder2: MemoryOrder): Bool
 *          public func fetchAdd(val: Int16): Int16
 *          public func fetchAdd(val: Int16, memoryOrder: MemoryOrder): Int16
 *          public func fetchSub(val: Int16): Int16
 *          public func fetchSub(val: Int16, memoryOrder: MemoryOrder): Int16
 *          public func fetchAnd(val: Int16): Int16
 *          public func fetchAnd(val: Int16, memoryOrder: MemoryOrder): Int16
 *          public func fetchOr(val: Int16): Int16
 *          public func fetchOr(val: Int16, memoryOrder: MemoryOrder): Int16
 *          public func fetchXor(val: Int16): Int16
 *          public func fetchXor(val: Int16, memoryOrder: MemoryOrder): Int16
 */

internal import std.sync.*

func testOperation1(): Int16 {
    var atomicInt16 = AtomicInt16(1)
    var a1 = atomicInt16.fetchAdd(1)
    var a2 = atomicInt16.fetchSub(1)
    var a3 = atomicInt16.fetchAnd(1)
    var a4 = atomicInt16.fetchOr(0)
    var a5 = atomicInt16.fetchXor(0)
    var a6 = atomicInt16.load()
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

func testOperation2(): Int16 {
    var atomicInt16 = AtomicInt16(1)
    var a1 = atomicInt16.fetchAdd(1, memoryOrder: DefaultMemoryOrder)
    var a2 = atomicInt16.fetchSub(1, memoryOrder: DefaultMemoryOrder)
    var a3 = atomicInt16.fetchAnd(1, memoryOrder: DefaultMemoryOrder)
    var a4 = atomicInt16.fetchOr(0, memoryOrder: DefaultMemoryOrder)
    var a5 = atomicInt16.fetchXor(0, memoryOrder: DefaultMemoryOrder)
    var a6 = atomicInt16.load(memoryOrder: DefaultMemoryOrder)
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

func testFunction1(): Int16 {
    var atomicInt16 = AtomicInt16(1)
    atomicInt16.store(2)
    var a1 = atomicInt16.load()
    var a2 = atomicInt16.swap(1)
    var a3 = atomicInt16.load()
    var a4 = atomicInt16.compareAndSwap(a1, 2)
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

func testFunction2(): Int16 {
    var atomicInt16 = AtomicInt16(1)
    atomicInt16.store(2, memoryOrder: DefaultMemoryOrder)
    var a1 = atomicInt16.load(memoryOrder: DefaultMemoryOrder)
    var a2 = atomicInt16.swap(1, memoryOrder: DefaultMemoryOrder)
    var a3 = atomicInt16.load(memoryOrder: DefaultMemoryOrder)
    var a4 = atomicInt16.compareAndSwap(a1, 2, successOrder: DefaultMemoryOrder, failureOrder: DefaultMemoryOrder)
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

main(): Int16 {
    var ret: Int16 = 0

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
