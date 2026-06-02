/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_04_a06_02

  @Level:         1

  @Assertion:   7.4(6) For properties modified with open, child types can use an optional
                override to override the implementation of the parent type.


  @Description: Checks that overriding requires open modifier of parent property.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       0006124


*/

open class Foo {
  public mut prop a: String {
    get() { "Foo" }
    set(p) {}
  }
}

class Foo1 <: Foo {
  public mut prop a: String {
    get() { "Foo1" }
    set(p) {}
  }
}

main() {
  return 0;
}


