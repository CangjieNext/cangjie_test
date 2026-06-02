/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_11_01_a06_04

  @Level:         1
  @Assertion:       2.1.11.1(6)   It is not allowed to define a constructor with empty parentheses, and the type of a 
  constructor without parameters is not a function type but just the type of the enum being defined.

  @Description:     Checks that empty enum constructor does not interfere with function of the same name

  @Mode:            compileonly
  @Negative:        yes
  @Structure:       single
  @Issue:           6398

  @Comment:

*/

import utils.assert.Assert

enum A {
    B | B1(Bool)
}

func B(): A { B }
func B1(b: Bool): String { if (b) {"foo"} else {"buzz"} }

main() {
    Assert.isTrue(A.B is A);
    Assert.isFalse(A.B is () -> A);
//    let b:() -> A = B
    Assert.isTrue(B1 is (Bool) -> String);
}
