/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a09_01

  @Level:         1

  @Assertion: 6.1.2.4(9)
              abstract class A {
                func foo(): Unit // abstract member function
              }

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006256

*/

import utils.assert.Assert

abstract class A {
    protected func foo(): Unit // abstract member function
}

class Test <: A {
    protected func foo() {}
}

main() {
    let obj = Test()
    Assert.isTrue(obj.foo() is Unit)
}