/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:           02_01_11_03_a01_01

  @Level:         1

  @Assertion:      2.1.11.3(1) A match expression and enum patterns can be applied to destructure enum values. 
  See section 4.4.1 Patterns for details.

  @Description:     Checks that enum patterns do match enum values

  @Mode:            run
  @Negative:        no
  @Structure:       single

  @Comment:

*/
import utils.assert.Assert

enum E<T> {
   | A
   | B(T)
}

main() {
    match(A<Bool>) {
      case A => ()
      case _ => Assert.fail()
    }
    match (B(0)) {
      case A | B(1) => Assert.fail()
      case B(10) => Assert.fail()
      case B(_) => ()
    }
    match (B(B(A<String>))) {
      case A | B(A) => Assert.fail()
      case _ => ()
    }
    match (B(B(A<E<Float64>>))) {
      case B(B(A)) => ()
      case _ => Assert.fail()
    }
}
