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
 * Test description: Test the funcs of AtomicInt32
 * Test API:
 *          public init(val: Int32)
 *          public init(val: Int32, memoryOrder: MemoryOrder)
 *          public func load(): Int32
 *          public func load(memoryOrder: MemoryOrder): Int32
 *          public func store(val: Int32): Unit
 *          public func store(val: Int32, memoryOrder: MemoryOrder): Unit
 *          public func swap(val: Int32): Int32
 *          public func swap(val: Int32, memoryOrder: MemoryOrder): Int32
 *          public func compareAndSwap(old: Int32, new: Int32): Bool
 *          public func compareAndSwap(old: Int32, new: Int32, memoryOrder1: MemoryOrder, memoryOrder2: MemoryOrder): Bool
 *          public func fetchAdd(val: Int32): Int32
 *          public func fetchAdd(val: Int32, memoryOrder: MemoryOrder): Int32
 *          public func fetchSub(val: Int32): Int32
 *          public func fetchSub(val: Int32, memoryOrder: MemoryOrder): Int32
 *          public func fetchAnd(val: Int32): Int32
 *          public func fetchAnd(val: Int32, memoryOrder: MemoryOrder): Int32
 *          public func fetchOr(val: Int32): Int32
 *          public func fetchOr(val: Int32, memoryOrder: MemoryOrder): Int32
 *          public func fetchXor(val: Int32): Int32
 *          public func fetchXor(val: Int32, memoryOrder: MemoryOrder): Int32
 */

internal import std.sync.*

func testOperation1(): Int32 {
    var atomicInt32 = AtomicInt32(1)
    var a1 = atomicInt32.fetchAdd(1)
    var a2 = atomicInt32.fetchSub(1)
    var a3 = atomicInt32.fetchAnd(1)
    var a4 = atomicInt32.fetchOr(0)
    var a5 = atomicInt32.fetchXor(0)
    var a6 = atomicInt32.load()
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

func testOperation2(): Int32 {
    var atomicInt32 = AtomicInt32(1)
    var a1 = atomicInt32.fetchAdd(1, memoryOrder: DefaultMemoryOrder)
    var a2 = atomicInt32.fetchSub(1, memoryOrder: DefaultMemoryOrder)
    var a3 = atomicInt32.fetchAnd(1, memoryOrder: DefaultMemoryOrder)
    var a4 = atomicInt32.fetchOr(0, memoryOrder: DefaultMemoryOrder)
    var a5 = atomicInt32.fetchXor(0, memoryOrder: DefaultMemoryOrder)
    var a6 = atomicInt32.load(memoryOrder: DefaultMemoryOrder)
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

func testFunction1(): Int32 {
    var atomicInt32 = AtomicInt32(1)
    atomicInt32.store(2)
    var a1 = atomicInt32.load()
    var a2 = atomicInt32.swap(1)
    var a3 = atomicInt32.load()
    var a4 = atomicInt32.compareAndSwap(a1, 2)
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

func testFunction2(): Int32 {
    var atomicInt32 = AtomicInt32(1)
    atomicInt32.store(2, memoryOrder: DefaultMemoryOrder)
    var a1 = atomicInt32.load(memoryOrder: DefaultMemoryOrder)
    var a2 = atomicInt32.swap(1, memoryOrder: DefaultMemoryOrder)
    var a3 = atomicInt32.load(memoryOrder: DefaultMemoryOrder)
    var a4 = atomicInt32.compareAndSwap(a1, 2, successOrder: DefaultMemoryOrder, failureOrder: DefaultMemoryOrder)
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

main(): Int32 {
    var ret: Int32 = 0

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
