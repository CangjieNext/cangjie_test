/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_04_a11_01

  @Level:         1

  @Assertion:   7.4(11) Subtype override/redef instance properties declared with mut modifier
                are allowed to reimplement either getter or setter separately, i.e. they can
                reimplement only setter without reimplementing getter or only getter without
                reimplementing setter, but not both.


  @Description: Checks that reimplementing only getter without reimplementing setter is allowed.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

import utils.assert.Assert

var str_a: String = ""
var str_b: String = ""

open class Foo {
  open protected mut prop a: String {
    get() { "Foo" }
    set(v) { str_a = "Foo " + v }
  }
  static mut prop b: String {
    get() { "Foo_static" }
    set(v) { str_b = "Foo_static " + v }
  }
}

class Foo1 <: Foo {
  override protected mut prop a: String {
    get() { "Foo1" }
  }
  redef static mut prop b: String {
    get() { "Foo1_static" }
  }
}

main() {
  let x = Foo()
  x.a = "A"
  Foo.b = "B"
  Assert.equals("Foo", x.a)
  Assert.equals("Foo A", str_a)
  Assert.equals("Foo_static", Foo.b)
  Assert.equals("Foo_static B", str_b)

  let x1 = Foo1()
  x1.a = "A"
  Foo1.b = "B"
  Assert.equals("Foo1", x1.a)
  Assert.equals("Foo A", str_a)
  Assert.equals("Foo1_static", Foo1.b)
  Assert.equals("Foo_static B", str_b)

  return 0;
}


