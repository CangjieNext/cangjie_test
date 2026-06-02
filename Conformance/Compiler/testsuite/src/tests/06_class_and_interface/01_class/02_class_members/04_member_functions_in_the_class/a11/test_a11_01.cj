/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a11_01

  @Level:         1

  @Assertion: 6.1.2.4(11)
              class Test {
                func foo(): Unit { // non-abstract member function
                  return
                }
              }

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class Test {
    func foo(): Unit { // non-abstract member function
        return
    }
}

main() {
    let obj = Test()
    Assert.isTrue(obj.foo() is Unit)
}