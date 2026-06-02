/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a45_01

  @Level:         1

  @Assertion: 6.1.2.1(45)
              class C {
                init() {}
                init(name: String, age: Int32) {}
              }

  @Description: Check that the class from the example can be instantiated with both constructors

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class C {
  init() {}
  init(name: String, age: Int32) {}
}

main() {
  let c1 = C()
  Assert.isTrue(c1 is C)

  let c2 = C("name", 1)
  Assert.isTrue(c2 is C)
}