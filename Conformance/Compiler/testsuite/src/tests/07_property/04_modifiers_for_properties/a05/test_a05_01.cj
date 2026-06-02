/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_04_a05_01

  @Level:         1

  @Assertion:   7.4(5) Instance properties, like instance functions, can be modified with
                open and override.


  @Description: Checks that properties can be modified with open and override.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

import utils.assert.Assert

open class A {
  open protected mut prop a: Int64 {
    get() { 0 }
    set(v) {}
  }
}

class B <: A {
  override protected mut prop a: Int64 {
    get() { 1 }
    set(v) {}
  }
}

main() {
  let x = A()
  let y = B()
  Assert.equals(0, x.a)
  Assert.equals(1, y.a)
  return 0;
}


