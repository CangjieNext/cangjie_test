/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_05_a03_01

  @Level:         1

  @Assertion: 6.1.5(3)
              When the user invokes this wrapper class,
              the wrapped variable is passed to the constructor of the class.

  @Description: Check that after creating an instance of the class Box
                the value of the field 'value' is equal to the wrapped value passed to the constructor

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert



main() {
    var c1 = Box<Int64>(1)
    Assert.equals(1, c1.value)

    c1 = Box<Int64>(1 + 5)
    Assert.equals(6, c1.value)

    c1 = Box<Int64>(c1.value * 2)
    Assert.equals(12, c1.value)

    c1 = Box<Int64>({ => 10}())
    Assert.equals(10, c1.value)

    c1 = Box<Int64>(Box<Int64>(11).value)
    Assert.equals(11, c1.value)
}