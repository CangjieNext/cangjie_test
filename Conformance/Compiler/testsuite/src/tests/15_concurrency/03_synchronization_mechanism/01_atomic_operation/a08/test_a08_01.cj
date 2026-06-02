/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_01_a08_01

  @Level:         1
  @Assertion:    15.3.1(8) Besides, AtomicOptionReference can be used to
                 store NULL references, which are represented as None values.
    class AtomicOptionReference <T>where T <: Object {
        public init (val :Option(T))
        public func load ():Option <T>
        public func store (val :Option <T>):Unit
        public func swap (val :Option <T>):Option <T>
        public func compareAndSwap (old :Option <T>,new:Option <T>):Bool
    }

  @Description:  Checks that AtomicOptionReference contains all necessary
                 operations and can store NULL references, which are
                 represented as None values.

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../helper.cj

*/

import std.sync.*  // Multithreading
import utils.assert.Assert

main(): Int64 {
    let initVal:?MyClass = MyClass(156789)
    let newVal:?MyClass = MyClass(-98342)
    let nullVal:?MyClass = Option<MyClass>.None
    let atom = AtomicOptionReference<MyClass>(initVal)

    Assert.equals(initVal, atom.load())
    Assert.isTrue(atom.store(newVal) is Unit)

    Assert.equals(newVal, atom.swap(initVal))

    Assert.isFalse(atom.compareAndSwap(newVal, newVal))
    Assert.isTrue(atom.compareAndSwap(initVal, newVal))

    Assert.equals(newVal, atom.load())

    Assert.isTrue(atom.store(nullVal) is Unit)
    let val:?MyClass = atom.load()
    Assert.isNone(val)

    return 0
}
