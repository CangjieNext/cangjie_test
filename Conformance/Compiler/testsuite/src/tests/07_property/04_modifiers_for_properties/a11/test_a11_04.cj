/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_04_a11_04

  @Level:         1

  @Assertion:   7.4(11) Subtype override/redef instance properties declared with mut modifier
                are allowed to reimplement either getter or setter separately, i.e. they can
                reimplement only setter without reimplementing getter or only getter without
                reimplementing setter, but not both.


  @Description: Checks that reimplementing getter or setter is required.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       0006124


*/

open class Foo {
  open protected mut prop a: String {
    get() { "Foo" }
    set(v) { str_a = "Foo " + v }
  }
}

class Foo4 <: Foo {
  override protected mut prop a: String {
  }
}

main() {
  return 0;
}


