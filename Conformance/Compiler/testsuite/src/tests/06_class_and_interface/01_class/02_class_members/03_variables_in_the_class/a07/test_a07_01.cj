/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_03_a07_01

  @Level:         1

  @Assertion: 6.1.2.3(7)
              class C {
                public var a = 1
              }

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class C {
    public var a = 1
}

main() {
    let c = C()
    Assert.equals(1, c.a)
    c.a = 2
    Assert.equals(2, c.a)
}