/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:           02_01_11_04_a02_01

  @Level:         1

  @Assertion:      2.1.11.4(2) Here are some simple examples. 
 enum Foo {
  A | B | C
  func f1() {
   f2(this)
  }
  static func f2(v: Foo) {
   match (v) {
    case A => 0
    case B => 1
    case C => 2
   }
  }
  prop item: Int64 {
   get() {
    f1()
   }
  }
 }
 main() {
  let a = Foo.A
  a.f1()
  Foo.f2(a)
  a.item
 }

  @Description:     Checks that positive examples behave as expected

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @Issue:           0006124

  @Comment:

*/
import utils.assert.Assert


enum Foo {
    A | B | C
    func f1() {
        f2(this)
    }
    static func f2(v: Foo) {
    match (v) {
        case A => 0
        case B => 1
        case C => 2
    }
    }
    prop item: Int64 {
    get() {
        f1()
    }
    }
 }
 main() {
    let a = Foo.A
    var x = a.f1()
    var y = Foo.f2(a)
    var z = a.item

    Assert.equals(0, x)
    Assert.equals(0, y)
    Assert.equals(0, z)
 }