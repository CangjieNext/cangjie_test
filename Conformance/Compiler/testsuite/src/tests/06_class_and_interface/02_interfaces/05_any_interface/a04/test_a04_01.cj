/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_05_a04_01

  @Level:         1

  @Assertion: 6.2.5(4)
              class A <: Any {} // ok
              class B {} // Implicit implement Any
              extend B <: Any {} // error

  @Description: Check that the example without the incorrect line works
  
  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class A <: Any {} // ok

class B {} // Implicit implement Any

main() {
    let a = A()
    Assert.isTrue(a is Any)

    let b = B()
    Assert.isTrue(b is Any)
}