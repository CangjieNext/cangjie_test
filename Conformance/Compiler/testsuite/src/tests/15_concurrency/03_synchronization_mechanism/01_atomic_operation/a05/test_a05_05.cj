/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_01_a05_05

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

  @Description:  Checks that AtomicUInt8 contains all necessary operations

  @Mode:         run
  @Negative:     no
  @Structure:    single

*/

import std.sync.*  // Multithreading
import utils.assert.Assert

main(): Int64 {
    let initVal = UInt8(6)
    let newVal = UInt8(9)
    let atom = AtomicUInt8(initVal)

    Assert.equals(initVal, atom.load())
    Assert.isTrue(atom.store(newVal) is Unit)

    Assert.equals(newVal, atom.swap(initVal))

    Assert.isFalse(atom.compareAndSwap(newVal, newVal))
    Assert.isTrue(atom.compareAndSwap(initVal, newVal))

    Assert.equals(newVal, atom.fetchAdd(initVal))
    Assert.equals(newVal + initVal, atom.fetchSub(newVal))

    Assert.equals(initVal, atom.fetchAnd(0b11u8))
    Assert.equals(2, atom.fetchOr(0b100100))

    Assert.equals(38, atom.fetchXor(0b100100))

    Assert.equals(2, atom.load())

    return 0
}
