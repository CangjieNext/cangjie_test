/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_01_a06_01

  @Level:         1

  @Assertion:   7.1(6) Properties declared without mut do not have a setter, and like fields
                declared with let, they cannot be assigned values.

  @Description: Checks that property without mut cannot have a setter.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       0006124


*/

class Foo {
  prop a: Int64 {
    get() {
      0
    } 
    set(v) {} 
  }
}

main() {
  var x = Foo()
  return 0;
}


