/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_04_a06_01

  @Level:         1

  @Assertion:   7.4(6) For properties modified with open, child types can use an optional
                override to override the implementation of the parent type.


  @Description: Checks that override modifier is optional for properties in child classes.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

import utils.assert.Assert

open class Foo {
  open public mut prop a: String {
    get() { "Foo" }
    set(p) {}
  }
}

class Foo1 <: Foo {
  public mut prop a: String {
    get() { "Foo1" }
    set(p1) {}
  }
}

class Foo2 <: Foo {
  override public mut prop a: String {
    get() { "Foo2" }
    set(p2) {}
  }
}

main() {
  let x = Foo()
  let y1 = Foo1()
  let y2 = Foo2()
  Assert.equals("Foo", x.a)
  Assert.equals("Foo1", y1.a)
  Assert.equals("Foo2", y2.a)
  return 0;
}


