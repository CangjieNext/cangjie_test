/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a29_01

  @Level:         1

  @Assertion: 6.1.2.4(29)
              class C {
                private func f() {}
                var a = f() // You can access f only in the current class.
              }

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006266

*/

import utils.assert.Assert

class C {
  func f1() {
    a = f()
  }
    private func f(): Int64 {  12 }
    var a:  Int64 = 13// You can access f only in the current class.
}

main() {
  let c = C()
  c.f1()
    Assert.equals(c.a, 12)
}