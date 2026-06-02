/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_01_a09_11

  @Level:         1
  @Assertion:    15.3.1(9)
                 All above methods have a hidden parameter memory
                 order. Currently, only sequential consistency is supported.
                 Relaxed memory models with acquire/release semantics will be
                 considered in the future.

  @Description:  Checks that AtomicReference accepts memory order as additional
                 parameter for all it's methods

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
