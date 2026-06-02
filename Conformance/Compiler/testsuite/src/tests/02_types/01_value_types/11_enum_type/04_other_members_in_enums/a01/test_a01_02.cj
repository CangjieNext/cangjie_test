/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:           02_01_11_04_a01_02

  @Level:         1

  @Assertion:      2.1.11.4(1) Member functions and member attributes can also be defined in enum.


  @Description:     Checks that instance member properties can be defined and used

  @Mode:            run
  @Negative:        no
  @Structure:       single

  @Issue: 0006124

*/
import utils.assert.Assert

enum E<T> {
   | A
   | B(T)
    prop x: Int64 {
        get() { 42 }
    }
    prop opt: ?T {
        get() { 
          match(this) {
          case A => None<T>
          case B(m) => Some(m)
        } 
      }
    }
}

main() {
    Assert.equals(43, B(43).opt.getOrThrow())
    Assert.equals(42, B(43).x)
    Assert.equals("abc", A<String>.opt ?? "abc")
    Assert.equals(42, A<Rune>.x)
}
