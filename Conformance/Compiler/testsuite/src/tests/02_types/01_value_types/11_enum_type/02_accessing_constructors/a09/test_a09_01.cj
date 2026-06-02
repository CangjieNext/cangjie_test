/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_11_02_a09_01

  @Level:         1

  @Assertion:       2.1.11.2(9) Only the only enum constructor that is considered capable of resolution.


  @Description:     Checks that sole matching enum ctor can be used w/o prefix

  @Mode:            run
  @Negative:        no
  @Structure:       single

*/
import utils.assert.Assert

enum E { F }
enum E2 { F(Bool) }

main() {
    Assert.isTrue(F(true) is E2)
    Assert.isTrue(F is E)
}
