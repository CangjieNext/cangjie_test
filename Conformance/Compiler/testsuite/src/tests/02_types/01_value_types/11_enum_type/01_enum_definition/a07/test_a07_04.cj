/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_11_01_a07_04

  @Level:         1
  @Assertion:       2.1.11.1(7) A constructor with parameters has a function type, but it is not a first-class citizen.

  @Description:     Checks that parameterized enum constructor does not match first-class function type

  @Mode:            run
  @Negative:        no
  @Structure:       single

  @Comment:

*/

import utils.assert.Assert

enum A {
    B1(Bool) | B2(Int32, Rune)
}

main() {
    let r: Int32 = match (B1(true)) {
      case _: (Bool) -> A => 0
      case _ => 1
   }
   Assert.equals(1, r)
}
