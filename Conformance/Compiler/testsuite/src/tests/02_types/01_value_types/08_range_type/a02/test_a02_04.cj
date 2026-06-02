/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_08_a02_04

  @Level:         1
  @Assertion:       2.1.8(2) In above, the Comparable constrains instances of type T to be
                    comparable using the relational operator, and the AddInt64 constrains
                    instances of type T can be added with values of type Int64.

  @Description:     Checks that T must implement Comparable interface.

  @Mode:            compileonly
  @Negative:        yes
  @Structure:       single
  @Issue:           0006079

*/

public class TestA0204 <: Countable<A> & Equatable<A> {
  public var value: Int64
  public init(val: Int64) {
    value = val
  }
  // Equatable interface
  public operator func ==(that: A): Bool {
    value == that.value
  }
  public operator func !=(that: A): Bool {
    value != that.value
  }

  // Countable interface
  public func next(right: Int64): A {
    A(value + right)
  }
  public func position(): Int64 {
    value.position()
  }
}

func range<T>(a: T, b: T, c: Int64): Range<T> where T <: Countable<T> & Comparable<T> {
  a..b
}

main() {
  let x = TestA0204(2)
  let y = TestA0204(10)
  let r1 = range(x, y, 3)
  return 0
}
