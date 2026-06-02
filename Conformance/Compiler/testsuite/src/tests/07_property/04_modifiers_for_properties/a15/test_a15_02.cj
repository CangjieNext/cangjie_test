/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_04_a15_02

  @Level:         1

  @Assertion:   7.4(15) Child types can use super to call the properties of the parent type.

  @Description: Checks that overriden property can use super.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

import utils.assert.Assert

open class A {
  var vprop: Int64 = 0
  open public mut prop i1: Int64 {
    get() { vprop }
    set(v) { vprop = v }
  }
}

class B <: A {
  override public mut prop i1: Int64 {
    get() { super.i1 + 1 }
    set(v) { super.i1 = v }
  }
}

main() {
  let x = B()
  x.i1 = 10
  Assert.equals(11, x.i1)
  return 0;
}


