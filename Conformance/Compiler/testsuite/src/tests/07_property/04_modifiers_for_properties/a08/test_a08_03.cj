/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_04_a08_03

  @Level:         1

  @Assertion:   7.4(8) Static properties, like static functions, can be modified with an optional
                redef, and subtypes can reimplement the static functions of the parent type.


  @Description: Checks that instance property cannot be redefined.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       0006124


*/

open class Foo {
  mut prop a: String {
    get() { "Foo" }
    set(v) {}
  }
}

class Foo1 <: Foo {
  mut prop a: String {
    get() { "Foo1" }
    set(v) {}
  }
}

main() {
  return 0;
}


