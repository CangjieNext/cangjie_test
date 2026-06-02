/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_01_a11_01

  @Level:         1

  @Assertion: 6.2.2.1(11)
              interface I {
                static func f1(): Unit
                static func f2(): Unit {}
                static func f3(): Unit {
                  f1()
                }
              }
              I.f1() // Error, cannot directly call
              I.f2() // OK
              I.f3() // Error, f1 not implemented

  @Description: Check that the example without erroneous lines works correctly

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006365

*/

import utils.assert.Assert

interface I {
    static func f1(): Unit
    static func f2(): Unit {}
    static func f3(): Unit {
        f1()
    }
}

main() {
    I.f2() // OK
    Assert.isTrue(I.f2() is Unit)
}