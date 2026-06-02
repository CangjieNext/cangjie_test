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
 * Test description: Test the funcs of AtomicInt8
 * Test API:
 *          public init(val: Bool)
 *          public init(val: Bool, memoryOrder: MemoryOrder)
 *          public func load(): Bool
 *          public func load(memoryOrder: MemoryOrder): Bool
 *          public func store(val: Bool): Unit
 *          public func store(val: Bool, memoryOrder: MemoryOrder): Unit
 *          public func swap(val: Bool): Bool
 *          public func swap(val: Bool, memoryOrder: MemoryOrder): Bool
 *          public func compareAndSwap(old: Bool, new: Bool): Bool
 *          public func compareAndSwap(old: Bool, new: Bool, memoryOrder1: MemoryOrder, memoryOrder2: MemoryOrder): Bool
 */

internal import std.sync.*

func test1(): Int8 {
    var atomicBool = AtomicBool(true)
    var a1 = atomicBool.load()
    atomicBool.swap(false)
    var a2 = atomicBool.load()
    atomicBool.compareAndSwap(false, true)
    var a3 = atomicBool.load()
    atomicBool.store(false)
    var a4 = atomicBool.load()
    if (a1 != true) {
        return 1
    }
    if (a2 != false) {
        return 2
    }
    if (a3 != true) {
        return 3
    }
    if (a4 != false) {
        return 4
    }
    return 0
}

func test2(): Int8 {
    var atomicBool = AtomicBool(true)
    var a1 = atomicBool.load(memoryOrder: DefaultMemoryOrder)
    atomicBool.swap(false, memoryOrder: DefaultMemoryOrder)
    var a2 = atomicBool.load(memoryOrder: DefaultMemoryOrder)
    atomicBool.compareAndSwap(false, true, successOrder: DefaultMemoryOrder, failureOrder: DefaultMemoryOrder)
    var a3 = atomicBool.load(memoryOrder: DefaultMemoryOrder)
    atomicBool.store(false, memoryOrder: DefaultMemoryOrder)
    var a4 = atomicBool.load(memoryOrder: DefaultMemoryOrder)
    if (a1 != true) {
        return 1
    }
    if (a2 != false) {
        return 2
    }
    if (a3 != true) {
        return 3
    }
    if (a4 != false) {
        return 4
    }
    return 0
}

main(): Int8 {
    var ret: Int8 = 0

    ret = test1()
    if (ret != 0) {
        return ret
    }

    ret = test2()
    if (ret != 0) {
        return ret + 10
    }
    return 0
}
