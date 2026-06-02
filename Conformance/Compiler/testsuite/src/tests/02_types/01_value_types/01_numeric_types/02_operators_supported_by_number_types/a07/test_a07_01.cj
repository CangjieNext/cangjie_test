/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_01_02_a07_01

  @Level:         1
  @Assertion:       2.1.1.2(7) The following shows examples of arithmetic operations. The readers are referred to
                    section Arithmetic Expressions for the precedence and associativity of the arithmetic operators
                        2 + 3 // add result: 5
                        3 - 1 // sub result: 2
                        3 * 9 // mul result: 27
                        24 / 8 // div result: 3
                        7 % 3 // mod result: 1
                        2 ** 3 // power result: 8
                        5 + 15 - 2 * 10 / 4 // result: 15
                        5 + 10 - 3 * 4 ** 2 / 3 % 5 // result: 14

  @Description:     Check that the Spec example works.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  ignore
*/

import utils.assert.Assert

main() {
    2 + 3 // add result: 5
    3 - 1 // sub result: 2
    3 * 9 // mul result: 27
    24 / 8 // div result: 3
    7 % 3 // mod result: 1
    2 ** 3 // power result: 8
    5 + 15 - 2 * 10 / 4 // result: 15
    5 + 10 - 3 * 4 ** 2 / 3 % 5 // result: 14

    Assert.equals(5, 2 + 3)
    Assert.equals(2, 3 - 1)
    Assert.equals(27, 3 * 9)
    Assert.equals(3, 24 / 8)
    Assert.equals(1, 7 % 3)
    Assert.equals(8, 2 ** 3)
    Assert.equals(15, 5 + 15 - 2 * 10 / 4)
    Assert.equals(14, 5 + 10 - 3 * 4 ** 2 / 3 % 5)
}
