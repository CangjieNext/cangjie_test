/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_04_a10_01

  @Level:         1

  @Assertion:   7.4(10) Subtype override/redef Instance properties declared using let
                must be reimplemented as getters.


  @Description: Checks redefining & overriding of let properties.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

import utils.assert.Assert

open class Foo {
  open protected prop a: String {
    get() { "Foo" }
  }
  static prop b: String {
    get() { "Foo_static" }
  }
}

class Foo1 <: Foo {
  override protected prop a: String {
    get() { "Foo1" }
  }
  redef static prop b: String {
    get() { "Foo1_static" }
  }
}

main() {
  let x = Foo()
  let y = Foo1()
  Assert.equals("Foo", x.a)
  Assert.equals("Foo1", y.a)
  Assert.equals("Foo_static", Foo.b)
  Assert.equals("Foo1_static", Foo1.b)
  return 0;
}


