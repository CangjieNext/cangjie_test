/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_02_a07_02

  @Level:         1

  @Assertion:   7.2(7) Having the abstract properties of the default implementation, the
                implementation type may not provide its own implementation (which must
                conform to the rules for using the default implementation).

  @Description: Checks that property in implementation class may not provide its own implementation, if
                abstract property has default one.

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
    get() { 1 }
    set(v) {}
  }
}

class C <: I {
}

main() {
  let x = C()
  Assert.equals(0, x.i1)
  Assert.equals(1, x.i2)
  return 0;
}


