/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_02_a06_01

  @Level:         1

  @Assertion:   7.2(6) Just as an abstract function in an interface can have a default implementation,
                so can an abstract property in an interface have a default implementation.

  @Description: Checks that abstract property in interface can have default implementation.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

import utils.assert.Assert

interface I {
  prop i1: Int64 {
    get() { 0 }
  }
  mut prop i2: Int64 {
    get() { 0 }
    set(v) {}
  }
}

class C1 <: I {
  public prop i1: Int64 {
    get() { 1 }
  }
  public mut prop i2: Int64 {
    get() { 1 }
    set(v) { print("${v}") }
  }
}

class C2 <: I {
}

main() {
  let x1 = C1()
  let x2 = C2()
  Assert.equals(1, x1.i1)
  Assert.equals(0, x2.i1)
  return 0;
}


