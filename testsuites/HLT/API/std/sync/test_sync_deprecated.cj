/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan enum 'MemoryOrder' is deprecated.
// ASSERT: scan variable 'DefaultMemoryOrder' is deprecated.
// ASSERT: scan function 'compareAndSwap' is deprecated. Use `public func compareAndSwap(old: Bool, new: Bool): Bool` instead.
// ASSERT: scan function 'load' is deprecated. Use `public func load(): Bool` instead.
// ASSERT: scan function 'store' is deprecated. Use `public func store(val: Bool): Unit` instead.
// ASSERT: scan function 'swap' is deprecated. Use `public func swap(val: Bool): Bool` instead.

// ASSERT: scan function 'compareAndSwap' is deprecated. Use `public func compareAndSwap(old: Int16, new: Int16): Bool` instead.
// ASSERT: scan function 'load' is deprecated. Use `public func load(): Int16` instead.
// ASSERT: scan function 'store' is deprecated. Use `public func store(val: Int16): Unit` instead.
// ASSERT: scan function 'swap' is deprecated. Use `public func swap(val: Int16): Int16` instead.
// ASSERT: scan function 'fetchAdd' is deprecated. Use `public func fetchAdd(val: Int16): Int16` instead.
// ASSERT: scan function 'fetchAnd' is deprecated. Use `public func fetchAnd(val: Int16): Int16` instead.
// ASSERT: scan function 'fetchOr' is deprecated. Use `public func fetchOr(val: Int16): Int16` instead.
// ASSERT: scan function 'fetchSub' is deprecated. Use `public func fetchSub(val: Int16): Int16` instead.
// ASSERT: scan function 'fetchXor' is deprecated. Use `public func fetchXor(val: Int16): Int16` instead.

// ASSERT: scan function 'compareAndSwap' is deprecated. Use `public func compareAndSwap(old: Int32, new: Int32): Bool` instead.
// ASSERT: scan function 'load' is deprecated. Use `public func load(): Int32` instead.
// ASSERT: scan function 'store' is deprecated. Use `public func store(val: Int32): Unit` instead.
// ASSERT: scan function 'swap' is deprecated. Use `public func swap(val: Int32): Int32` instead.
// ASSERT: scan function 'fetchAdd' is deprecated. Use `public func fetchAdd(val: Int32): Int32` instead.
// ASSERT: scan function 'fetchAnd' is deprecated. Use `public func fetchAnd(val: Int32): Int32` instead.
// ASSERT: scan function 'fetchOr' is deprecated. Use `public func fetchOr(val: Int32): Int32` instead.
// ASSERT: scan function 'fetchSub' is deprecated. Use `public func fetchSub(val: Int32): Int32` instead.
// ASSERT: scan function 'fetchXor' is deprecated. Use `public func fetchXor(val: Int32): Int32` instead.

// ASSERT: scan function 'compareAndSwap' is deprecated. Use `public func compareAndSwap(old: Int64, new: Int64): Bool` instead.
// ASSERT: scan function 'load' is deprecated. Use `public func load(): Int64` instead.
// ASSERT: scan function 'store' is deprecated. Use `public func store(val: Int64): Unit` instead.
// ASSERT: scan function 'swap' is deprecated. Use `public func swap(val: Int64): Int64` instead.
// ASSERT: scan function 'fetchAdd' is deprecated. Use `public func fetchAdd(val: Int64): Int64` instead.
// ASSERT: scan function 'fetchAnd' is deprecated. Use `public func fetchAnd(val: Int64): Int64` instead.
// ASSERT: scan function 'fetchOr' is deprecated. Use `public func fetchOr(val: Int64): Int64` instead.
// ASSERT: scan function 'fetchSub' is deprecated. Use `public func fetchSub(val: Int64): Int64` instead.
// ASSERT: scan function 'fetchXor' is deprecated. Use `public func fetchXor(val: Int64): Int64` instead.

// ASSERT: scan function 'compareAndSwap' is deprecated. Use `public func compareAndSwap(old: Int8, new: Int8): Bool` instead.
// ASSERT: scan function 'load' is deprecated. Use `public func load(): Int8` instead.
// ASSERT: scan function 'store' is deprecated. Use `public func store(val: Int8): Unit` instead.
// ASSERT: scan function 'swap' is deprecated. Use `public func swap(val: Int8): Int8` instead.
// ASSERT: scan function 'fetchAdd' is deprecated. Use `public func fetchAdd(val: Int8): Int8` instead.
// ASSERT: scan function 'fetchAnd' is deprecated. Use `public func fetchAnd(val: Int8): Int8` instead.
// ASSERT: scan function 'fetchOr' is deprecated. Use `public func fetchOr(val: Int8): Int8` instead.
// ASSERT: scan function 'fetchSub' is deprecated. Use `public func fetchSub(val: Int8): Int8` instead.
// ASSERT: scan function 'fetchXor' is deprecated. Use `public func fetchXor(val: Int8): Int8` instead.

// ASSERT: scan function 'compareAndSwap' is deprecated. Use `public func compareAndSwap(old: UInt16, new: UInt16): Bool` instead.
// ASSERT: scan function 'load' is deprecated. Use `public func load(): UInt16` instead.
// ASSERT: scan function 'store' is deprecated. Use `public func store(val: UInt16): Unit` instead.
// ASSERT: scan function 'swap' is deprecated. Use `public func swap(val: UInt16): UInt16` instead.
// ASSERT: scan function 'fetchAdd' is deprecated. Use `public func fetchAdd(val: UInt16): UInt16` instead.
// ASSERT: scan function 'fetchAnd' is deprecated. Use `public func fetchAnd(val: UInt16): UInt16` instead.
// ASSERT: scan function 'fetchOr' is deprecated. Use `public func fetchOr(val: UInt16): UInt16` instead.
// ASSERT: scan function 'fetchSub' is deprecated. Use `public func fetchSub(val: UInt16): UInt16` instead.
// ASSERT: scan function 'fetchXor' is deprecated. Use `public func fetchXor(val: UInt16): UInt16` instead.

// ASSERT: scan function 'compareAndSwap' is deprecated. Use `public func compareAndSwap(old: UInt32, new: UInt32): Bool` instead.
// ASSERT: scan function 'load' is deprecated. Use `public func load(): UInt32` instead.
// ASSERT: scan function 'store' is deprecated. Use `public func store(val: UInt32): Unit` instead.
// ASSERT: scan function 'swap' is deprecated. Use `public func swap(val: UInt32): UInt32` instead.
// ASSERT: scan function 'fetchAdd' is deprecated. Use `public func fetchAdd(val: UInt32): UInt32` instead.
// ASSERT: scan function 'fetchAnd' is deprecated. Use `public func fetchAnd(val: UInt32): UInt32` instead.
// ASSERT: scan function 'fetchOr' is deprecated. Use `public func fetchOr(val: UInt32): UInt32` instead.
// ASSERT: scan function 'fetchSub' is deprecated. Use `public func fetchSub(val: UInt32): UInt32` instead.
// ASSERT: scan function 'fetchXor' is deprecated. Use `public func fetchXor(val: UInt32): UInt32` instead.

// ASSERT: scan function 'compareAndSwap' is deprecated. Use `public func compareAndSwap(old: UInt64, new: UInt64): Bool` instead.
// ASSERT: scan function 'load' is deprecated. Use `public func load(): UInt64` instead.
// ASSERT: scan function 'store' is deprecated. Use `public func store(val: UInt64): Unit` instead.
// ASSERT: scan function 'swap' is deprecated. Use `public func swap(val: UInt64): UInt64` instead.
// ASSERT: scan function 'fetchAdd' is deprecated. Use `public func fetchAdd(val: UInt64): UInt64` instead.
// ASSERT: scan function 'fetchAnd' is deprecated. Use `public func fetchAnd(val: UInt64): UInt64` instead.
// ASSERT: scan function 'fetchOr' is deprecated. Use `public func fetchOr(val: UInt64): UInt64` instead.
// ASSERT: scan function 'fetchSub' is deprecated. Use `public func fetchSub(val: UInt64): UInt64` instead.
// ASSERT: scan function 'fetchXor' is deprecated. Use `public func fetchXor(val: UInt64): UInt64` instead.

// ASSERT: scan function 'compareAndSwap' is deprecated. Use `public func compareAndSwap(old: UInt8, new: UInt8): Bool` instead.
// ASSERT: scan function 'load' is deprecated. Use `public func load(): UInt8` instead.
// ASSERT: scan function 'store' is deprecated. Use `public func store(val: UInt8): Unit` instead.
// ASSERT: scan function 'swap' is deprecated. Use `public func swap(val: UInt8): UInt8` instead.
// ASSERT: scan function 'fetchAdd' is deprecated. Use `public func fetchAdd(val: UInt8): UInt8` instead.
// ASSERT: scan function 'fetchAnd' is deprecated. Use `public func fetchAnd(val: UInt8): UInt8` instead.
// ASSERT: scan function 'fetchOr' is deprecated. Use `public func fetchOr(val: UInt8): UInt8` instead.
// ASSERT: scan function 'fetchSub' is deprecated. Use `public func fetchSub(val: UInt8): UInt8` instead.
// ASSERT: scan function 'fetchXor' is deprecated. Use `public func fetchXor(val: UInt8): UInt8` instead.

// ASSERT: scan function 'compareAndSwap' is deprecated. Use `public func compareAndSwap(old: Option<T>, new: Option<T>): Bool` instead.
// ASSERT: scan function 'load' is deprecated. Use `public func load(): Bool` instead.
// ASSERT: scan function 'store' is deprecated. Use `public func store(val: Option<T>): Unit` instead.
// ASSERT: scan function 'swap' is deprecated. Use `public func swap(val: Option<T>): Option<T>` instead.

// ASSERT: scan function 'compareAndSwap' is deprecated. Use `public func compareAndSwap(old: T, new: T): Bool` instead.
// ASSERT: scan function 'load' is deprecated. Use `public func load(): Bool` instead.
// ASSERT: scan function 'store' is deprecated. Use `public func store(val: T): Unit` instead.
// ASSERT: scan function 'swap' is deprecated. Use `public func swap(val: T): T` instead.

import std.database.sql.*
import std.io.*
import std.time.*
import std.math.numeric.*
import std.sync.*

class A {
    static var a = AtomicInt64(0)
    var b = AtomicInt64(0)
    init() {
        a.fetchAdd(1)
    }
    func test() {
        this.b.fetchAdd(1)
    }
}

var a = A()

main(): Unit {
    MemoryOrder.SeqCst
    DefaultMemoryOrder

    let atomicBool = AtomicBool(true)
    atomicBool.compareAndSwap(true, true, successOrder: MemoryOrder.SeqCst, failureOrder: MemoryOrder.SeqCst)
    atomicBool.compareAndSwap(true, true)
    atomicBool.load(memoryOrder: MemoryOrder.SeqCst)
    atomicBool.load()
    atomicBool.store(true, memoryOrder: MemoryOrder.SeqCst)
    atomicBool.store(true)
    atomicBool.swap(true, memoryOrder: MemoryOrder.SeqCst)
    atomicBool.swap(true)

    let atomicInt16 = AtomicInt16(0)
    atomicInt16.compareAndSwap(0, 1, successOrder: MemoryOrder.SeqCst, failureOrder: MemoryOrder.SeqCst)
    atomicInt16.compareAndSwap(0, 1)
    atomicInt16.load(memoryOrder: MemoryOrder.SeqCst)
    atomicInt16.load()
    atomicInt16.store(1, memoryOrder: MemoryOrder.SeqCst)
    atomicInt16.store(1)
    atomicInt16.swap(1, memoryOrder: MemoryOrder.SeqCst)
    atomicInt16.swap(1)
    atomicInt16.fetchAdd(1, memoryOrder: MemoryOrder.SeqCst)
    atomicInt16.fetchAdd(1)
    atomicInt16.fetchAnd(1, memoryOrder: MemoryOrder.SeqCst)
    atomicInt16.fetchAnd(1)
    atomicInt16.fetchOr(1, memoryOrder: MemoryOrder.SeqCst)
    atomicInt16.fetchOr(1)
    atomicInt16.fetchSub(1, memoryOrder: MemoryOrder.SeqCst)
    atomicInt16.fetchSub(1)
    atomicInt16.fetchXor(1, memoryOrder: MemoryOrder.SeqCst)
    atomicInt16.fetchXor(1)

    let atomicInt32 = AtomicInt32(0)
    atomicInt32.compareAndSwap(0, 1, successOrder: MemoryOrder.SeqCst, failureOrder: MemoryOrder.SeqCst)
    atomicInt32.compareAndSwap(0, 1)
    atomicInt32.load(memoryOrder: MemoryOrder.SeqCst)
    atomicInt32.load()
    atomicInt32.store(1, memoryOrder: MemoryOrder.SeqCst)
    atomicInt32.store(1)
    atomicInt32.swap(1, memoryOrder: MemoryOrder.SeqCst)
    atomicInt32.swap(1)
    atomicInt32.fetchAdd(1, memoryOrder: MemoryOrder.SeqCst)
    atomicInt32.fetchAdd(1)
    atomicInt32.fetchAnd(1, memoryOrder: MemoryOrder.SeqCst)
    atomicInt32.fetchAnd(1)
    atomicInt32.fetchOr(1, memoryOrder: MemoryOrder.SeqCst)
    atomicInt32.fetchOr(1)
    atomicInt32.fetchSub(1, memoryOrder: MemoryOrder.SeqCst)
    atomicInt32.fetchSub(1)
    atomicInt32.fetchXor(1, memoryOrder: MemoryOrder.SeqCst)
    atomicInt32.fetchXor(1)

    let atomicInt64 = AtomicInt64(0)
    atomicInt64.compareAndSwap(0, 1, successOrder: MemoryOrder.SeqCst, failureOrder: MemoryOrder.SeqCst)
    atomicInt64.compareAndSwap(0, 1)
    atomicInt64.load(memoryOrder: MemoryOrder.SeqCst)
    atomicInt64.load()
    atomicInt64.store(1, memoryOrder: MemoryOrder.SeqCst)
    atomicInt64.store(1)
    atomicInt64.swap(1, memoryOrder: MemoryOrder.SeqCst)
    atomicInt64.swap(1)
    atomicInt64.fetchAdd(1, memoryOrder: MemoryOrder.SeqCst)
    atomicInt64.fetchAdd(1)
    atomicInt64.fetchAnd(1, memoryOrder: MemoryOrder.SeqCst)
    atomicInt64.fetchAnd(1)
    atomicInt64.fetchOr(1, memoryOrder: MemoryOrder.SeqCst)
    atomicInt64.fetchOr(1)
    atomicInt64.fetchSub(1, memoryOrder: MemoryOrder.SeqCst)
    atomicInt64.fetchSub(1)
    atomicInt64.fetchXor(1, memoryOrder: MemoryOrder.SeqCst)
    atomicInt64.fetchXor(1)

    let atomicInt8 = AtomicInt8(0)
    atomicInt8.compareAndSwap(0, 1, successOrder: MemoryOrder.SeqCst, failureOrder: MemoryOrder.SeqCst)
    atomicInt8.compareAndSwap(0, 1)
    atomicInt8.load(memoryOrder: MemoryOrder.SeqCst)
    atomicInt8.load()
    atomicInt8.store(1, memoryOrder: MemoryOrder.SeqCst)
    atomicInt8.store(1)
    atomicInt8.swap(1, memoryOrder: MemoryOrder.SeqCst)
    atomicInt8.swap(1)
    atomicInt8.fetchAdd(1, memoryOrder: MemoryOrder.SeqCst)
    atomicInt8.fetchAdd(1)
    atomicInt8.fetchAnd(1, memoryOrder: MemoryOrder.SeqCst)
    atomicInt8.fetchAnd(1)
    atomicInt8.fetchOr(1, memoryOrder: MemoryOrder.SeqCst)
    atomicInt8.fetchOr(1)
    atomicInt8.fetchSub(1, memoryOrder: MemoryOrder.SeqCst)
    atomicInt8.fetchSub(1)
    atomicInt8.fetchXor(1, memoryOrder: MemoryOrder.SeqCst)
    atomicInt8.fetchXor(1)

    let atomicUInt16 = AtomicUInt16(0)
    atomicUInt16.compareAndSwap(0, 1, successOrder: MemoryOrder.SeqCst, failureOrder: MemoryOrder.SeqCst)
    atomicUInt16.compareAndSwap(0, 1)
    atomicUInt16.load(memoryOrder: MemoryOrder.SeqCst)
    atomicUInt16.load()
    atomicUInt16.store(1, memoryOrder: MemoryOrder.SeqCst)
    atomicUInt16.store(1)
    atomicUInt16.swap(1, memoryOrder: MemoryOrder.SeqCst)
    atomicUInt16.swap(1)
    atomicUInt16.fetchAdd(1, memoryOrder: MemoryOrder.SeqCst)
    atomicUInt16.fetchAdd(1)
    atomicUInt16.fetchAnd(1, memoryOrder: MemoryOrder.SeqCst)
    atomicUInt16.fetchAnd(1)
    atomicUInt16.fetchOr(1, memoryOrder: MemoryOrder.SeqCst)
    atomicUInt16.fetchOr(1)
    atomicUInt16.fetchSub(1, memoryOrder: MemoryOrder.SeqCst)
    atomicUInt16.fetchSub(1)
    atomicUInt16.fetchXor(1, memoryOrder: MemoryOrder.SeqCst)
    atomicUInt16.fetchXor(1)

    let atomicUInt32 = AtomicUInt32(0)
    atomicUInt32.compareAndSwap(0, 1, successOrder: MemoryOrder.SeqCst, failureOrder: MemoryOrder.SeqCst)
    atomicUInt32.compareAndSwap(0, 1)
    atomicUInt32.load(memoryOrder: MemoryOrder.SeqCst)
    atomicUInt32.load()
    atomicUInt32.store(1, memoryOrder: MemoryOrder.SeqCst)
    atomicUInt32.store(1)
    atomicUInt32.swap(1, memoryOrder: MemoryOrder.SeqCst)
    atomicUInt32.swap(1)
    atomicUInt32.fetchAdd(1, memoryOrder: MemoryOrder.SeqCst)
    atomicUInt32.fetchAdd(1)
    atomicUInt32.fetchAnd(1, memoryOrder: MemoryOrder.SeqCst)
    atomicUInt32.fetchAnd(1)
    atomicUInt32.fetchOr(1, memoryOrder: MemoryOrder.SeqCst)
    atomicUInt32.fetchOr(1)
    atomicUInt32.fetchSub(1, memoryOrder: MemoryOrder.SeqCst)
    atomicUInt32.fetchSub(1)
    atomicUInt32.fetchXor(1, memoryOrder: MemoryOrder.SeqCst)
    atomicUInt32.fetchXor(1)

    let atomicUInt64 = AtomicUInt64(0)
    atomicUInt64.compareAndSwap(0, 1, successOrder: MemoryOrder.SeqCst, failureOrder: MemoryOrder.SeqCst)
    atomicUInt64.compareAndSwap(0, 1)
    atomicUInt64.load(memoryOrder: MemoryOrder.SeqCst)
    atomicUInt64.load()
    atomicUInt64.store(1, memoryOrder: MemoryOrder.SeqCst)
    atomicUInt64.store(1)
    atomicUInt64.swap(1, memoryOrder: MemoryOrder.SeqCst)
    atomicUInt64.swap(1)
    atomicUInt64.fetchAdd(1, memoryOrder: MemoryOrder.SeqCst)
    atomicUInt64.fetchAdd(1)
    atomicUInt64.fetchAnd(1, memoryOrder: MemoryOrder.SeqCst)
    atomicUInt64.fetchAnd(1)
    atomicUInt64.fetchOr(1, memoryOrder: MemoryOrder.SeqCst)
    atomicUInt64.fetchOr(1)
    atomicUInt64.fetchSub(1, memoryOrder: MemoryOrder.SeqCst)
    atomicUInt64.fetchSub(1)
    atomicUInt64.fetchXor(1, memoryOrder: MemoryOrder.SeqCst)
    atomicUInt64.fetchXor(1)

    let atomicUInt8 = AtomicUInt8(0)
    atomicUInt8.compareAndSwap(0, 1, successOrder: MemoryOrder.SeqCst, failureOrder: MemoryOrder.SeqCst)
    atomicUInt8.compareAndSwap(0, 1)
    atomicUInt8.load(memoryOrder: MemoryOrder.SeqCst)
    atomicUInt8.load()
    atomicUInt8.store(1, memoryOrder: MemoryOrder.SeqCst)
    atomicUInt8.store(1)
    atomicUInt8.swap(1, memoryOrder: MemoryOrder.SeqCst)
    atomicUInt8.swap(1)
    atomicUInt8.fetchAdd(1, memoryOrder: MemoryOrder.SeqCst)
    atomicUInt8.fetchAdd(1)
    atomicUInt8.fetchAnd(1, memoryOrder: MemoryOrder.SeqCst)
    atomicUInt8.fetchAnd(1)
    atomicUInt8.fetchOr(1, memoryOrder: MemoryOrder.SeqCst)
    atomicUInt8.fetchOr(1)
    atomicUInt8.fetchSub(1, memoryOrder: MemoryOrder.SeqCst)
    atomicUInt8.fetchSub(1)
    atomicUInt8.fetchXor(1, memoryOrder: MemoryOrder.SeqCst)
    atomicUInt8.fetchXor(1)

    let atomicOptionRef = AtomicOptionReference<A>(Some(a))
    atomicOptionRef.compareAndSwap(Some(a), Some(a), successOrder: MemoryOrder.SeqCst, failureOrder: MemoryOrder.SeqCst)
    atomicOptionRef.compareAndSwap(Some(a), Some(a))
    atomicOptionRef.load(memoryOrder: MemoryOrder.SeqCst)
    atomicOptionRef.load()
    atomicOptionRef.store(Some(a), memoryOrder: MemoryOrder.SeqCst)
    atomicOptionRef.store(Some(a))
    atomicOptionRef.swap(Some(a), memoryOrder: MemoryOrder.SeqCst)
    atomicOptionRef.swap(Some(a))

    let atomicRef = AtomicReference<A>((a))
    atomicRef.compareAndSwap((a), (a), successOrder: MemoryOrder.SeqCst, failureOrder: MemoryOrder.SeqCst)
    atomicRef.compareAndSwap((a), (a))
    atomicRef.load(memoryOrder: MemoryOrder.SeqCst)
    atomicRef.load()
    atomicRef.store((a), memoryOrder: MemoryOrder.SeqCst)
    atomicRef.store((a))
    atomicRef.swap((a), memoryOrder: MemoryOrder.SeqCst)
    atomicRef.swap((a))
}
