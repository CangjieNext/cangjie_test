/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_11_01_a06_03

  @Level:         1
  @Assertion:       2.1.11.1(6)   It is not allowed to define a constructor with empty parentheses, and the type of a 
  constructor without parameters is not a function type but just the type of the enum being defined.

  @Description:     Checks type of empty enum constructor

  @Mode:            run
  @Negative:        no
  @Structure:       single

  @Comment:

*/

import utils.assert.Assert

enum A {
    B | B1(Bool)
}

main() {
    Assert.isTrue(B is A);
    Assert.isFalse(B is () -> A);
}
