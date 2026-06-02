/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_03_a11_01

  @Level:         1

  @Assertion: 6.1.2.3(11)
              class C {
                private var a = 1
                func getA() { a }
                func setA(value: Int64) {
                  this.a = value
                }
              }

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class C {
    private var a = 1
    func getA() { a }
    func setA(value: Int64) {
        this.a = value
    }
}

main() {
    let c = C()
    Assert.equals(1, c.getA())
    c.setA(90)
    Assert.equals(90, c.getA())
}
