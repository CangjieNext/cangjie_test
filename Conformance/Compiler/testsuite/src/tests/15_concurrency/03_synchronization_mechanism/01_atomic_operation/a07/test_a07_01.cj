/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_01_a07_01

  @Level:         1
  @Assertion:    15.3.1(7) • For a reference type, only basic read, write and
                 exchange operations are provided, no arithmetic operations
                 are provided:
         –  load:  read
         –  store:  write
         –  swap:  exchange
         –  compareAndSwap:  compare and exchange

    class AtomicReference<T> where T <: Object {
         ... ...
         init(val: T)
        public func load(): T
        public func store(val: T): Unit
        public func swap(val: T): T
        public func compareAndSwap(old: T, new: T): Bool
    }

  @Description:  Checks that AtomicReference contains all necessary operations

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../helper.cj

*/

import std.sync.*  // Multithreading
import utils.assert.Assert

main(): Int64 {
    let initVal = MyClass(156789)
    let newVal = MyClass(-98342)
    let atom = AtomicReference<MyClass>(initVal)

    Assert.equals(initVal, atom.load())
    Assert.isTrue(atom.store(newVal) is Unit)

    Assert.equals(newVal, atom.swap(initVal))

    Assert.isFalse(atom.compareAndSwap(newVal, newVal))
    Assert.isTrue(atom.compareAndSwap(initVal, newVal))

    Assert.equals(newVal, atom.load())

    return 0
}
