/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a45_01

  @Level:         1

  @Assertion: 6.1.2.4(45)
              open class C1 {
                static func f1() {}
                static func f2() {}
              }
              class C2 <: C1 {
                redef static func f1() {}
                redef static func f2() {}
              }

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

open class C1 {
    static func f1() {}
    static func f2() {}
}
class C2 <: C1 {
    redef static func f1() {}
    redef static func f2() {}
}

main() {
    Assert.isTrue(C1.f1() is Unit)
    Assert.isTrue(C1.f2() is Unit)
    Assert.isTrue(C2.f1() is Unit)
    Assert.isTrue(C2.f2() is Unit)
}