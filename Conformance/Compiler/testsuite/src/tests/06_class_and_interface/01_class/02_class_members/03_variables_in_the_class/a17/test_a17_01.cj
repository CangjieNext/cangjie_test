/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_03_a17_01

  @Level:         1

  @Assertion: 6.1.2.3(17)
              class C {
                static var a = 1
              }
              var r1 = C.a // ok

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class C {
    static var a = 1
}

var r1 = C.a // ok

main() {
    Assert.equals(1, C.a)
    Assert.equals(1, r1)
}

