/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_04_a08_01

  @Level:         1

  @Assertion:   7.4(8) Static properties, like static functions, can be modified with an optional
                redef, and subtypes can reimplement the static functions of the parent type.


  @Description: Checks that static property can be redefined with optional redef modifier.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

import utils.assert.Assert

open class Foo {
  static mut prop a: String {
    get() { "Foo" }
    set(v) {}
  }
}

class Foo1 <: Foo {
  static mut prop a: String {
    get() { "Foo1" }
    set(v) {}
  }
}

class Foo2 <: Foo {
  redef static mut prop a: String {
    get() { "Foo2" }
    set(v) {}
  }
}

main() {
  Assert.equals("Foo", Foo.a)
  Assert.equals("Foo1", Foo1.a)
  Assert.equals("Foo2", Foo2.a)
  return 0;
}


