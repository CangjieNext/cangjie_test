/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_01_a08_02

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

  @Description:  Checks that AtomicOptionReference can only be applied to
                 instance of class extending Object

  @Mode:         compileonly
  @Negative:     yes
  @Structure:    single

*/

import std.sync.*  // Multithreading

main(): Int64 {
    let A =   AtomicOptionReference<Int32>()

    return 0
}
