/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_01_a06_01

  @Level:         1
  @Assertion:    15.3.1(6)
                 • For a boolean type, only basic read, write and
                 exchange operations are provided, and there are no arithmetic
                 operations provided:
         –  load:            read
         –  store:           write
         –  swap:            exchange
         –  compareAndSwap:  compare and exchange

    // Boolean.
    class AtomicBool {
         ... ...
        init(val: Bool)
        public func load(): Bool
        public func store(val: Bool): Unit
        public func swap(val: Bool): Bool
        public func compareAndSwap(old: Bool, new: Bool): Bool
         ... ... // Operator overloading, etc.
    }

  @Description:  Checks that AtomicBool contains all necessary operations

  @Mode:         run
  @Negative:     no
  @Structure:    single

*/

import std.sync.*  // Multithreading
import utils.assert.Assert

main(): Int64 {
    let initVal = true
    let newVal = false
    let atom = AtomicBool(initVal)

    Assert.equals(initVal, atom.load())
    Assert.isTrue(atom.store(newVal) is Unit)

    Assert.equals(newVal, atom.swap(initVal))

    Assert.isFalse(atom.compareAndSwap(newVal, newVal))
    Assert.isTrue(atom.compareAndSwap(initVal, newVal))

    Assert.equals(newVal, atom.load())

    return 0
}
