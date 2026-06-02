/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_01_a05_08

  @Level:         1
  @Assertion:    15.3.1(5) • For integer types, we provide basic read, write,
                 exchange, and arithmetic operations:
    –  load:            read
    –  store:           write
    –  swap:            exchange
    –  compareAndSwap:  compare and exchange
    –  fetchAdd:        add to
    –  fetchSub:        subtract from
    –  fetchAnd:        apply bitwise AND
    –  fetchOr:         apply bitwise OR
    –  fetchXor:        apply bitwise XOR

    // Signed Integers.
    class AtomicInt8 {
         ... ...
         init(val: Int8)
         public func load(): Int8
         public func store(val: Int8): Unit
         public func swap(val: Int8): Int8
         public func compareAndSwap(old: Int8, new: Int8): Bool
         public func fetchAdd(val: Int8): Int8
         public func fetchSub(val: Int8): Int8
         public func fetchAnd(val: Int8): Int8
         public func fetchOr(val: Int8): Int8
         public func fetchXor(val: Int8): Int8
         ... ... // Operator overloading, etc.
    }

    class AtomicInt16 {...}
    class AtomicInt32 {...}
    class AtomicInt64 {...}
    // Unsigned Integers.
    class AtomicUInt8     {...}
    class AtomicUInt16 {...}
    class AtomicUInt32 {...}
    class AtomicUInt64 {...}

  @Description:  Checks that AtomicUInt64 contains all necessary operations

  @Mode:         run
  @Negative:     no
  @Structure:    single

*/

import std.sync.*  // Multithreading
import utils.assert.Assert

main(): Int64 {
    let initVal = UInt64(666666)
    let newVal = UInt64(999999)
    let atom = AtomicUInt64(initVal)

    Assert.equals(initVal, atom.load())
    Assert.isTrue(atom.store(newVal) is Unit)

    Assert.equals(newVal, atom.swap(initVal))

    Assert.isFalse(atom.compareAndSwap(newVal, newVal))
    Assert.isTrue(atom.compareAndSwap(initVal, newVal))

    Assert.equals(newVal, atom.fetchAdd(initVal))
    Assert.equals(newVal + initVal, atom.fetchSub(newVal))

    Assert.equals(initVal, atom.fetchAnd(0b111111u64))
    Assert.equals(42, atom.fetchOr(0b100100100100))

    Assert.equals(2350, atom.fetchXor(0b100100100100))

    Assert.equals(10, atom.load())

    return 0
}
