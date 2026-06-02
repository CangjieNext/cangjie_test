/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_04_a10_03

  @Level:         1

  @Assertion:   7.4(10) Subtype override/redef Instance properties declared using let
                must be reimplemented as getters.


  @Description: Checks that redefining of let property must be let property.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       0006124


*/

open class Foo {
  static prop b: String {
    get() { "Foo_static" }
  }
}

class Foo1 <: Foo {
  redef static mut prop b: String {
    get() { "Foo1_static" }
    set(v) { }
  }
}

main() {
  return 0;
}


