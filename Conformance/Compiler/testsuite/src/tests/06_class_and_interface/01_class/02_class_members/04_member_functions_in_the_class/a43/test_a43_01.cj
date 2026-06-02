/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a43_01

  @Level:         1

  @Assertion: 6.1.2.4(43)
              class C {
                static func f() {} // Cannot be overwritten and must have a function body.
              }

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class C {
    static func f() {} // Cannot be overwritten and must have a function body.
}

main() {
    Assert.isTrue(C.f() is Unit)
}